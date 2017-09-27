switch(argument0){
	case 0:
	break;
	case 1:
	audio_play_sound(Sound_Boom,1,false);
	break;
	case 2:
	audio_play_sound(Sound_FasterBoom,1,false);
	break;
	case 3:
	audio_play_sound(Sound_SlowerBoom,1,false);
	break;
	case 4:
	audio_play_sound(Sound_BigBalls,1,false);
	break;
	break;
	default:
	audio_play_sound(Sound_Explosion,1,false);
};
argument0 = 0;