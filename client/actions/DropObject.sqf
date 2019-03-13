_object = attachedObjects player;

{detach _x} foreach _object;
player setVariable ["Carrying", false, true];
_object setVariable ["Carried", false, true];
