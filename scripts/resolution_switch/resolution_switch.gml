/// @description resolution_switch()
/// @function resolution_switch
//this script is used to switch between fullscreen and windowed mode

with(obj_resolution)
{
    window_set_fullscreen(!window_get_fullscreen());
    resolution_configure();
}