local function DisableAddonProfiler()
    C_CVar.RegisterCVar("addonProfilerEnabled", "1")
    C_CVar.SetCVar("addonProfilerEnabled", "0")
    
    -- Check the actual value after setting it
    local profilerState = C_CVar.GetCVar("addonProfilerEnabled")
    if profilerState == "0" then
        print("Blizzard Addon Profiler is disabled")
    else
        print("Warning: Addon Profiler is still enabled (value: " .. tostring(profilerState) .. ")")
    end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        DisableAddonProfiler()
    end
end)