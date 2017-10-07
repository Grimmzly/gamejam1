/// @description Insert description here
// You can write your code in this editor
//Initialize GUI text mid-center
//draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (room = rm_ProtoRoom) 
{
draw_text(camera_get_view_width(0)/2,50,"Testing Room");
}


draw_text(30,80,
	"Frame rate: " + string(fps) +"\n" + 
	"True frame rate: " + string(fps_real) + "\n" +
	"Total instances: " + string(instance_count) + "\n" +
	"Total ghosts: " + string(instance_number(obj_GhostEnemy)) + "\n" +
	"Total runtime: " + string(floor(debug_Runtime/fps)) + "\n" +
	"Hopper frame: " + string(floor(obj_Hopper.image_index)) + "\n" +
	"Hopper Anim: " + sprite_get_name(obj_Hopper)
	
	);
