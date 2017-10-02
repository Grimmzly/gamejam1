/// @description Insert description here
// You can write your code in this editor
if (room = rm_spriteTest)
{

var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);
layer_x("Parallax_Front", lerp(_cam_x, _cam_x * 0.9 , 1)); // Change the background layer name to whatever you use in the room editor
layer_y("Parallax_Front", lerp(_cam_y, _cam_y * 0.9, 1));
//layer_x("Backgrounds_1", _cam_x * 0.5);   // Change the 0.25 and 0.5 values to change the speed of the effect
//layer_x("Backgrounds_2", _cam_x * 0.75);
} 