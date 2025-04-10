-- modules/aimbot.lua
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local Enabled = false
local AimPart = "Head"
local AimRadius = 300 -- adjustable
local Smoothing = 0.15 -- lower is faster

local function GetClosestPlayer()
    local closestPlayer, shortestDistance = nil, AimRadius
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild(AimPart) then
            local part = player.Character[AimPart]
            local screenPoint, onScreen = Camera:WorldToViewportPoint(part.Position)
            if onScreen then
                local dist = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(screenPoint.X, screenPoint.Y)).Magnitude
                if dist < shortestDistance then
                    closestPlayer = player
                    shortestDistance = dist
                end
            end
        end
    end
    return closestPlayer
end

RunService.RenderStepped:Connect(function()
    if Enabled then
        local target = GetClosestPlayer()
        if target and target.Character and target.Character:FindFirstChild(AimPart) then
            local aimPos = target.Character[AimPart].Position
            local camPos = Camera.CFrame.Position
            local newCFrame = CFrame.new(camPos, camPos:Lerp(aimPos, Smoothing))
            Camera.CFrame = newCFrame
        end
    end
end)

return {
    Toggle = function(state)
        Enabled = state
    end
}
