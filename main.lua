SLASH_STRAT1 = "/strat"

local function StratHandler(name)
    if(string.len(name) > 0) then
        message("Hello, " .. name .. "!")
    else
        local playerName = UnitName("player")
        message("Hello, " .. playerName .. "!")
    end
end

SlashCmdList["STRAT"] = StratHandler;