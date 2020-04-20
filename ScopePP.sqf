while {alive player} do {
	if(cameraView == "gunner")then{
		PP_radial = ppEffectCreate ["radialBlur",100];
		PP_radial ppEffectEnable true;
		PP_radial ppEffectAdjust [0.002,0.1,0.07,0.13];
		PP_radial ppEffectCommit 0;
		PP_chrom = ppEffectCreate ["ChromAberration",200];
		PP_chrom ppEffectEnable true;
		PP_chrom ppEffectAdjust [0.008,0.014,true];
		PP_chrom ppEffectCommit 0;
		mouseSpeed = 0.001;
	}else{
	ppEffectDestroy PP_radial;
	ppEffectDestroy PP_chrom;
	};

sleep 0.1;
};