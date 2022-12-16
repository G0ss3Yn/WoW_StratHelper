SLASH_STRAT1 = "/strat";

local function PrintStrat(id, type)
	if(type == "target") then
		print("NPC ID : " .. id) ;
	
	elseif(type == "map") then
		print("Zone ID : " .. id) ;
	else
		print("Pas de stratégie associée.") ;
		
	end

end

local function StratHandler()
	local guid, name, zoneID = UnitGUID("target"), UnitName("target"), C_Map.GetBestMapForUnit("player") ;
	if( (guid) and (name) and (zoneID) ) then
		
		print("Debug GUID: " .. guid) ;
		print("Debug Name: " .. name) ;
		print("Debug Map : " .. zoneID) ;

		local npcID = select(6, strsplit("-", guid)) ;

		if(npcID) then
			PrintStrat(npcID, "target") ;
		else
			PrintStrat(zoneID, "map") ;
		end
	end
end

SlashCmdList["STRAT"] = StratHandler ;