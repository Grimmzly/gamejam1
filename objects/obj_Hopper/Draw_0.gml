/// @description Insert description here
// You can write your code in this editor

switch hopperState
{
	case 0: //Idle state
		draw_sprite_ext(spr_hopperIdle,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
			if !(mask_index = spr_hopperIdle) mask_index = spr_hopperIdle;
		break;
	case 1: //Jumping state
			draw_sprite_ext(spr_hopperAngry,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
			if !(mask_index = spr_hopperAngry) mask_index = spr_hopperAngry;
			//Reset idle state
			if (image_index > image_number - 1) hopperState = 0;
		break;
}