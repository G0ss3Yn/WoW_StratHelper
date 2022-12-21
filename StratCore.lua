local AddOnName, this = ... ;
this.stratDB = {} ;

this.stratDB["noid"] = {"Pas de stratégie associée", "Au boulot ! :)" } ;

--[[ Print nameplates displayed --]]
function this:UnitsAround()
	local plate = 0
	for idx = 1, 40, 1
	do
		if(UnitExists("nameplate" .. idx)) then
			print(GetUnitName("nameplate"..idx, false)) ;
		else
			break ;
		end
	end
end

--[[ Print strategy if known --]]
function this:PrintStrat(id, type)

	--[[ Target type strategy --]]
	if(type == "target") then
		print("NPC ID : " .. id) ;
		local msg = this.stratDB[id] ;
		if(msg == nil) then
			msg = this.stratDB["noid"] ;
		end
		for i=1, #(msg) do
			print( msg[i] );
		end
		
	--[[ No target, try map type strategy --]]
	elseif(type == "map") then
		print("Zone ID : " .. id) ;
		print("Zone name : "..C_Map.GetMapInfo(id).name)
		this:UnitsAround()
	else
		print("Pas de stratégie associée.") ;
		
	end
end