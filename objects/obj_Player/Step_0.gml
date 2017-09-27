/// @description Insert description here
// You can write your code in this editor
if(keyboard_check_released(vk_space)){
	audio_play_sound(Sound_Explosion,1,false);
	
};


if(keyboard_check_released(ord("1"))){testFunction(1);};
if(keyboard_check_released(ord("2"))){testFunction(2);};
if(keyboard_check_released(ord("3"))){testFunction(3);};
if(keyboard_check_released(ord("4"))){testFunction(4);};
if(keyboard_check_released(vk_numpad1)){testFunction(1);};


if (keyboard_check(vk_left))
	if (place_free(x-4,y)) x -=4;
	else if !(place_free(x - 4,y))
		{
			while (place_free(x - 1,y)) x--;
		}

if (keyboard_check(vk_right))
	if (place_free(x+4,y)) x +=4;
	else if !(place_free(x + 4,y))
		{
			while (place_free(x + 1,y)) x++;
		}

if (keyboard_check(vk_up))
	if (place_free(x,y-4)) y -=4;
	else if !(place_free(x,y - 4))
		{
			while (place_free(x,y - 1)) y--;
		}

if (keyboard_check(vk_down))
	if (place_free(x,y+4)) y +=4;
	else if !(place_free(x,y + 4))
		{
			while (place_free(x,y + 1)) y++;
		}


if(mouse_x == clamp(mouse_x, bbox_left, bbox_right) && mouse_y == clamp(mouse_y, bbox_top, bbox_bottom)){
	if !testBool {
		audio_play_sound(Sound_OhMy,1,false);
		testBool = true;
	};
}else{testBool = false;};

