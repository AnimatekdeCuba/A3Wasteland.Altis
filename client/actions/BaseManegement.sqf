private _NearestManager = nearestObject [player, "Land_SatellitePhone_F"];
private _playerUID = getPlayerUID player;
private _ManagerOwner = _NearestManager getvariable "ownerUID";


if ((player distance _NearestManager) < 50) then 
{
    if (_NearestManager getVariable ["objectLocked", false]) then 
    {
      if (_playerUID == _ManagerOwner) then 
      {
        execVM "addons\BoS\BoS_remote_ownerMenu.sqf";
        hint "Welcome Owner";
      } 
      else 
      {
        execVM "addons\BoS\remote_password_enter.sqf";
        hint "Welcome";
      };
    } 
    else 
    {
      hint "Base Manager refused connection";
    };
} 
else
{
  hint "No Base Manager in Range";
};
