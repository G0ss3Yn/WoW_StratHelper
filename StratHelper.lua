local AOName, this = ... ;
SLASH_STRAT1 = "/strat";


local function StratHandler()
	local guid, name, zoneID = UnitGUID("target"), UnitName("target"), C_Map.GetBestMapForUnit("player") ;
	if( (guid) and (name) and zoneID ) then
		
		print("Debug GUID: " .. guid) ;
		print("Debug Name: " .. name) ;
		print("Debug Map : " .. zoneID) ;

		local npcID = select(6, strsplit("-", guid)) ;

		if(npcID) then
			this:PrintStrat(npcID, "target") ;
		else
			print("Erreur NPC ID : " .. npcID) ;
		end
	elseif(zoneID) then
		this:PrintStrat(zoneID, "map") ;
	end
end

SlashCmdList["STRAT"] = StratHandler ;