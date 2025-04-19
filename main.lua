-- GhostX Universal Executor - main.lua

-- Load Init
local success, err = pcall(function()
    loadfile("init.lua")()
end)

if not success then
    warn("[GhostX Init Error] " .. tostring(err))
end
