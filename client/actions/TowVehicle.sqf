/*
Author: GMG_Monkey
Filename: TowVehicle.sqf
Purpose: Allow Vehicles to tow other vehicles
*/

//Setup Variables
_TowedVehicle = curosrtarget;
_TowingVehicle = nearestObject [TowedVehicle, "AllVehicles"];
_TowedPOS = getpos _TowedVehicle
_TowingPOS = getPos _TowingVehicle;
_distance = _TowedVehicle distance _TowingVehicle;

if (_distance <=15) then 
{
	switch (true) do
	{
		// Offroad Towing
		case (_TowingVehicle iskindof "Offroad_01_base_F"):
		{
			switch (true) do
			{
				//Offroad Towed
				case (_TowedVehicle isKindOf "Offroad_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [0.0999999,-6.1,0.2]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Box Truck Towed
				case (_TowedVehicle isKindOf "Van_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-7.45058e-008,-5.6,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Van Towed
				case (_TowedVehicle isKindOf "Van_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-7.45058e-008,-7.2,0.2]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//HEMMT Towed
				case (_TowedVehicle isKindOf "Truck_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-7.45058e-008,-7.4,0.2]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Hunter Towed
				case (_TowedVehicle isKindOf "MRAP_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-7.45058e-008,-5.1,0.5]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Prowler Towed
				case (_TowedVehicle isKindOf "LSV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-7.45058e-008,-5.4,0.7]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Marshall Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-7.45058e-008,-6.6,1]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Cheetah/Bobcat/Panther Towed
				case (_TowedVehicle isKindOf "APC_Tracked_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [0.0999999,-7.1,1.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Slammer/Scorcher/Sandstorm Towed
				case (_TowedVehicle isKindOf "MBT_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.1,-6,0.6]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hummingbird Towed
				case (_TowedVehicle isKindOf "Heli_Light_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfoot Towed
				case (_TowedVehicle isKindOf "Heli_Attack_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Huron Towed
				case (_TowedVehicle isKindOf "Heli_Transport_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ghosthawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ababil/Greyhawk Towed
				case (_TowedVehicle isKindOf "UAV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Sentinel Towed
				case (_TowedVehicle isKindOf "UAV_05_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackwasp Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_01_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Wipeout Towed
				case (_TowedVehicle isKindOf "Plane_CAS_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfish Towed
				case (_TowedVehicle isKindOf "VTOL_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Speedboat (Armed) towed
				case (_TowedVehicle isKindOf "Boat_Armed_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Qillin Towed
				case (_TowedVehicle isKindOf "LSV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Ifrit Towed
				case (_TowedVehicle isKindOf "MRAP_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Tempest Towed
				case (_TowedVehicle isKindOf "Truck_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zamak Towed
				case (_TowedVehicle isKindOf "Truck_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Marid Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kamish/Tigris
				case (_TowedVehicle isKindOf "APC_Tracked_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Varsuk/Socher
				case (_TowedVehicle isKindOf "MBT_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Orca Towed
				case (_TowedVehicle isKindOf "Heli_Light_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Taru Towed
				case (_TowedVehicle isKindOf "Heli_Transport_04_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//kajman Towed
				case (_TowedVehicle isKindOf "Heli_Attack_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Neophran Towed
				case (_TowedVehicle isKindOf "Plane_CAS_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Shikra Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_02_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Xian Towed
				case (_TowedVehicle isKindOf "VTOL_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Strider Towed
				case (_TowedVehicle isKindOf "MRAP_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gorgon Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mora Towed
				case (_TowedVehicle isKindOf "APC_Tracked_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kuma Towed
				case (_TowedVehicle isKindOf "MBT_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hellcat Towed
				case (_TowedVehicle isKindOf "Heli_light_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mohawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Buzzard Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gryphon Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_04_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// hatchback Towed
				case (_TowedVehicle isKindOf "Hatchback_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Jeep Towed
				case (_TowedVehicle isKindOf "Offroad_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//SUV Towed
				case (_TowedVehicle isKindOf "SUV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zodiak Towed
				case (_TowedVehicle isKindOf "Rubber_duck_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// RHIB Towed
				case (_TowedVehicle isKindOf "Boat_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Civilian Speedboat Towed
				case (_TowedVehicle isKindOf "Boat_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ceaser Towed
				case (_TowedVehicle isKindOf "Plane_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
			}
		};
		// BoxTruck Towing
		case (_TowingVehicle iskindof "Van_01_base_F"):
		{
			switch (true) do
			{
				//Offroad Towed
				case (_TowedVehicle isKindOf "Offroad_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [0.0999999,-6.1,0.2]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Box Truck Towed
				case (_TowedVehicle isKindOf "Van_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Van Towed
				case (_TowedVehicle isKindOf "Van_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//HEMMT Towed
				case (_TowedVehicle isKindOf "Truck_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Hunter Towed
				case (_TowedVehicle isKindOf "MRAP_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Prowler Towed
				case (_TowedVehicle isKindOf "LSV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Marshall Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Cheetah/Bobcat/Panther Towed
				case (_TowedVehicle isKindOf "APC_Tracked_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Slammer/Scorcher/Sandstorm Towed
				case (_TowedVehicle isKindOf "MBT_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hummingbird Towed
				case (_TowedVehicle isKindOf "Heli_Light_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfoot Towed
				case (_TowedVehicle isKindOf "Heli_Attack_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Huron Towed
				case (_TowedVehicle isKindOf "Heli_Transport_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ghosthawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ababil/Greyhawk Towed
				case (_TowedVehicle isKindOf "UAV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Sentinel Towed
				case (_TowedVehicle isKindOf "UAV_05_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackwasp Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_01_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Wipeout Towed
				case (_TowedVehicle isKindOf "Plane_CAS_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfish Towed
				case (_TowedVehicle isKindOf "VTOL_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Speedboat (Armed) towed
				case (_TowedVehicle isKindOf "Boat_Armed_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Qillin Towed
				case (_TowedVehicle isKindOf "LSV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Ifrit Towed
				case (_TowedVehicle isKindOf "MRAP_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Tempest Towed
				case (_TowedVehicle isKindOf "Truck_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zamak Towed
				case (_TowedVehicle isKindOf "Truck_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Marid Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kamish/Tigris
				case (_TowedVehicle isKindOf "APC_Tracked_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Varsuk/Socher
				case (_TowedVehicle isKindOf "MBT_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Orca Towed
				case (_TowedVehicle isKindOf "Heli_Light_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Taru Towed
				case (_TowedVehicle isKindOf "Heli_Transport_04_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//kajman Towed
				case (_TowedVehicle isKindOf "Heli_Attack_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Neophran Towed
				case (_TowedVehicle isKindOf "Plane_CAS_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Shikra Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_02_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Xian Towed
				case (_TowedVehicle isKindOf "VTOL_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Strider Towed
				case (_TowedVehicle isKindOf "MRAP_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gorgon Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mora Towed
				case (_TowedVehicle isKindOf "APC_Tracked_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kuma Towed
				case (_TowedVehicle isKindOf "MBT_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hellcat Towed
				case (_TowedVehicle isKindOf "Heli_light_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mohawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Buzzard Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gryphon Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_04_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// hatchback Towed
				case (_TowedVehicle isKindOf "Hatchback_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Jeep Towed
				case (_TowedVehicle isKindOf "Offroad_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//SUV Towed
				case (_TowedVehicle isKindOf "SUV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zodiak Towed
				case (_TowedVehicle isKindOf "Rubber_duck_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// RHIB Towed
				case (_TowedVehicle isKindOf "Boat_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Civilian Speedboat Towed
				case (_TowedVehicle isKindOf "Boat_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ceaser Towed
				case (_TowedVehicle isKindOf "Plane_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
			}
		};
		// Van Towing
		case (_TowingVehicle iskindof "Van_02_base_F"):
		{
			switch (true) do
			{
				//Offroad Towed
				case (_TowedVehicle isKindOf "Offroad_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [0.0999999,-6.2,0.2]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Box Truck Towed
				case (_TowedVehicle isKindOf "Van_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Van Towed
				case (_TowedVehicle isKindOf "Van_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//HEMMT Towed
				case (_TowedVehicle isKindOf "Truck_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Hunter Towed
				case (_TowedVehicle isKindOf "MRAP_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Prowler Towed
				case (_TowedVehicle isKindOf "LSV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Marshall Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Cheetah/Bobcat/Panther Towed
				case (_TowedVehicle isKindOf "APC_Tracked_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Slammer/Scorcher/Sandstorm Towed
				case (_TowedVehicle isKindOf "MBT_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hummingbird Towed
				case (_TowedVehicle isKindOf "Heli_Light_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfoot Towed
				case (_TowedVehicle isKindOf "Heli_Attack_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Huron Towed
				case (_TowedVehicle isKindOf "Heli_Transport_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ghosthawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ababil/Greyhawk Towed
				case (_TowedVehicle isKindOf "UAV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Sentinel Towed
				case (_TowedVehicle isKindOf "UAV_05_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackwasp Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_01_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Wipeout Towed
				case (_TowedVehicle isKindOf "Plane_CAS_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfish Towed
				case (_TowedVehicle isKindOf "VTOL_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Speedboat (Armed) towed
				case (_TowedVehicle isKindOf "Boat_Armed_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Qillin Towed
				case (_TowedVehicle isKindOf "LSV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Ifrit Towed
				case (_TowedVehicle isKindOf "MRAP_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Tempest Towed
				case (_TowedVehicle isKindOf "Truck_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zamak Towed
				case (_TowedVehicle isKindOf "Truck_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Marid Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kamish/Tigris
				case (_TowedVehicle isKindOf "APC_Tracked_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Varsuk/Socher
				case (_TowedVehicle isKindOf "MBT_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Orca Towed
				case (_TowedVehicle isKindOf "Heli_Light_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Taru Towed
				case (_TowedVehicle isKindOf "Heli_Transport_04_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//kajman Towed
				case (_TowedVehicle isKindOf "Heli_Attack_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Neophran Towed
				case (_TowedVehicle isKindOf "Plane_CAS_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Shikra Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_02_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Xian Towed
				case (_TowedVehicle isKindOf "VTOL_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Strider Towed
				case (_TowedVehicle isKindOf "MRAP_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gorgon Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mora Towed
				case (_TowedVehicle isKindOf "APC_Tracked_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kuma Towed
				case (_TowedVehicle isKindOf "MBT_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hellcat Towed
				case (_TowedVehicle isKindOf "Heli_light_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mohawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Buzzard Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gryphon Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_04_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// hatchback Towed
				case (_TowedVehicle isKindOf "Hatchback_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Jeep Towed
				case (_TowedVehicle isKindOf "Offroad_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//SUV Towed
				case (_TowedVehicle isKindOf "SUV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zodiak Towed
				case (_TowedVehicle isKindOf "Rubber_duck_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// RHIB Towed
				case (_TowedVehicle isKindOf "Boat_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Civilian Speedboat Towed
				case (_TowedVehicle isKindOf "Boat_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ceaser Towed
				case (_TowedVehicle isKindOf "Plane_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
			}
		};
		// HEMMT Towing
		case (_TowingVehicle iskindof "Truck_01_base_F"):
		{
			switch (true) do
			{
				//Offroad Towed
				case (_TowedVehicle isKindOf "Offroad_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [0.0999999,-7.6,-7.45058e-008]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Box Truck Towed
				case (_TowedVehicle isKindOf "Van_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Van Towed
				case (_TowedVehicle isKindOf "Van_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//HEMMT Towed
				case (_TowedVehicle isKindOf "Truck_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Hunter Towed
				case (_TowedVehicle isKindOf "MRAP_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Prowler Towed
				case (_TowedVehicle isKindOf "LSV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Marshall Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Cheetah/Bobcat/Panther Towed
				case (_TowedVehicle isKindOf "APC_Tracked_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Slammer/Scorcher/Sandstorm Towed
				case (_TowedVehicle isKindOf "MBT_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hummingbird Towed
				case (_TowedVehicle isKindOf "Heli_Light_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfoot Towed
				case (_TowedVehicle isKindOf "Heli_Attack_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Huron Towed
				case (_TowedVehicle isKindOf "Heli_Transport_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ghosthawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ababil/Greyhawk Towed
				case (_TowedVehicle isKindOf "UAV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Sentinel Towed
				case (_TowedVehicle isKindOf "UAV_05_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackwasp Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_01_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Wipeout Towed
				case (_TowedVehicle isKindOf "Plane_CAS_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfish Towed
				case (_TowedVehicle isKindOf "VTOL_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Speedboat (Armed) towed
				case (_TowedVehicle isKindOf "Boat_Armed_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Qillin Towed
				case (_TowedVehicle isKindOf "LSV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Ifrit Towed
				case (_TowedVehicle isKindOf "MRAP_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Tempest Towed
				case (_TowedVehicle isKindOf "Truck_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zamak Towed
				case (_TowedVehicle isKindOf "Truck_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Marid Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kamish/Tigris
				case (_TowedVehicle isKindOf "APC_Tracked_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Varsuk/Socher
				case (_TowedVehicle isKindOf "MBT_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Orca Towed
				case (_TowedVehicle isKindOf "Heli_Light_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Taru Towed
				case (_TowedVehicle isKindOf "Heli_Transport_04_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//kajman Towed
				case (_TowedVehicle isKindOf "Heli_Attack_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Neophran Towed
				case (_TowedVehicle isKindOf "Plane_CAS_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Shikra Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_02_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Xian Towed
				case (_TowedVehicle isKindOf "VTOL_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Strider Towed
				case (_TowedVehicle isKindOf "MRAP_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gorgon Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mora Towed
				case (_TowedVehicle isKindOf "APC_Tracked_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kuma Towed
				case (_TowedVehicle isKindOf "MBT_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hellcat Towed
				case (_TowedVehicle isKindOf "Heli_light_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mohawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Buzzard Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gryphon Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_04_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// hatchback Towed
				case (_TowedVehicle isKindOf "Hatchback_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Jeep Towed
				case (_TowedVehicle isKindOf "Offroad_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//SUV Towed
				case (_TowedVehicle isKindOf "SUV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zodiak Towed
				case (_TowedVehicle isKindOf "Rubber_duck_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// RHIB Towed
				case (_TowedVehicle isKindOf "Boat_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Civilian Speedboat Towed
				case (_TowedVehicle isKindOf "Boat_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ceaser Towed
				case (_TowedVehicle isKindOf "Plane_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
			}
		};
		// Hunter Towing
		case (_TowingVehicle iskindof "MRAP_01_base_F"):
		{
			switch (true) do
			{
				//Offroad Towed
				case (_TowedVehicle isKindOf "0.0999999,-7.6,-0.4"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Box Truck Towed
				case (_TowedVehicle isKindOf "Van_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Van Towed
				case (_TowedVehicle isKindOf "Van_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//HEMMT Towed
				case (_TowedVehicle isKindOf "Truck_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Hunter Towed
				case (_TowedVehicle isKindOf "MRAP_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Prowler Towed
				case (_TowedVehicle isKindOf "LSV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Marshall Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Cheetah/Bobcat/Panther Towed
				case (_TowedVehicle isKindOf "APC_Tracked_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Slammer/Scorcher/Sandstorm Towed
				case (_TowedVehicle isKindOf "MBT_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hummingbird Towed
				case (_TowedVehicle isKindOf "Heli_Light_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfoot Towed
				case (_TowedVehicle isKindOf "Heli_Attack_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Huron Towed
				case (_TowedVehicle isKindOf "Heli_Transport_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ghosthawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ababil/Greyhawk Towed
				case (_TowedVehicle isKindOf "UAV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Sentinel Towed
				case (_TowedVehicle isKindOf "UAV_05_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackwasp Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_01_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Wipeout Towed
				case (_TowedVehicle isKindOf "Plane_CAS_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfish Towed
				case (_TowedVehicle isKindOf "VTOL_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Speedboat (Armed) towed
				case (_TowedVehicle isKindOf "Boat_Armed_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Qillin Towed
				case (_TowedVehicle isKindOf "LSV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Ifrit Towed
				case (_TowedVehicle isKindOf "MRAP_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Tempest Towed
				case (_TowedVehicle isKindOf "Truck_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zamak Towed
				case (_TowedVehicle isKindOf "Truck_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Marid Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kamish/Tigris
				case (_TowedVehicle isKindOf "APC_Tracked_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Varsuk/Socher
				case (_TowedVehicle isKindOf "MBT_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Orca Towed
				case (_TowedVehicle isKindOf "Heli_Light_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Taru Towed
				case (_TowedVehicle isKindOf "Heli_Transport_04_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//kajman Towed
				case (_TowedVehicle isKindOf "Heli_Attack_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Neophran Towed
				case (_TowedVehicle isKindOf "Plane_CAS_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Shikra Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_02_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Xian Towed
				case (_TowedVehicle isKindOf "VTOL_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Strider Towed
				case (_TowedVehicle isKindOf "MRAP_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gorgon Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mora Towed
				case (_TowedVehicle isKindOf "APC_Tracked_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kuma Towed
				case (_TowedVehicle isKindOf "MBT_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hellcat Towed
				case (_TowedVehicle isKindOf "Heli_light_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mohawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Buzzard Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gryphon Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_04_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// hatchback Towed
				case (_TowedVehicle isKindOf "Hatchback_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Jeep Towed
				case (_TowedVehicle isKindOf "Offroad_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//SUV Towed
				case (_TowedVehicle isKindOf "SUV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zodiak Towed
				case (_TowedVehicle isKindOf "Rubber_duck_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// RHIB Towed
				case (_TowedVehicle isKindOf "Boat_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Civilian Speedboat Towed
				case (_TowedVehicle isKindOf "Boat_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ceaser Towed
				case (_TowedVehicle isKindOf "Plane_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
			}
		};
		// Prowler Towing
		case (_TowingVehicle iskindof "LSV_01_base_F"):
		{
			switch (true) do
			{
				//Offroad Towed
				case (_TowedVehicle isKindOf "Offroad_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Box Truck Towed
				case (_TowedVehicle isKindOf "Van_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Van Towed
				case (_TowedVehicle isKindOf "Van_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//HEMMT Towed
				case (_TowedVehicle isKindOf "Truck_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Hunter Towed
				case (_TowedVehicle isKindOf "MRAP_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Prowler Towed
				case (_TowedVehicle isKindOf "LSV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Marshall Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Cheetah/Bobcat/Panther Towed
				case (_TowedVehicle isKindOf "APC_Tracked_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Slammer/Scorcher/Sandstorm Towed
				case (_TowedVehicle isKindOf "MBT_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hummingbird Towed
				case (_TowedVehicle isKindOf "Heli_Light_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfoot Towed
				case (_TowedVehicle isKindOf "Heli_Attack_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Huron Towed
				case (_TowedVehicle isKindOf "Heli_Transport_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ghosthawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ababil/Greyhawk Towed
				case (_TowedVehicle isKindOf "UAV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Sentinel Towed
				case (_TowedVehicle isKindOf "UAV_05_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackwasp Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_01_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Wipeout Towed
				case (_TowedVehicle isKindOf "Plane_CAS_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfish Towed
				case (_TowedVehicle isKindOf "VTOL_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Speedboat (Armed) towed
				case (_TowedVehicle isKindOf "Boat_Armed_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Qillin Towed
				case (_TowedVehicle isKindOf "LSV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Ifrit Towed
				case (_TowedVehicle isKindOf "MRAP_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Tempest Towed
				case (_TowedVehicle isKindOf "Truck_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zamak Towed
				case (_TowedVehicle isKindOf "Truck_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Marid Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kamish/Tigris
				case (_TowedVehicle isKindOf "APC_Tracked_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Varsuk/Socher
				case (_TowedVehicle isKindOf "MBT_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Orca Towed
				case (_TowedVehicle isKindOf "Heli_Light_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Taru Towed
				case (_TowedVehicle isKindOf "Heli_Transport_04_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//kajman Towed
				case (_TowedVehicle isKindOf "Heli_Attack_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Neophran Towed
				case (_TowedVehicle isKindOf "Plane_CAS_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Shikra Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_02_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Xian Towed
				case (_TowedVehicle isKindOf "VTOL_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Strider Towed
				case (_TowedVehicle isKindOf "MRAP_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gorgon Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mora Towed
				case (_TowedVehicle isKindOf "APC_Tracked_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kuma Towed
				case (_TowedVehicle isKindOf "MBT_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hellcat Towed
				case (_TowedVehicle isKindOf "Heli_light_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mohawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Buzzard Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gryphon Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_04_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// hatchback Towed
				case (_TowedVehicle isKindOf "Hatchback_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Jeep Towed
				case (_TowedVehicle isKindOf "Offroad_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//SUV Towed
				case (_TowedVehicle isKindOf "SUV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zodiak Towed
				case (_TowedVehicle isKindOf "Rubber_duck_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// RHIB Towed
				case (_TowedVehicle isKindOf "Boat_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Civilian Speedboat Towed
				case (_TowedVehicle isKindOf "Boat_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ceaser Towed
				case (_TowedVehicle isKindOf "Plane_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
			}
		};
		// Marshal Towing
		case (_TowingVehicle iskindof "APC_Wheeled_01_base_F"):
		{
			switch (true) do
			{
				//Offroad Towed
				case (_TowedVehicle isKindOf "Offroad_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Box Truck Towed
				case (_TowedVehicle isKindOf "Van_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Van Towed
				case (_TowedVehicle isKindOf "Van_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//HEMMT Towed
				case (_TowedVehicle isKindOf "Truck_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Hunter Towed
				case (_TowedVehicle isKindOf "MRAP_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Prowler Towed
				case (_TowedVehicle isKindOf "LSV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Marshall Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Cheetah/Bobcat/Panther Towed
				case (_TowedVehicle isKindOf "APC_Tracked_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Slammer/Scorcher/Sandstorm Towed
				case (_TowedVehicle isKindOf "MBT_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hummingbird Towed
				case (_TowedVehicle isKindOf "Heli_Light_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfoot Towed
				case (_TowedVehicle isKindOf "Heli_Attack_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Huron Towed
				case (_TowedVehicle isKindOf "Heli_Transport_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ghosthawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ababil/Greyhawk Towed
				case (_TowedVehicle isKindOf "UAV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Sentinel Towed
				case (_TowedVehicle isKindOf "UAV_05_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackwasp Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_01_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Wipeout Towed
				case (_TowedVehicle isKindOf "Plane_CAS_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfish Towed
				case (_TowedVehicle isKindOf "VTOL_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Speedboat (Armed) towed
				case (_TowedVehicle isKindOf "Boat_Armed_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Qillin Towed
				case (_TowedVehicle isKindOf "LSV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Ifrit Towed
				case (_TowedVehicle isKindOf "MRAP_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Tempest Towed
				case (_TowedVehicle isKindOf "Truck_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zamak Towed
				case (_TowedVehicle isKindOf "Truck_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Marid Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kamish/Tigris
				case (_TowedVehicle isKindOf "APC_Tracked_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Varsuk/Socher
				case (_TowedVehicle isKindOf "MBT_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Orca Towed
				case (_TowedVehicle isKindOf "Heli_Light_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Taru Towed
				case (_TowedVehicle isKindOf "Heli_Transport_04_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//kajman Towed
				case (_TowedVehicle isKindOf "Heli_Attack_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Neophran Towed
				case (_TowedVehicle isKindOf "Plane_CAS_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Shikra Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_02_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Xian Towed
				case (_TowedVehicle isKindOf "VTOL_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Strider Towed
				case (_TowedVehicle isKindOf "MRAP_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gorgon Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mora Towed
				case (_TowedVehicle isKindOf "APC_Tracked_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kuma Towed
				case (_TowedVehicle isKindOf "MBT_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hellcat Towed
				case (_TowedVehicle isKindOf "Heli_light_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mohawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Buzzard Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gryphon Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_04_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// hatchback Towed
				case (_TowedVehicle isKindOf "Hatchback_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Jeep Towed
				case (_TowedVehicle isKindOf "Offroad_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//SUV Towed
				case (_TowedVehicle isKindOf "SUV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zodiak Towed
				case (_TowedVehicle isKindOf "Rubber_duck_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// RHIB Towed
				case (_TowedVehicle isKindOf "Boat_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Civilian Speedboat Towed
				case (_TowedVehicle isKindOf "Boat_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ceaser Towed
				case (_TowedVehicle isKindOf "Plane_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
			}
		};
		// Cheetah/Bobcat/Panther Towing
		case (_TowingVehicle iskindof "APC_Tracked_01_base_F"):
		{
			switch (true) do
			{
				//Offroad Towed
				case (_TowedVehicle isKindOf "Offroad_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Box Truck Towed
				case (_TowedVehicle isKindOf "Van_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Van Towed
				case (_TowedVehicle isKindOf "Van_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//HEMMT Towed
				case (_TowedVehicle isKindOf "Truck_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Hunter Towed
				case (_TowedVehicle isKindOf "MRAP_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Prowler Towed
				case (_TowedVehicle isKindOf "LSV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Marshall Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Cheetah/Bobcat/Panther Towed
				case (_TowedVehicle isKindOf "APC_Tracked_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Slammer/Scorcher/Sandstorm Towed
				case (_TowedVehicle isKindOf "MBT_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hummingbird Towed
				case (_TowedVehicle isKindOf "Heli_Light_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfoot Towed
				case (_TowedVehicle isKindOf "Heli_Attack_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Huron Towed
				case (_TowedVehicle isKindOf "Heli_Transport_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ghosthawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ababil/Greyhawk Towed
				case (_TowedVehicle isKindOf "UAV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Sentinel Towed
				case (_TowedVehicle isKindOf "UAV_05_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackwasp Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_01_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Wipeout Towed
				case (_TowedVehicle isKindOf "Plane_CAS_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfish Towed
				case (_TowedVehicle isKindOf "VTOL_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Speedboat (Armed) towed
				case (_TowedVehicle isKindOf "Boat_Armed_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Qillin Towed
				case (_TowedVehicle isKindOf "LSV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Ifrit Towed
				case (_TowedVehicle isKindOf "MRAP_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Tempest Towed
				case (_TowedVehicle isKindOf "Truck_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zamak Towed
				case (_TowedVehicle isKindOf "Truck_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Marid Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kamish/Tigris
				case (_TowedVehicle isKindOf "APC_Tracked_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Varsuk/Socher
				case (_TowedVehicle isKindOf "MBT_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Orca Towed
				case (_TowedVehicle isKindOf "Heli_Light_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Taru Towed
				case (_TowedVehicle isKindOf "Heli_Transport_04_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//kajman Towed
				case (_TowedVehicle isKindOf "Heli_Attack_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Neophran Towed
				case (_TowedVehicle isKindOf "Plane_CAS_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Shikra Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_02_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Xian Towed
				case (_TowedVehicle isKindOf "VTOL_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Strider Towed
				case (_TowedVehicle isKindOf "MRAP_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gorgon Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mora Towed
				case (_TowedVehicle isKindOf "APC_Tracked_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kuma Towed
				case (_TowedVehicle isKindOf "MBT_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hellcat Towed
				case (_TowedVehicle isKindOf "Heli_light_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mohawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Buzzard Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gryphon Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_04_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// hatchback Towed
				case (_TowedVehicle isKindOf "Hatchback_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Jeep Towed
				case (_TowedVehicle isKindOf "Offroad_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//SUV Towed
				case (_TowedVehicle isKindOf "SUV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zodiak Towed
				case (_TowedVehicle isKindOf "Rubber_duck_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// RHIB Towed
				case (_TowedVehicle isKindOf "Boat_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Civilian Speedboat Towed
				case (_TowedVehicle isKindOf "Boat_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ceaser Towed
				case (_TowedVehicle isKindOf "Plane_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
			}
		};
		// Slammer/Scorcher Towing
		case (_TowingVehicle iskindof "MBT_01_base_F"):
		{
			switch (true) do
			{
				//Offroad Towed
				case (_TowedVehicle isKindOf "Offroad_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Box Truck Towed
				case (_TowedVehicle isKindOf "Van_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Van Towed
				case (_TowedVehicle isKindOf "Van_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//HEMMT Towed
				case (_TowedVehicle isKindOf "Truck_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Hunter Towed
				case (_TowedVehicle isKindOf "MRAP_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Prowler Towed
				case (_TowedVehicle isKindOf "LSV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Marshall Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Cheetah/Bobcat/Panther Towed
				case (_TowedVehicle isKindOf "APC_Tracked_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Slammer/Scorcher/Sandstorm Towed
				case (_TowedVehicle isKindOf "MBT_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hummingbird Towed
				case (_TowedVehicle isKindOf "Heli_Light_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfoot Towed
				case (_TowedVehicle isKindOf "Heli_Attack_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Huron Towed
				case (_TowedVehicle isKindOf "Heli_Transport_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ghosthawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ababil/Greyhawk Towed
				case (_TowedVehicle isKindOf "UAV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Sentinel Towed
				case (_TowedVehicle isKindOf "UAV_05_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackwasp Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_01_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Wipeout Towed
				case (_TowedVehicle isKindOf "Plane_CAS_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfish Towed
				case (_TowedVehicle isKindOf "VTOL_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Speedboat (Armed) towed
				case (_TowedVehicle isKindOf "Boat_Armed_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Qillin Towed
				case (_TowedVehicle isKindOf "LSV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Ifrit Towed
				case (_TowedVehicle isKindOf "MRAP_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Tempest Towed
				case (_TowedVehicle isKindOf "Truck_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zamak Towed
				case (_TowedVehicle isKindOf "Truck_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Marid Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kamish/Tigris
				case (_TowedVehicle isKindOf "APC_Tracked_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Varsuk/Socher
				case (_TowedVehicle isKindOf "MBT_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Orca Towed
				case (_TowedVehicle isKindOf "Heli_Light_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Taru Towed
				case (_TowedVehicle isKindOf "Heli_Transport_04_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//kajman Towed
				case (_TowedVehicle isKindOf "Heli_Attack_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Neophran Towed
				case (_TowedVehicle isKindOf "Plane_CAS_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Shikra Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_02_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Xian Towed
				case (_TowedVehicle isKindOf "VTOL_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Strider Towed
				case (_TowedVehicle isKindOf "MRAP_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gorgon Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mora Towed
				case (_TowedVehicle isKindOf "APC_Tracked_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kuma Towed
				case (_TowedVehicle isKindOf "MBT_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hellcat Towed
				case (_TowedVehicle isKindOf "Heli_light_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mohawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Buzzard Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gryphon Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_04_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// hatchback Towed
				case (_TowedVehicle isKindOf "Hatchback_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Jeep Towed
				case (_TowedVehicle isKindOf "Offroad_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//SUV Towed
				case (_TowedVehicle isKindOf "SUV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zodiak Towed
				case (_TowedVehicle isKindOf "Rubber_duck_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// RHIB Towed
				case (_TowedVehicle isKindOf "Boat_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Civilian Speedboat Towed
				case (_TowedVehicle isKindOf "Boat_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ceaser Towed
				case (_TowedVehicle isKindOf "Plane_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
			}
		};
		// Speedboat (Armed) Towing
		case (_TowingVehicle iskindof "Boat_Armed_01_base_F"):
		{
			switch (true) do
			{
				//Offroad Towed
				case (_TowedVehicle isKindOf "Offroad_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Box Truck Towed
				case (_TowedVehicle isKindOf "Van_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Van Towed
				case (_TowedVehicle isKindOf "Van_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//HEMMT Towed
				case (_TowedVehicle isKindOf "Truck_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Hunter Towed
				case (_TowedVehicle isKindOf "MRAP_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Prowler Towed
				case (_TowedVehicle isKindOf "LSV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Marshall Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Cheetah/Bobcat/Panther Towed
				case (_TowedVehicle isKindOf "APC_Tracked_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Slammer/Scorcher/Sandstorm Towed
				case (_TowedVehicle isKindOf "MBT_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hummingbird Towed
				case (_TowedVehicle isKindOf "Heli_Light_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfoot Towed
				case (_TowedVehicle isKindOf "Heli_Attack_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Huron Towed
				case (_TowedVehicle isKindOf "Heli_Transport_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ghosthawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ababil/Greyhawk Towed
				case (_TowedVehicle isKindOf "UAV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Sentinel Towed
				case (_TowedVehicle isKindOf "UAV_05_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackwasp Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_01_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Wipeout Towed
				case (_TowedVehicle isKindOf "Plane_CAS_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfish Towed
				case (_TowedVehicle isKindOf "VTOL_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Speedboat (Armed) towed
				case (_TowedVehicle isKindOf "Boat_Armed_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Qillin Towed
				case (_TowedVehicle isKindOf "LSV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Ifrit Towed
				case (_TowedVehicle isKindOf "MRAP_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Tempest Towed
				case (_TowedVehicle isKindOf "Truck_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zamak Towed
				case (_TowedVehicle isKindOf "Truck_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Marid Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kamish/Tigris
				case (_TowedVehicle isKindOf "APC_Tracked_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Varsuk/Socher
				case (_TowedVehicle isKindOf "MBT_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Orca Towed
				case (_TowedVehicle isKindOf "Heli_Light_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Taru Towed
				case (_TowedVehicle isKindOf "Heli_Transport_04_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//kajman Towed
				case (_TowedVehicle isKindOf "Heli_Attack_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Neophran Towed
				case (_TowedVehicle isKindOf "Plane_CAS_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Shikra Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_02_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Xian Towed
				case (_TowedVehicle isKindOf "VTOL_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Strider Towed
				case (_TowedVehicle isKindOf "MRAP_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gorgon Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mora Towed
				case (_TowedVehicle isKindOf "APC_Tracked_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kuma Towed
				case (_TowedVehicle isKindOf "MBT_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hellcat Towed
				case (_TowedVehicle isKindOf "Heli_light_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mohawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Buzzard Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gryphon Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_04_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// hatchback Towed
				case (_TowedVehicle isKindOf "Hatchback_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Jeep Towed
				case (_TowedVehicle isKindOf "Offroad_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//SUV Towed
				case (_TowedVehicle isKindOf "SUV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zodiak Towed
				case (_TowedVehicle isKindOf "Rubber_duck_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// RHIB Towed
				case (_TowedVehicle isKindOf "Boat_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Civilian Speedboat Towed
				case (_TowedVehicle isKindOf "Boat_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ceaser Towed
				case (_TowedVehicle isKindOf "Plane_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
			}
		};
		// Qillin Towing
		case (_TowingVehicle iskindof "LSV_02_base_F"):
		{
			switch (true) do
			{
				//Offroad Towed
				case (_TowedVehicle isKindOf "Offroad_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Box Truck Towed
				case (_TowedVehicle isKindOf "Van_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Van Towed
				case (_TowedVehicle isKindOf "Van_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//HEMMT Towed
				case (_TowedVehicle isKindOf "Truck_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Hunter Towed
				case (_TowedVehicle isKindOf "MRAP_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Prowler Towed
				case (_TowedVehicle isKindOf "LSV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Marshall Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Cheetah/Bobcat/Panther Towed
				case (_TowedVehicle isKindOf "APC_Tracked_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Slammer/Scorcher/Sandstorm Towed
				case (_TowedVehicle isKindOf "MBT_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hummingbird Towed
				case (_TowedVehicle isKindOf "Heli_Light_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfoot Towed
				case (_TowedVehicle isKindOf "Heli_Attack_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Huron Towed
				case (_TowedVehicle isKindOf "Heli_Transport_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ghosthawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ababil/Greyhawk Towed
				case (_TowedVehicle isKindOf "UAV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Sentinel Towed
				case (_TowedVehicle isKindOf "UAV_05_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackwasp Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_01_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Wipeout Towed
				case (_TowedVehicle isKindOf "Plane_CAS_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfish Towed
				case (_TowedVehicle isKindOf "VTOL_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Speedboat (Armed) towed
				case (_TowedVehicle isKindOf "Boat_Armed_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Qillin Towed
				case (_TowedVehicle isKindOf "LSV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Ifrit Towed
				case (_TowedVehicle isKindOf "MRAP_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Tempest Towed
				case (_TowedVehicle isKindOf "Truck_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zamak Towed
				case (_TowedVehicle isKindOf "Truck_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Marid Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kamish/Tigris
				case (_TowedVehicle isKindOf "APC_Tracked_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Varsuk/Socher
				case (_TowedVehicle isKindOf "MBT_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Orca Towed
				case (_TowedVehicle isKindOf "Heli_Light_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Taru Towed
				case (_TowedVehicle isKindOf "Heli_Transport_04_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//kajman Towed
				case (_TowedVehicle isKindOf "Heli_Attack_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Neophran Towed
				case (_TowedVehicle isKindOf "Plane_CAS_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Shikra Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_02_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Xian Towed
				case (_TowedVehicle isKindOf "VTOL_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Strider Towed
				case (_TowedVehicle isKindOf "MRAP_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gorgon Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mora Towed
				case (_TowedVehicle isKindOf "APC_Tracked_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kuma Towed
				case (_TowedVehicle isKindOf "MBT_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hellcat Towed
				case (_TowedVehicle isKindOf "Heli_light_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mohawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Buzzard Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gryphon Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_04_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// hatchback Towed
				case (_TowedVehicle isKindOf "Hatchback_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Jeep Towed
				case (_TowedVehicle isKindOf "Offroad_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//SUV Towed
				case (_TowedVehicle isKindOf "SUV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zodiak Towed
				case (_TowedVehicle isKindOf "Rubber_duck_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// RHIB Towed
				case (_TowedVehicle isKindOf "Boat_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Civilian Speedboat Towed
				case (_TowedVehicle isKindOf "Boat_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ceaser Towed
				case (_TowedVehicle isKindOf "Plane_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
			}
		};
		// Ifrit Towing
		case (_TowingVehicle iskindof "MRAP_02_base_F"):
		{
			switch (true) do
			{
				//Offroad Towed
				case (_TowedVehicle isKindOf "Offroad_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Box Truck Towed
				case (_TowedVehicle isKindOf "Van_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Van Towed
				case (_TowedVehicle isKindOf "Van_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//HEMMT Towed
				case (_TowedVehicle isKindOf "Truck_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Hunter Towed
				case (_TowedVehicle isKindOf "MRAP_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Prowler Towed
				case (_TowedVehicle isKindOf "LSV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Marshall Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Cheetah/Bobcat/Panther Towed
				case (_TowedVehicle isKindOf "APC_Tracked_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Slammer/Scorcher/Sandstorm Towed
				case (_TowedVehicle isKindOf "MBT_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hummingbird Towed
				case (_TowedVehicle isKindOf "Heli_Light_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfoot Towed
				case (_TowedVehicle isKindOf "Heli_Attack_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Huron Towed
				case (_TowedVehicle isKindOf "Heli_Transport_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ghosthawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ababil/Greyhawk Towed
				case (_TowedVehicle isKindOf "UAV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Sentinel Towed
				case (_TowedVehicle isKindOf "UAV_05_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackwasp Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_01_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Wipeout Towed
				case (_TowedVehicle isKindOf "Plane_CAS_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfish Towed
				case (_TowedVehicle isKindOf "VTOL_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Speedboat (Armed) towed
				case (_TowedVehicle isKindOf "Boat_Armed_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Qillin Towed
				case (_TowedVehicle isKindOf "LSV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Ifrit Towed
				case (_TowedVehicle isKindOf "MRAP_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Tempest Towed
				case (_TowedVehicle isKindOf "Truck_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zamak Towed
				case (_TowedVehicle isKindOf "Truck_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Marid Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kamish/Tigris
				case (_TowedVehicle isKindOf "APC_Tracked_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Varsuk/Socher
				case (_TowedVehicle isKindOf "MBT_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Orca Towed
				case (_TowedVehicle isKindOf "Heli_Light_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Taru Towed
				case (_TowedVehicle isKindOf "Heli_Transport_04_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//kajman Towed
				case (_TowedVehicle isKindOf "Heli_Attack_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Neophran Towed
				case (_TowedVehicle isKindOf "Plane_CAS_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Shikra Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_02_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Xian Towed
				case (_TowedVehicle isKindOf "VTOL_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Strider Towed
				case (_TowedVehicle isKindOf "MRAP_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gorgon Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mora Towed
				case (_TowedVehicle isKindOf "APC_Tracked_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kuma Towed
				case (_TowedVehicle isKindOf "MBT_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hellcat Towed
				case (_TowedVehicle isKindOf "Heli_light_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mohawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Buzzard Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gryphon Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_04_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// hatchback Towed
				case (_TowedVehicle isKindOf "Hatchback_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Jeep Towed
				case (_TowedVehicle isKindOf "Offroad_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//SUV Towed
				case (_TowedVehicle isKindOf "SUV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zodiak Towed
				case (_TowedVehicle isKindOf "Rubber_duck_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// RHIB Towed
				case (_TowedVehicle isKindOf "Boat_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Civilian Speedboat Towed
				case (_TowedVehicle isKindOf "Boat_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ceaser Towed
				case (_TowedVehicle isKindOf "Plane_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
			}
		};
		// Temptest Towing
		case (_TowingVehicle iskindof "Truck_03_base_F"):
		{
			switch (true) do
			{
				//Offroad Towed
				case (_TowedVehicle isKindOf "Offroad_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Box Truck Towed
				case (_TowedVehicle isKindOf "Van_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Van Towed
				case (_TowedVehicle isKindOf "Van_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//HEMMT Towed
				case (_TowedVehicle isKindOf "Truck_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Hunter Towed
				case (_TowedVehicle isKindOf "MRAP_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Prowler Towed
				case (_TowedVehicle isKindOf "LSV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Marshall Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Cheetah/Bobcat/Panther Towed
				case (_TowedVehicle isKindOf "APC_Tracked_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Slammer/Scorcher/Sandstorm Towed
				case (_TowedVehicle isKindOf "MBT_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hummingbird Towed
				case (_TowedVehicle isKindOf "Heli_Light_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfoot Towed
				case (_TowedVehicle isKindOf "Heli_Attack_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Huron Towed
				case (_TowedVehicle isKindOf "Heli_Transport_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ghosthawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ababil/Greyhawk Towed
				case (_TowedVehicle isKindOf "UAV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Sentinel Towed
				case (_TowedVehicle isKindOf "UAV_05_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackwasp Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_01_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Wipeout Towed
				case (_TowedVehicle isKindOf "Plane_CAS_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfish Towed
				case (_TowedVehicle isKindOf "VTOL_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Speedboat (Armed) towed
				case (_TowedVehicle isKindOf "Boat_Armed_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Qillin Towed
				case (_TowedVehicle isKindOf "LSV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Ifrit Towed
				case (_TowedVehicle isKindOf "MRAP_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Tempest Towed
				case (_TowedVehicle isKindOf "Truck_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zamak Towed
				case (_TowedVehicle isKindOf "Truck_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Marid Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kamish/Tigris
				case (_TowedVehicle isKindOf "APC_Tracked_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Varsuk/Socher
				case (_TowedVehicle isKindOf "MBT_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Orca Towed
				case (_TowedVehicle isKindOf "Heli_Light_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Taru Towed
				case (_TowedVehicle isKindOf "Heli_Transport_04_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//kajman Towed
				case (_TowedVehicle isKindOf "Heli_Attack_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Neophran Towed
				case (_TowedVehicle isKindOf "Plane_CAS_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Shikra Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_02_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Xian Towed
				case (_TowedVehicle isKindOf "VTOL_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Strider Towed
				case (_TowedVehicle isKindOf "MRAP_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gorgon Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mora Towed
				case (_TowedVehicle isKindOf "APC_Tracked_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kuma Towed
				case (_TowedVehicle isKindOf "MBT_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hellcat Towed
				case (_TowedVehicle isKindOf "Heli_light_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mohawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Buzzard Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gryphon Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_04_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// hatchback Towed
				case (_TowedVehicle isKindOf "Hatchback_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Jeep Towed
				case (_TowedVehicle isKindOf "Offroad_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//SUV Towed
				case (_TowedVehicle isKindOf "SUV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zodiak Towed
				case (_TowedVehicle isKindOf "Rubber_duck_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// RHIB Towed
				case (_TowedVehicle isKindOf "Boat_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Civilian Speedboat Towed
				case (_TowedVehicle isKindOf "Boat_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ceaser Towed
				case (_TowedVehicle isKindOf "Plane_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
			}
		};
		// Zamak Towing
		case (_TowingVehicle iskindof "Truck_02_base_F"):
		{
			switch (true) do
			{
				//Offroad Towed
				case (_TowedVehicle isKindOf "Offroad_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Box Truck Towed
				case (_TowedVehicle isKindOf "Van_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Van Towed
				case (_TowedVehicle isKindOf "Van_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//HEMMT Towed
				case (_TowedVehicle isKindOf "Truck_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Hunter Towed
				case (_TowedVehicle isKindOf "MRAP_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Prowler Towed
				case (_TowedVehicle isKindOf "LSV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Marshall Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Cheetah/Bobcat/Panther Towed
				case (_TowedVehicle isKindOf "APC_Tracked_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Slammer/Scorcher/Sandstorm Towed
				case (_TowedVehicle isKindOf "MBT_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hummingbird Towed
				case (_TowedVehicle isKindOf "Heli_Light_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfoot Towed
				case (_TowedVehicle isKindOf "Heli_Attack_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Huron Towed
				case (_TowedVehicle isKindOf "Heli_Transport_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ghosthawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ababil/Greyhawk Towed
				case (_TowedVehicle isKindOf "UAV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Sentinel Towed
				case (_TowedVehicle isKindOf "UAV_05_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackwasp Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_01_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Wipeout Towed
				case (_TowedVehicle isKindOf "Plane_CAS_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfish Towed
				case (_TowedVehicle isKindOf "VTOL_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Speedboat (Armed) towed
				case (_TowedVehicle isKindOf "Boat_Armed_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Qillin Towed
				case (_TowedVehicle isKindOf "LSV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Ifrit Towed
				case (_TowedVehicle isKindOf "MRAP_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Tempest Towed
				case (_TowedVehicle isKindOf "Truck_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zamak Towed
				case (_TowedVehicle isKindOf "Truck_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Marid Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kamish/Tigris
				case (_TowedVehicle isKindOf "APC_Tracked_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Varsuk/Socher
				case (_TowedVehicle isKindOf "MBT_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Orca Towed
				case (_TowedVehicle isKindOf "Heli_Light_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Taru Towed
				case (_TowedVehicle isKindOf "Heli_Transport_04_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//kajman Towed
				case (_TowedVehicle isKindOf "Heli_Attack_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Neophran Towed
				case (_TowedVehicle isKindOf "Plane_CAS_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Shikra Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_02_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Xian Towed
				case (_TowedVehicle isKindOf "VTOL_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Strider Towed
				case (_TowedVehicle isKindOf "MRAP_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gorgon Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mora Towed
				case (_TowedVehicle isKindOf "APC_Tracked_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kuma Towed
				case (_TowedVehicle isKindOf "MBT_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hellcat Towed
				case (_TowedVehicle isKindOf "Heli_light_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mohawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Buzzard Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gryphon Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_04_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// hatchback Towed
				case (_TowedVehicle isKindOf "Hatchback_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Jeep Towed
				case (_TowedVehicle isKindOf "Offroad_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//SUV Towed
				case (_TowedVehicle isKindOf "SUV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zodiak Towed
				case (_TowedVehicle isKindOf "Rubber_duck_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// RHIB Towed
				case (_TowedVehicle isKindOf "Boat_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Civilian Speedboat Towed
				case (_TowedVehicle isKindOf "Boat_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ceaser Towed
				case (_TowedVehicle isKindOf "Plane_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
			}
		};
		// Marid Towing
		case (_TowingVehicle iskindof "APC_Wheeled_02_base_F"):
		{
			switch (true) do
			{
				//Offroad Towed
				case (_TowedVehicle isKindOf "Offroad_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Box Truck Towed
				case (_TowedVehicle isKindOf "Van_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Van Towed
				case (_TowedVehicle isKindOf "Van_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//HEMMT Towed
				case (_TowedVehicle isKindOf "Truck_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Hunter Towed
				case (_TowedVehicle isKindOf "MRAP_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Prowler Towed
				case (_TowedVehicle isKindOf "LSV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Marshall Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Cheetah/Bobcat/Panther Towed
				case (_TowedVehicle isKindOf "APC_Tracked_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Slammer/Scorcher/Sandstorm Towed
				case (_TowedVehicle isKindOf "MBT_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hummingbird Towed
				case (_TowedVehicle isKindOf "Heli_Light_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfoot Towed
				case (_TowedVehicle isKindOf "Heli_Attack_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Huron Towed
				case (_TowedVehicle isKindOf "Heli_Transport_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ghosthawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ababil/Greyhawk Towed
				case (_TowedVehicle isKindOf "UAV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Sentinel Towed
				case (_TowedVehicle isKindOf "UAV_05_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackwasp Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_01_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Wipeout Towed
				case (_TowedVehicle isKindOf "Plane_CAS_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfish Towed
				case (_TowedVehicle isKindOf "VTOL_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Speedboat (Armed) towed
				case (_TowedVehicle isKindOf "Boat_Armed_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Qillin Towed
				case (_TowedVehicle isKindOf "LSV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Ifrit Towed
				case (_TowedVehicle isKindOf "MRAP_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Tempest Towed
				case (_TowedVehicle isKindOf "Truck_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zamak Towed
				case (_TowedVehicle isKindOf "Truck_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Marid Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kamish/Tigris
				case (_TowedVehicle isKindOf "APC_Tracked_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Varsuk/Socher
				case (_TowedVehicle isKindOf "MBT_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Orca Towed
				case (_TowedVehicle isKindOf "Heli_Light_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Taru Towed
				case (_TowedVehicle isKindOf "Heli_Transport_04_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//kajman Towed
				case (_TowedVehicle isKindOf "Heli_Attack_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Neophran Towed
				case (_TowedVehicle isKindOf "Plane_CAS_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Shikra Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_02_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Xian Towed
				case (_TowedVehicle isKindOf "VTOL_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Strider Towed
				case (_TowedVehicle isKindOf "MRAP_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gorgon Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mora Towed
				case (_TowedVehicle isKindOf "APC_Tracked_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kuma Towed
				case (_TowedVehicle isKindOf "MBT_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hellcat Towed
				case (_TowedVehicle isKindOf "Heli_light_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mohawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Buzzard Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gryphon Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_04_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// hatchback Towed
				case (_TowedVehicle isKindOf "Hatchback_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Jeep Towed
				case (_TowedVehicle isKindOf "Offroad_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//SUV Towed
				case (_TowedVehicle isKindOf "SUV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zodiak Towed
				case (_TowedVehicle isKindOf "Rubber_duck_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// RHIB Towed
				case (_TowedVehicle isKindOf "Boat_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Civilian Speedboat Towed
				case (_TowedVehicle isKindOf "Boat_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ceaser Towed
				case (_TowedVehicle isKindOf "Plane_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
			}
		};
		// Karmysh/Tigris Towing
		case (_TowingVehicle iskindof "APC_Tracked_02_base_F"):
		{
			switch (true) do
			{
				//Offroad Towed
				case (_TowedVehicle isKindOf "Offroad_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Box Truck Towed
				case (_TowedVehicle isKindOf "Van_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Van Towed
				case (_TowedVehicle isKindOf "Van_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//HEMMT Towed
				case (_TowedVehicle isKindOf "Truck_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Hunter Towed
				case (_TowedVehicle isKindOf "MRAP_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Prowler Towed
				case (_TowedVehicle isKindOf "LSV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Marshall Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Cheetah/Bobcat/Panther Towed
				case (_TowedVehicle isKindOf "APC_Tracked_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Slammer/Scorcher/Sandstorm Towed
				case (_TowedVehicle isKindOf "MBT_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hummingbird Towed
				case (_TowedVehicle isKindOf "Heli_Light_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfoot Towed
				case (_TowedVehicle isKindOf "Heli_Attack_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Huron Towed
				case (_TowedVehicle isKindOf "Heli_Transport_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ghosthawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ababil/Greyhawk Towed
				case (_TowedVehicle isKindOf "UAV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Sentinel Towed
				case (_TowedVehicle isKindOf "UAV_05_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackwasp Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_01_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Wipeout Towed
				case (_TowedVehicle isKindOf "Plane_CAS_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfish Towed
				case (_TowedVehicle isKindOf "VTOL_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Speedboat (Armed) towed
				case (_TowedVehicle isKindOf "Boat_Armed_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Qillin Towed
				case (_TowedVehicle isKindOf "LSV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Ifrit Towed
				case (_TowedVehicle isKindOf "MRAP_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Tempest Towed
				case (_TowedVehicle isKindOf "Truck_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zamak Towed
				case (_TowedVehicle isKindOf "Truck_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Marid Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kamish/Tigris
				case (_TowedVehicle isKindOf "APC_Tracked_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Varsuk/Socher
				case (_TowedVehicle isKindOf "MBT_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Orca Towed
				case (_TowedVehicle isKindOf "Heli_Light_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Taru Towed
				case (_TowedVehicle isKindOf "Heli_Transport_04_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//kajman Towed
				case (_TowedVehicle isKindOf "Heli_Attack_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Neophran Towed
				case (_TowedVehicle isKindOf "Plane_CAS_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Shikra Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_02_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Xian Towed
				case (_TowedVehicle isKindOf "VTOL_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Strider Towed
				case (_TowedVehicle isKindOf "MRAP_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gorgon Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mora Towed
				case (_TowedVehicle isKindOf "APC_Tracked_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kuma Towed
				case (_TowedVehicle isKindOf "MBT_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hellcat Towed
				case (_TowedVehicle isKindOf "Heli_light_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mohawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Buzzard Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gryphon Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_04_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// hatchback Towed
				case (_TowedVehicle isKindOf "Hatchback_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Jeep Towed
				case (_TowedVehicle isKindOf "Offroad_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//SUV Towed
				case (_TowedVehicle isKindOf "SUV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zodiak Towed
				case (_TowedVehicle isKindOf "Rubber_duck_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// RHIB Towed
				case (_TowedVehicle isKindOf "Boat_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Civilian Speedboat Towed
				case (_TowedVehicle isKindOf "Boat_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ceaser Towed
				case (_TowedVehicle isKindOf "Plane_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
			}
		};
		// Varsuk/Socher Towing
		case (_TowingVehicle iskindof "MBT_02_base_F"):
		{
			switch (true) do
			{
				//Offroad Towed
				case (_TowedVehicle isKindOf "Offroad_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Box Truck Towed
				case (_TowedVehicle isKindOf "Van_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Van Towed
				case (_TowedVehicle isKindOf "Van_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//HEMMT Towed
				case (_TowedVehicle isKindOf "Truck_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Hunter Towed
				case (_TowedVehicle isKindOf "MRAP_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Prowler Towed
				case (_TowedVehicle isKindOf "LSV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Marshall Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Cheetah/Bobcat/Panther Towed
				case (_TowedVehicle isKindOf "APC_Tracked_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Slammer/Scorcher/Sandstorm Towed
				case (_TowedVehicle isKindOf "MBT_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hummingbird Towed
				case (_TowedVehicle isKindOf "Heli_Light_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfoot Towed
				case (_TowedVehicle isKindOf "Heli_Attack_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Huron Towed
				case (_TowedVehicle isKindOf "Heli_Transport_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ghosthawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ababil/Greyhawk Towed
				case (_TowedVehicle isKindOf "UAV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Sentinel Towed
				case (_TowedVehicle isKindOf "UAV_05_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackwasp Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_01_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Wipeout Towed
				case (_TowedVehicle isKindOf "Plane_CAS_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfish Towed
				case (_TowedVehicle isKindOf "VTOL_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Speedboat (Armed) towed
				case (_TowedVehicle isKindOf "Boat_Armed_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Qillin Towed
				case (_TowedVehicle isKindOf "LSV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Ifrit Towed
				case (_TowedVehicle isKindOf "MRAP_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Tempest Towed
				case (_TowedVehicle isKindOf "Truck_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zamak Towed
				case (_TowedVehicle isKindOf "Truck_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Marid Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kamish/Tigris
				case (_TowedVehicle isKindOf "APC_Tracked_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Varsuk/Socher
				case (_TowedVehicle isKindOf "MBT_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Orca Towed
				case (_TowedVehicle isKindOf "Heli_Light_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Taru Towed
				case (_TowedVehicle isKindOf "Heli_Transport_04_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//kajman Towed
				case (_TowedVehicle isKindOf "Heli_Attack_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Neophran Towed
				case (_TowedVehicle isKindOf "Plane_CAS_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Shikra Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_02_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Xian Towed
				case (_TowedVehicle isKindOf "VTOL_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Strider Towed
				case (_TowedVehicle isKindOf "MRAP_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gorgon Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mora Towed
				case (_TowedVehicle isKindOf "APC_Tracked_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kuma Towed
				case (_TowedVehicle isKindOf "MBT_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hellcat Towed
				case (_TowedVehicle isKindOf "Heli_light_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mohawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Buzzard Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gryphon Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_04_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// hatchback Towed
				case (_TowedVehicle isKindOf "Hatchback_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Jeep Towed
				case (_TowedVehicle isKindOf "Offroad_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//SUV Towed
				case (_TowedVehicle isKindOf "SUV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zodiak Towed
				case (_TowedVehicle isKindOf "Rubber_duck_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// RHIB Towed
				case (_TowedVehicle isKindOf "Boat_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Civilian Speedboat Towed
				case (_TowedVehicle isKindOf "Boat_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ceaser Towed
				case (_TowedVehicle isKindOf "Plane_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
			}
		};
		// Strider Towing
		case (_TowingVehicle iskindof "MRAP_03_base_F"):
		{
			switch (true) do
			{
				//Offroad Towed
				case (_TowedVehicle isKindOf "Offroad_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Box Truck Towed
				case (_TowedVehicle isKindOf "Van_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Van Towed
				case (_TowedVehicle isKindOf "Van_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//HEMMT Towed
				case (_TowedVehicle isKindOf "Truck_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Hunter Towed
				case (_TowedVehicle isKindOf "MRAP_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Prowler Towed
				case (_TowedVehicle isKindOf "LSV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Marshall Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Cheetah/Bobcat/Panther Towed
				case (_TowedVehicle isKindOf "APC_Tracked_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Slammer/Scorcher/Sandstorm Towed
				case (_TowedVehicle isKindOf "MBT_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hummingbird Towed
				case (_TowedVehicle isKindOf "Heli_Light_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfoot Towed
				case (_TowedVehicle isKindOf "Heli_Attack_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Huron Towed
				case (_TowedVehicle isKindOf "Heli_Transport_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ghosthawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ababil/Greyhawk Towed
				case (_TowedVehicle isKindOf "UAV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Sentinel Towed
				case (_TowedVehicle isKindOf "UAV_05_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackwasp Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_01_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Wipeout Towed
				case (_TowedVehicle isKindOf "Plane_CAS_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfish Towed
				case (_TowedVehicle isKindOf "VTOL_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Speedboat (Armed) towed
				case (_TowedVehicle isKindOf "Boat_Armed_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Qillin Towed
				case (_TowedVehicle isKindOf "LSV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Ifrit Towed
				case (_TowedVehicle isKindOf "MRAP_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Tempest Towed
				case (_TowedVehicle isKindOf "Truck_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zamak Towed
				case (_TowedVehicle isKindOf "Truck_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Marid Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kamish/Tigris
				case (_TowedVehicle isKindOf "APC_Tracked_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Varsuk/Socher
				case (_TowedVehicle isKindOf "MBT_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Orca Towed
				case (_TowedVehicle isKindOf "Heli_Light_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Taru Towed
				case (_TowedVehicle isKindOf "Heli_Transport_04_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//kajman Towed
				case (_TowedVehicle isKindOf "Heli_Attack_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Neophran Towed
				case (_TowedVehicle isKindOf "Plane_CAS_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Shikra Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_02_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Xian Towed
				case (_TowedVehicle isKindOf "VTOL_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Strider Towed
				case (_TowedVehicle isKindOf "MRAP_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gorgon Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mora Towed
				case (_TowedVehicle isKindOf "APC_Tracked_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kuma Towed
				case (_TowedVehicle isKindOf "MBT_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hellcat Towed
				case (_TowedVehicle isKindOf "Heli_light_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mohawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Buzzard Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gryphon Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_04_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// hatchback Towed
				case (_TowedVehicle isKindOf "Hatchback_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Jeep Towed
				case (_TowedVehicle isKindOf "Offroad_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//SUV Towed
				case (_TowedVehicle isKindOf "SUV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zodiak Towed
				case (_TowedVehicle isKindOf "Rubber_duck_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// RHIB Towed
				case (_TowedVehicle isKindOf "Boat_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Civilian Speedboat Towed
				case (_TowedVehicle isKindOf "Boat_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ceaser Towed
				case (_TowedVehicle isKindOf "Plane_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
			}
		};
		// Gorgono Towing
		case (_TowingVehicle iskindof "APC_Wheeled_03_base_F"):
		{
			switch (true) do
			{
				//Offroad Towed
				case (_TowedVehicle isKindOf "Offroad_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Box Truck Towed
				case (_TowedVehicle isKindOf "Van_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Van Towed
				case (_TowedVehicle isKindOf "Van_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//HEMMT Towed
				case (_TowedVehicle isKindOf "Truck_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Hunter Towed
				case (_TowedVehicle isKindOf "MRAP_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Prowler Towed
				case (_TowedVehicle isKindOf "LSV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Marshall Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Cheetah/Bobcat/Panther Towed
				case (_TowedVehicle isKindOf "APC_Tracked_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Slammer/Scorcher/Sandstorm Towed
				case (_TowedVehicle isKindOf "MBT_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hummingbird Towed
				case (_TowedVehicle isKindOf "Heli_Light_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfoot Towed
				case (_TowedVehicle isKindOf "Heli_Attack_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Huron Towed
				case (_TowedVehicle isKindOf "Heli_Transport_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ghosthawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ababil/Greyhawk Towed
				case (_TowedVehicle isKindOf "UAV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Sentinel Towed
				case (_TowedVehicle isKindOf "UAV_05_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackwasp Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_01_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Wipeout Towed
				case (_TowedVehicle isKindOf "Plane_CAS_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfish Towed
				case (_TowedVehicle isKindOf "VTOL_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Speedboat (Armed) towed
				case (_TowedVehicle isKindOf "Boat_Armed_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Qillin Towed
				case (_TowedVehicle isKindOf "LSV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Ifrit Towed
				case (_TowedVehicle isKindOf "MRAP_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Tempest Towed
				case (_TowedVehicle isKindOf "Truck_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zamak Towed
				case (_TowedVehicle isKindOf "Truck_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Marid Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kamish/Tigris
				case (_TowedVehicle isKindOf "APC_Tracked_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Varsuk/Socher
				case (_TowedVehicle isKindOf "MBT_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Orca Towed
				case (_TowedVehicle isKindOf "Heli_Light_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Taru Towed
				case (_TowedVehicle isKindOf "Heli_Transport_04_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//kajman Towed
				case (_TowedVehicle isKindOf "Heli_Attack_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Neophran Towed
				case (_TowedVehicle isKindOf "Plane_CAS_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Shikra Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_02_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Xian Towed
				case (_TowedVehicle isKindOf "VTOL_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Strider Towed
				case (_TowedVehicle isKindOf "MRAP_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gorgon Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mora Towed
				case (_TowedVehicle isKindOf "APC_Tracked_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kuma Towed
				case (_TowedVehicle isKindOf "MBT_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hellcat Towed
				case (_TowedVehicle isKindOf "Heli_light_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mohawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Buzzard Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gryphon Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_04_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// hatchback Towed
				case (_TowedVehicle isKindOf "Hatchback_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Jeep Towed
				case (_TowedVehicle isKindOf "Offroad_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//SUV Towed
				case (_TowedVehicle isKindOf "SUV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zodiak Towed
				case (_TowedVehicle isKindOf "Rubber_duck_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// RHIB Towed
				case (_TowedVehicle isKindOf "Boat_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Civilian Speedboat Towed
				case (_TowedVehicle isKindOf "Boat_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ceaser Towed
				case (_TowedVehicle isKindOf "Plane_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
			}
		};
		// Mora Towing
		case (_TowingVehicle iskindof "APC_Tracked_03_base_F"):
		{
			switch (true) do
			{
				//Offroad Towed
				case (_TowedVehicle isKindOf "Offroad_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Box Truck Towed
				case (_TowedVehicle isKindOf "Van_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Van Towed
				case (_TowedVehicle isKindOf "Van_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//HEMMT Towed
				case (_TowedVehicle isKindOf "Truck_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Hunter Towed
				case (_TowedVehicle isKindOf "MRAP_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Prowler Towed
				case (_TowedVehicle isKindOf "LSV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Marshall Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Cheetah/Bobcat/Panther Towed
				case (_TowedVehicle isKindOf "APC_Tracked_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Slammer/Scorcher/Sandstorm Towed
				case (_TowedVehicle isKindOf "MBT_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hummingbird Towed
				case (_TowedVehicle isKindOf "Heli_Light_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfoot Towed
				case (_TowedVehicle isKindOf "Heli_Attack_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Huron Towed
				case (_TowedVehicle isKindOf "Heli_Transport_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ghosthawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ababil/Greyhawk Towed
				case (_TowedVehicle isKindOf "UAV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Sentinel Towed
				case (_TowedVehicle isKindOf "UAV_05_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackwasp Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_01_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Wipeout Towed
				case (_TowedVehicle isKindOf "Plane_CAS_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfish Towed
				case (_TowedVehicle isKindOf "VTOL_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Speedboat (Armed) towed
				case (_TowedVehicle isKindOf "Boat_Armed_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Qillin Towed
				case (_TowedVehicle isKindOf "LSV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Ifrit Towed
				case (_TowedVehicle isKindOf "MRAP_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Tempest Towed
				case (_TowedVehicle isKindOf "Truck_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zamak Towed
				case (_TowedVehicle isKindOf "Truck_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Marid Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kamish/Tigris
				case (_TowedVehicle isKindOf "APC_Tracked_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Varsuk/Socher
				case (_TowedVehicle isKindOf "MBT_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Orca Towed
				case (_TowedVehicle isKindOf "Heli_Light_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Taru Towed
				case (_TowedVehicle isKindOf "Heli_Transport_04_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//kajman Towed
				case (_TowedVehicle isKindOf "Heli_Attack_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Neophran Towed
				case (_TowedVehicle isKindOf "Plane_CAS_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Shikra Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_02_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Xian Towed
				case (_TowedVehicle isKindOf "VTOL_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Strider Towed
				case (_TowedVehicle isKindOf "MRAP_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gorgon Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mora Towed
				case (_TowedVehicle isKindOf "APC_Tracked_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kuma Towed
				case (_TowedVehicle isKindOf "MBT_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hellcat Towed
				case (_TowedVehicle isKindOf "Heli_light_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mohawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Buzzard Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gryphon Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_04_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// hatchback Towed
				case (_TowedVehicle isKindOf "Hatchback_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Jeep Towed
				case (_TowedVehicle isKindOf "Offroad_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//SUV Towed
				case (_TowedVehicle isKindOf "SUV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zodiak Towed
				case (_TowedVehicle isKindOf "Rubber_duck_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// RHIB Towed
				case (_TowedVehicle isKindOf "Boat_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Civilian Speedboat Towed
				case (_TowedVehicle isKindOf "Boat_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ceaser Towed
				case (_TowedVehicle isKindOf "Plane_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
			}
		};
		// Kuma Towing
		case (_TowingVehicle iskindof "MBT_03_base_F"):
		{
			switch (true) do
			{
				//Offroad Towed
				case (_TowedVehicle isKindOf "Offroad_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Box Truck Towed
				case (_TowedVehicle isKindOf "Van_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Van Towed
				case (_TowedVehicle isKindOf "Van_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//HEMMT Towed
				case (_TowedVehicle isKindOf "Truck_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Hunter Towed
				case (_TowedVehicle isKindOf "MRAP_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Prowler Towed
				case (_TowedVehicle isKindOf "LSV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Marshall Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Cheetah/Bobcat/Panther Towed
				case (_TowedVehicle isKindOf "APC_Tracked_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Slammer/Scorcher/Sandstorm Towed
				case (_TowedVehicle isKindOf "MBT_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hummingbird Towed
				case (_TowedVehicle isKindOf "Heli_Light_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfoot Towed
				case (_TowedVehicle isKindOf "Heli_Attack_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Huron Towed
				case (_TowedVehicle isKindOf "Heli_Transport_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ghosthawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ababil/Greyhawk Towed
				case (_TowedVehicle isKindOf "UAV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Sentinel Towed
				case (_TowedVehicle isKindOf "UAV_05_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackwasp Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_01_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Wipeout Towed
				case (_TowedVehicle isKindOf "Plane_CAS_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfish Towed
				case (_TowedVehicle isKindOf "VTOL_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Speedboat (Armed) towed
				case (_TowedVehicle isKindOf "Boat_Armed_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Qillin Towed
				case (_TowedVehicle isKindOf "LSV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Ifrit Towed
				case (_TowedVehicle isKindOf "MRAP_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Tempest Towed
				case (_TowedVehicle isKindOf "Truck_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zamak Towed
				case (_TowedVehicle isKindOf "Truck_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Marid Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kamish/Tigris
				case (_TowedVehicle isKindOf "APC_Tracked_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Varsuk/Socher
				case (_TowedVehicle isKindOf "MBT_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Orca Towed
				case (_TowedVehicle isKindOf "Heli_Light_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Taru Towed
				case (_TowedVehicle isKindOf "Heli_Transport_04_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//kajman Towed
				case (_TowedVehicle isKindOf "Heli_Attack_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Neophran Towed
				case (_TowedVehicle isKindOf "Plane_CAS_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Shikra Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_02_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Xian Towed
				case (_TowedVehicle isKindOf "VTOL_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Strider Towed
				case (_TowedVehicle isKindOf "MRAP_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gorgon Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mora Towed
				case (_TowedVehicle isKindOf "APC_Tracked_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kuma Towed
				case (_TowedVehicle isKindOf "MBT_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hellcat Towed
				case (_TowedVehicle isKindOf "Heli_light_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mohawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Buzzard Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gryphon Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_04_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// hatchback Towed
				case (_TowedVehicle isKindOf "Hatchback_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Jeep Towed
				case (_TowedVehicle isKindOf "Offroad_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//SUV Towed
				case (_TowedVehicle isKindOf "SUV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zodiak Towed
				case (_TowedVehicle isKindOf "Rubber_duck_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// RHIB Towed
				case (_TowedVehicle isKindOf "Boat_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Civilian Speedboat Towed
				case (_TowedVehicle isKindOf "Boat_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ceaser Towed
				case (_TowedVehicle isKindOf "Plane_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
			}
		};
		// Hatchback Towing
		case (_TowingVehicle iskindof "Hatchback_01_base_F"):
		{
			switch (true) do
			{
				//Offroad Towed
				case (_TowedVehicle isKindOf "Offroad_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Box Truck Towed
				case (_TowedVehicle isKindOf "Van_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Van Towed
				case (_TowedVehicle isKindOf "Van_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//HEMMT Towed
				case (_TowedVehicle isKindOf "Truck_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Hunter Towed
				case (_TowedVehicle isKindOf "MRAP_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Prowler Towed
				case (_TowedVehicle isKindOf "LSV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Marshall Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Cheetah/Bobcat/Panther Towed
				case (_TowedVehicle isKindOf "APC_Tracked_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Slammer/Scorcher/Sandstorm Towed
				case (_TowedVehicle isKindOf "MBT_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hummingbird Towed
				case (_TowedVehicle isKindOf "Heli_Light_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfoot Towed
				case (_TowedVehicle isKindOf "Heli_Attack_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Huron Towed
				case (_TowedVehicle isKindOf "Heli_Transport_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ghosthawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ababil/Greyhawk Towed
				case (_TowedVehicle isKindOf "UAV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Sentinel Towed
				case (_TowedVehicle isKindOf "UAV_05_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackwasp Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_01_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Wipeout Towed
				case (_TowedVehicle isKindOf "Plane_CAS_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfish Towed
				case (_TowedVehicle isKindOf "VTOL_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Speedboat (Armed) towed
				case (_TowedVehicle isKindOf "Boat_Armed_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Qillin Towed
				case (_TowedVehicle isKindOf "LSV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Ifrit Towed
				case (_TowedVehicle isKindOf "MRAP_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Tempest Towed
				case (_TowedVehicle isKindOf "Truck_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zamak Towed
				case (_TowedVehicle isKindOf "Truck_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Marid Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kamish/Tigris
				case (_TowedVehicle isKindOf "APC_Tracked_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Varsuk/Socher
				case (_TowedVehicle isKindOf "MBT_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Orca Towed
				case (_TowedVehicle isKindOf "Heli_Light_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Taru Towed
				case (_TowedVehicle isKindOf "Heli_Transport_04_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//kajman Towed
				case (_TowedVehicle isKindOf "Heli_Attack_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Neophran Towed
				case (_TowedVehicle isKindOf "Plane_CAS_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Shikra Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_02_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Xian Towed
				case (_TowedVehicle isKindOf "VTOL_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Strider Towed
				case (_TowedVehicle isKindOf "MRAP_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gorgon Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mora Towed
				case (_TowedVehicle isKindOf "APC_Tracked_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kuma Towed
				case (_TowedVehicle isKindOf "MBT_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hellcat Towed
				case (_TowedVehicle isKindOf "Heli_light_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mohawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Buzzard Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gryphon Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_04_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// hatchback Towed
				case (_TowedVehicle isKindOf "Hatchback_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Jeep Towed
				case (_TowedVehicle isKindOf "Offroad_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//SUV Towed
				case (_TowedVehicle isKindOf "SUV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zodiak Towed
				case (_TowedVehicle isKindOf "Rubber_duck_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// RHIB Towed
				case (_TowedVehicle isKindOf "Boat_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Civilian Speedboat Towed
				case (_TowedVehicle isKindOf "Boat_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ceaser Towed
				case (_TowedVehicle isKindOf "Plane_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
			}
		};
		// Jeep Towing
		case (_TowingVehicle iskindof "Offroad_02_base_F"):
		{
			switch (true) do
			{
				//Offroad Towed
				case (_TowedVehicle isKindOf "Offroad_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Box Truck Towed
				case (_TowedVehicle isKindOf "Van_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Van Towed
				case (_TowedVehicle isKindOf "Van_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//HEMMT Towed
				case (_TowedVehicle isKindOf "Truck_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Hunter Towed
				case (_TowedVehicle isKindOf "MRAP_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Prowler Towed
				case (_TowedVehicle isKindOf "LSV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Marshall Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Cheetah/Bobcat/Panther Towed
				case (_TowedVehicle isKindOf "APC_Tracked_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Slammer/Scorcher/Sandstorm Towed
				case (_TowedVehicle isKindOf "MBT_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hummingbird Towed
				case (_TowedVehicle isKindOf "Heli_Light_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfoot Towed
				case (_TowedVehicle isKindOf "Heli_Attack_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Huron Towed
				case (_TowedVehicle isKindOf "Heli_Transport_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ghosthawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ababil/Greyhawk Towed
				case (_TowedVehicle isKindOf "UAV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Sentinel Towed
				case (_TowedVehicle isKindOf "UAV_05_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackwasp Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_01_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Wipeout Towed
				case (_TowedVehicle isKindOf "Plane_CAS_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfish Towed
				case (_TowedVehicle isKindOf "VTOL_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Speedboat (Armed) towed
				case (_TowedVehicle isKindOf "Boat_Armed_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Qillin Towed
				case (_TowedVehicle isKindOf "LSV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Ifrit Towed
				case (_TowedVehicle isKindOf "MRAP_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Tempest Towed
				case (_TowedVehicle isKindOf "Truck_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zamak Towed
				case (_TowedVehicle isKindOf "Truck_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Marid Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kamish/Tigris
				case (_TowedVehicle isKindOf "APC_Tracked_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Varsuk/Socher
				case (_TowedVehicle isKindOf "MBT_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Orca Towed
				case (_TowedVehicle isKindOf "Heli_Light_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Taru Towed
				case (_TowedVehicle isKindOf "Heli_Transport_04_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//kajman Towed
				case (_TowedVehicle isKindOf "Heli_Attack_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Neophran Towed
				case (_TowedVehicle isKindOf "Plane_CAS_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Shikra Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_02_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Xian Towed
				case (_TowedVehicle isKindOf "VTOL_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Strider Towed
				case (_TowedVehicle isKindOf "MRAP_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gorgon Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mora Towed
				case (_TowedVehicle isKindOf "APC_Tracked_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kuma Towed
				case (_TowedVehicle isKindOf "MBT_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hellcat Towed
				case (_TowedVehicle isKindOf "Heli_light_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mohawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Buzzard Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gryphon Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_04_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// hatchback Towed
				case (_TowedVehicle isKindOf "Hatchback_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Jeep Towed
				case (_TowedVehicle isKindOf "Offroad_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//SUV Towed
				case (_TowedVehicle isKindOf "SUV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zodiak Towed
				case (_TowedVehicle isKindOf "Rubber_duck_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// RHIB Towed
				case (_TowedVehicle isKindOf "Boat_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Civilian Speedboat Towed
				case (_TowedVehicle isKindOf "Boat_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ceaser Towed
				case (_TowedVehicle isKindOf "Plane_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
			}
		};
		// SUV Towing
		case (_TowingVehicle iskindof "SUV_01_base_F"):
		{
			switch (true) do
			{
				//Offroad Towed
				case (_TowedVehicle isKindOf "Offroad_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Box Truck Towed
				case (_TowedVehicle isKindOf "Van_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Van Towed
				case (_TowedVehicle isKindOf "Van_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//HEMMT Towed
				case (_TowedVehicle isKindOf "Truck_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Hunter Towed
				case (_TowedVehicle isKindOf "MRAP_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Prowler Towed
				case (_TowedVehicle isKindOf "LSV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Marshall Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Cheetah/Bobcat/Panther Towed
				case (_TowedVehicle isKindOf "APC_Tracked_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Slammer/Scorcher/Sandstorm Towed
				case (_TowedVehicle isKindOf "MBT_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hummingbird Towed
				case (_TowedVehicle isKindOf "Heli_Light_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfoot Towed
				case (_TowedVehicle isKindOf "Heli_Attack_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Huron Towed
				case (_TowedVehicle isKindOf "Heli_Transport_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ghosthawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ababil/Greyhawk Towed
				case (_TowedVehicle isKindOf "UAV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Sentinel Towed
				case (_TowedVehicle isKindOf "UAV_05_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackwasp Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_01_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Wipeout Towed
				case (_TowedVehicle isKindOf "Plane_CAS_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfish Towed
				case (_TowedVehicle isKindOf "VTOL_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Speedboat (Armed) towed
				case (_TowedVehicle isKindOf "Boat_Armed_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Qillin Towed
				case (_TowedVehicle isKindOf "LSV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Ifrit Towed
				case (_TowedVehicle isKindOf "MRAP_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Tempest Towed
				case (_TowedVehicle isKindOf "Truck_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zamak Towed
				case (_TowedVehicle isKindOf "Truck_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Marid Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kamish/Tigris
				case (_TowedVehicle isKindOf "APC_Tracked_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Varsuk/Socher
				case (_TowedVehicle isKindOf "MBT_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Orca Towed
				case (_TowedVehicle isKindOf "Heli_Light_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Taru Towed
				case (_TowedVehicle isKindOf "Heli_Transport_04_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//kajman Towed
				case (_TowedVehicle isKindOf "Heli_Attack_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Neophran Towed
				case (_TowedVehicle isKindOf "Plane_CAS_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Shikra Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_02_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Xian Towed
				case (_TowedVehicle isKindOf "VTOL_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Strider Towed
				case (_TowedVehicle isKindOf "MRAP_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gorgon Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mora Towed
				case (_TowedVehicle isKindOf "APC_Tracked_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kuma Towed
				case (_TowedVehicle isKindOf "MBT_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hellcat Towed
				case (_TowedVehicle isKindOf "Heli_light_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mohawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Buzzard Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gryphon Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_04_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// hatchback Towed
				case (_TowedVehicle isKindOf "Hatchback_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Jeep Towed
				case (_TowedVehicle isKindOf "Offroad_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//SUV Towed
				case (_TowedVehicle isKindOf "SUV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zodiak Towed
				case (_TowedVehicle isKindOf "Rubber_duck_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// RHIB Towed
				case (_TowedVehicle isKindOf "Boat_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Civilian Speedboat Towed
				case (_TowedVehicle isKindOf "Boat_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ceaser Towed
				case (_TowedVehicle isKindOf "Plane_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
			}
		};
		// RHIB Towing
		case (_TowingVehicle iskindof "Boat_Transport_02_base_F"):
		{
			switch (true) do
			{
				//Offroad Towed
				case (_TowedVehicle isKindOf "Offroad_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Box Truck Towed
				case (_TowedVehicle isKindOf "Van_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Van Towed
				case (_TowedVehicle isKindOf "Van_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//HEMMT Towed
				case (_TowedVehicle isKindOf "Truck_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Hunter Towed
				case (_TowedVehicle isKindOf "MRAP_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Prowler Towed
				case (_TowedVehicle isKindOf "LSV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Marshall Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Cheetah/Bobcat/Panther Towed
				case (_TowedVehicle isKindOf "APC_Tracked_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Slammer/Scorcher/Sandstorm Towed
				case (_TowedVehicle isKindOf "MBT_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hummingbird Towed
				case (_TowedVehicle isKindOf "Heli_Light_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfoot Towed
				case (_TowedVehicle isKindOf "Heli_Attack_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Huron Towed
				case (_TowedVehicle isKindOf "Heli_Transport_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ghosthawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ababil/Greyhawk Towed
				case (_TowedVehicle isKindOf "UAV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Sentinel Towed
				case (_TowedVehicle isKindOf "UAV_05_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackwasp Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_01_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Wipeout Towed
				case (_TowedVehicle isKindOf "Plane_CAS_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Blackfish Towed
				case (_TowedVehicle isKindOf "VTOL_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Speedboat (Armed) towed
				case (_TowedVehicle isKindOf "Boat_Armed_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Qillin Towed
				case (_TowedVehicle isKindOf "LSV_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Ifrit Towed
				case (_TowedVehicle isKindOf "MRAP_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Tempest Towed
				case (_TowedVehicle isKindOf "Truck_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zamak Towed
				case (_TowedVehicle isKindOf "Truck_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Marid Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kamish/Tigris
				case (_TowedVehicle isKindOf "APC_Tracked_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Varsuk/Socher
				case (_TowedVehicle isKindOf "MBT_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Orca Towed
				case (_TowedVehicle isKindOf "Heli_Light_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//Taru Towed
				case (_TowedVehicle isKindOf "Heli_Transport_04_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//kajman Towed
				case (_TowedVehicle isKindOf "Heli_Attack_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Neophran Towed
				case (_TowedVehicle isKindOf "Plane_CAS_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Shikra Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_02_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Xian Towed
				case (_TowedVehicle isKindOf "VTOL_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Strider Towed
				case (_TowedVehicle isKindOf "MRAP_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gorgon Towed
				case (_TowedVehicle isKindOf "APC_Wheeled_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mora Towed
				case (_TowedVehicle isKindOf "APC_Tracked_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Kuma Towed
				case (_TowedVehicle isKindOf "MBT_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Hellcat Towed
				case (_TowedVehicle isKindOf "Heli_light_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Mohawk Towed
				case (_TowedVehicle isKindOf "Heli_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Buzzard Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_03_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Gryphon Towed
				case (_TowedVehicle isKindOf "Plane_Fighter_04_Base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// hatchback Towed
				case (_TowedVehicle isKindOf "Hatchback_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Jeep Towed
				case (_TowedVehicle isKindOf "Offroad_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				//SUV Towed
				case (_TowedVehicle isKindOf "SUV_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Zodiak Towed
				case (_TowedVehicle isKindOf "Rubber_duck_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// RHIB Towed
				case (_TowedVehicle isKindOf "Boat_Transport_02_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Civilian Speedboat Towed
				case (_TowedVehicle isKindOf "Boat_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
				// Ceaser Towed
				case (_TowedVehicle isKindOf "Plane_Civil_01_base_F"):
				{
					titleText ["Attaching to Offroad", "PLAIN"];
					_TowedVehicle attachTo [_TowingVehicle, [-0.2,-6.4,0.3]];
					_TowedVehicle setVariable ["Towed", true, true];
					_TowingVehicle setVariable ["Towing", true, true];
				};
			}
		};
	};
} else {
	titleText ["No Tow vehicle in range", "PLAIN"];
};