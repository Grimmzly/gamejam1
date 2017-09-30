/// @description Insert description here
// You can write your code in this editor
if (keyboard_check_pressed(ord("F"))) 
{
	switch window_get_fullscreen()
	{
	case true: 
	window_set_fullscreen(false);
	break;
	case false:
	window_set_fullscreen(true);
	break;
	}
}