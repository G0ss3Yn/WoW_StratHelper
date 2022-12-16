SLASH_STRAT0 = "/strat"
SLASH_STRAT1 = "/sh"

local function StratHandler(name)
	local guid, name = UnitGUID("target"), UnitName("target");
	if(guid) then
		print(name .. " NPC ID : " .. tonumber(guid:sub(6,10), 16))
	else
		print("Pas de stratégie associée.")
	end
end

SlashCmdList["STRAT"] = StratHandler;