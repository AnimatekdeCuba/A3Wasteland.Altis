/*
Filename: weather.sqf
Author: GMG_Monkey
Purpose: Simple weather generation script
*/

//Set weather system to ON, can be turned of my other scripts by changing global variable to false
WeatherSystemON = true;
//clear all weather so weather system can take over
	0 setfog 0;
	0 setovercast 0;
	0 setrain 0;
	setwind [0,0, true];

//Start Weather System
	while {WeatherSystemON} do
	{
		//Some log love to make sure everything is working
		diag_log "Weather System Started";
		//get a random number
		private _num = ceil (random [0,50,100]);
		//Initialize weather variable and set defualt to Clear
		private _currentweather = "Clear";
		//Set weather type based on random number
		switch (true) do
		{
			case (_num <=50):
			{
				_currentweather = "Clear";
			};
			// case (_num >25 && _num <=50):
			// {
			// 	_currentweather = "Windy";
			// };
			case (_num >50 && _num <=70):
			{
				_currentweather = "LightRain";
			};
			case (_num >70&& _num <=80):
			{
				_currentweather = "MediumRain";
			};
			case (_num >80 && _num <=90):
			{
				_currentweather = "HeavyRain";
			};
			case (_num >90 && _num <=95):
			{
				_currentweather = "Hurricane";
			};
			case (_num >95 && _num <=97):
			{
				_currentweather = "Mildfog";
			};
			case (_num >97 && _num <=99):
			{
				_currentweather = "HeavyFog";
			};
			case (_num >99 && _num <=100):
			{
				_currentweather = "FogOfDoom";
			};
		};
		//More log love
		diag_log format ["Weather switching to %1", _currentweather];
		//Switch weather based on selected weather type
		switch (_currentweather) do
		{
			case "Clear":
			{
				(random [0, 180, 300]) setfog 0;
				(random [0, 180, 300]) setovercast 0;
				(random [0, 180, 300]) setrain 0;
				setwind [0,0, true];
				(random [0, 180, 300]) setwinddir (random 360);
				sleep (60*60);
			};
			case "Windy":
			{
				(random [0, 180, 300]) setfog 0;
				(random [0, 180, 300]) setovercast 0;
				(random [0, 180, 300]) setrain 0;
				setwind [(random 10),(random 10), true];
				(random [0, 180, 300]) setwinddir (random 360);
				sleep (60*60);
			};
			case "overcast":
			{
				(random [0, 180, 300]) setfog 0;
				(random [0, 180, 300]) setovercast 0.25;
				(random [0, 180, 300]) setrain 0;
				setwind [(random 10),(random 10), true];
				(random [0, 180, 300]) setwinddir (random 360);
				sleep (60*60);
			};
			case "LightRain":
			{
				(random [0, 180, 300]) setfog 0;
				(random [0, 180, 300]) setovercast 0.25;
				(random [0, 180, 300]) setrain 0.125;
				setwind [(random 10),(random 10), true];
				(random [0, 180, 300]) setwinddir (random 360);
				sleep (60*60);
			};
			case "MediumRain":
			{
				(random [0, 180, 300]) setfog 0;
				(random [0, 180, 300]) setovercast 0.25;
				(random [0, 180, 300]) setrain 0.25;
				setwind [(random 10),(random 10), true];
				(random [0, 180, 300]) setwinddir (random 360);
				sleep (60*60);
			};
			case "HeavyRain":
			{
				(random [0, 180, 300]) setfog 0;
				(random [0, 180, 300]) setovercast 0.75;
				(random [0, 180, 300]) setrain 0.6;
				setwind [(random 10),(random 10), true];
				(random [0, 180, 300]) setwinddir (random 360);
				sleep (60*60);
			};
			case "Hurricane":
			{
				(random [0, 180, 300]) setfog 0;
				(random [0, 180, 300]) setovercast 1;
				(random [0, 180, 300]) setrain 1;
				setwind [100,100, true];
				(random [0, 180, 300]) setwinddir (random 360);
				sleep (60*60);
			};
			case "Mildfog":
			{
				(random [0, 180, 300]) setfog 0.125;
				(random [0, 180, 300]) setovercast 0;
				(random [0, 180, 300]) setrain 0;
				setwind [0,0, true];
				(random [0, 180, 300]) setwinddir (random 360);
				sleep (60*60);
			};
			case "HeavyFog":
			{
				(random [0, 180, 300]) setfog 0.25;
				(random [0, 180, 300]) setovercast 0;
				(random [0, 180, 300]) setrain 0;
				setwind [0,0, true];
				(random [0, 180, 300]) setwinddir (random 360);
				sleep (60*60);
			};
			case "FogOfDoom":
			{
				(random [0, 180, 300]) setfog 1;
				(random [0, 180, 300]) setovercast 0;
				(random [0, 180, 300]) setrain 0;
				setwind [0,0, true];
				(random [0, 180, 300]) setwinddir (random 360);
				sleep (60*60);
			};
			default
			{
				diag_log "Something Went wrong no compatible weather type selected";
			};
		};
	};
//Clear all weather if weather system exits for any reason
	(random [0, 180, 300]) setfog 0;
	(random [0, 180, 300]) setovercast 0;
	(random [0, 180, 300]) setrain 0;
	setwind [0,0, true];
	(random [0, 180, 300]) setwinddir (random 360);