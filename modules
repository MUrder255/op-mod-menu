-- ✅ Load ArrayField UI Framework
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()
getgenv().Modules = {}

-- 🌐 Replace with your hosted RAW GitHub folder:
local rawBaseURL = "https://raw.githubusercontent.com/YOUR_USER/YOUR_REPO/main/modules/"

-- 🔁 Load all modules from folder
local function LoadModules()
    local files = {
        "esp.lua",
        "aimbot.lua"
        -- Add more here (autofarm.lua, etc.)
    }
    for _, file in ipairs(files) do
        local content = game:HttpGet(rawBaseURL .. file)
        local name = file:gsub(".lua", "")
        Modules[name] = loadstring(content)()
    end
end

LoadModules()

-- 🌈 Create Window
local Window = Rayfield:CreateWindow({
    Name = "ArrayField Mod Menu",
    LoadingTitle = "ArrayField UI",
    LoadingSubtitle = "Powered by Lua GOD 🔥",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "ArrayfieldConfig",
        FileName = "MainConfig"
    },
    KeySystem = false
})

-- 📁 Main Tab
local MainTab = Window:CreateTab("Main", 4483362458)
local Section = MainTab:CreateSection("🔥 Core Features")

-- ✅ ESP Toggle
MainTab:CreateToggle({
    Name = "ESP",
    Info = "Toggles 3D ESP (Boxes & Names)",
    CurrentValue = false,
    Flag = "ESP_TOGGLE",
    Callback = function(Value)
        Modules.esp.Toggle(Value)
    end,
})

-- ✅ Aimbot Toggle
MainTab:CreateToggle({
    Name = "Aimbot",
    Info = "Locks onto closest player",
    CurrentValue = false,
    Flag = "AIMBOT_TOGGLE",
    Callback = function(Value)
        Modules.aimbot.Toggle(Value)
    end,
})

-- 💬 Add more toggles for other modules below...
