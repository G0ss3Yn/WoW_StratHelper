SLASH_STRAT1 = "/strat";

local stratDB = {} ;

stratDB["noid"] = {"Pas de stratégie associée", "Au boulot ! :)" } ;
stratDB["184170"] = {"Ceci est un test.", "Merci de votre participation !"} ;

local function UnitsAround()
	local plate = 0
	for idx = 1, 40, 1
	do
		if(UnitExists("nameplate" .. idx)) then
			print(UnitName("nameplate"..idx)) ;
		else
			break ;
		end
	end
end

local function PrintStrat(id, type)
	if(type == "target") then
		print("NPC ID : " .. id) ;
		local msg = stratDB[id] ;
		if(msg == nil) then
			msg = stratDB["noid"] ;
		end
		for i=1, #(msg) do
			print( msg[i] );
		end
		
		
	elseif(type == "map") then
		print("Zone ID : " .. id) ;
		print("Zone name : "..C_Map.GetMapInfo(id).name)
		UnitsAround()
	else
		print("Pas de stratégie associée.") ;
		
	end
end

local function StratHandler()
	local guid, name, zoneID = UnitGUID("target"), UnitName("target"), C_Map.GetBestMapForUnit("player") ;
	if( (guid) and (name) and zoneID ) then
		
		print("Debug GUID: " .. guid) ;
		print("Debug Name: " .. name) ;
		print("Debug Map : " .. zoneID) ;

		local npcID = select(6, strsplit("-", guid)) ;

		if(npcID) then
			PrintStrat(npcID, "target") ;
		else
			print("Erreur NPC ID : " .. npcID) ;
		end
	elseif(zoneID) then
		PrintStrat(zoneID, "map") ;
	end
end

SlashCmdList["STRAT"] = StratHandler ;