//	@file Version: 1.0
//	@file Name: HvT.sqf
//	@file Author: Cael817, CRE4MPIE, rewrite by LouD.
//	@file Info:

if (isDedicated) exitWith {};
waitUntil {!isNull player};
waitUntil {!isNil "playerSpawning" && {!playerSpawning}};

for "_i" from 0 to 1 step 0 do 
{
	if (isNil "createBountyMarker" && player getvariable "cmoney" > 499999) then // Más de 499 999 quiere decir, básicamente a partir de 500 000 pesos
		{
			_title  = "<t color='#ff0000' size='1.2' align='center'>Milloneta! </t><br />";
			_name = format ["%1<br /> ",name player];     
			_text = "<t color='#FFFFFF' shadow='1' shadowColor='#000000' align='center'>Con tanto dinero encima, podrías perderlo todo. Tu posición está marcada en el mapa para todos los jugadores. Corre!</t><br />";     
			hint parsetext (_title +  _name +  _text); 
			playsound "Topic_Done";

			createBountyMarker = 
			{
				_markerName = format ["%1_bountyMarker",name player];  
				_bountyMarker = createMarker [_markerName, getPos (vehicle player)];
				_bountyMarker setMarkerShape "ICON";
				_bounty = [player getVariable ["cmoney", 0]] call fn_numbersText;
				_bountyMarker setMarkerText (format ["Milloneta: %1 (%2$)", name player, _bounty]);
				_bountyMarker setMarkerColor "ColorPink";
				_bountyMarker setMarkerType "loc_Bunker";
				sleep 45;
				deleteMarker _markerName;
				createBountyMarker = nil;
			};
		[] spawn createBountyMarker;	
		};
}; //will run infinitely
