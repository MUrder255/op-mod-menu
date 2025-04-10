-- modules/esp.lua
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local ESPEnabled = false
local ESPObjects = {}

local function CreateESP(plr)
    if plr == LocalPlayer then return end
    local box = Drawing.new("Square")
    box.Thickness = 2
    box.Transparency = 1
    box.Color = Color3.fromRGB(0, 255, 255)
    box.Filled = false

    local name = Drawing.new("Text")
    name.Color = Color3.fromRGB(255,255,255)
    name.Size = 16
    name.Center = true
    name.Outline = true
    name.Font = 2
    name.Visible = false

    ESPObjects[plr] = {Box = box, Name = name}
end

local function RemoveESP(plr)
    if ESPObjects[plr] then
        ESPObjects[plr].Box:Remove()
        ESPObjects[plr].Name:Remove()
        ESPObjects[plr] = nil
    end
end

local function UpdateESP()
    for plr, esp in pairs(ESPObjects) do
        local char = plr.Character
        if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("Humanoid") and char.Humanoid.Health > 0 then
            local hrp = char.HumanoidRootPart
            local pos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(hrp.Position)
            if onScreen then
                local sizeY = 1000 / (hrp.Position - workspace.CurrentCamera.CFrame.Position).Magnitude
                local sizeX = sizeY / 2
                esp.Box.Size = Vector2.new(sizeX, sizeY)
                esp.Box.Position = Vector2.new(pos.X - sizeX / 2, pos.Y - sizeY / 2)
                esp.Box.Visible = ESPEnabled

                esp.Name.Text = plr.DisplayName
                esp.Name.Position = Vector2.new(pos.X, pos.Y - sizeY / 2 - 16)
                esp.Name.Visible = ESPEnabled
            else
                esp.Box.Visible = false
                esp.Name.Visible = false
            end
        else
            esp.Box.Visible = false
            esp.Name.Visible = false
        end
    end
end

-- Monitor new players
Players.PlayerAdded:Connect(CreateESP)
Players.PlayerRemoving:Connect(RemoveESP)
for _, plr in pairs(Players:GetPlayers()) do CreateESP(plr) end

RunService.RenderStepped:Connect(UpdateESP)

return {
    Toggle = function(state)
        ESPEnabled = state
    end
}
