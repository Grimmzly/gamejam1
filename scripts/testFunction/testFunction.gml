switch(argument0){
	case 0:
	break;
	case 1:
	case 2:
	case 3:
	audio_play_sound(Sound_BigBalls,1,false);
	argument0 = 0;
	break;
	default:
	audio_play_sound(Sound_Explosion,1,false);
	argument0 = 0;
};