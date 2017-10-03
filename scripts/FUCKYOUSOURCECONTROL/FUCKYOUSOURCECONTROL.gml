/*

///@description Tilemap collisions
//Shaun Spaulding collision

var bbox_side;

key_right = keyboard_check (vk_right);
key_left = keyboard_check (vk_left);
key_up = keyboard_check (vk_up);
key_down = keyboard_check (vk_down);

hsp = (key_right - key_left) * 4;
vsp = (key_down - key_up) * 4;

//Horizontal collision
if (hsp > 0) bbox_side = bbox_right; else bbox_side = bbox_left;
if (tilemap_get_at_pixel (tilemap,bbox_side+hsp,bbox_top) != 0 ) || (tilemap_get_at_pixel(tilemap,bbpx_side+hsp,bbox_bottom) != 0)
{
	if (hsp > 0) x = x - (x mod 32) + 31 - (bbox_right - x);
	else x = x - (x mod 32) - (bbox_left - x);
	hsp = 0;
}
// Move character
x += hsp;

// Vertical collision
if (vsp > 0) bbox_side = bbox_bottom; else bbox_side = bbox_top;
if (tilemap_get_at_pixel(tilemap,bbox_left,bbox_side+vsp) != 0) || (tilemap_get_at_pixel(tilemap,bbox_right,bbox_side+vsp) !=0 )
{
	if (vsp > 0) y = y - (y mod 32) + 31 - (bbox_bottom - y);
	else y = y - (y mod 32) - (bbox_top - y);
}
// Move character
y += vsp;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//HeartBeast collission

// tile_collide_at_points (script)
///@param tile_map_id
///@param point_arrays...
var tile_map_id = argument[0];

// Found variable
var found = false;

// for the point arrays
var vector2_x = 0;
var vector2_y = 1;

// Loop through the points and check for a tile
for (var i=1; i<argument_count; i++) {
	var point = argument[i];
	found = found || tilemap_get_at_pixel(tile_map_id, point[vector2_x], point[vector2_y]);
}

// return found
return found;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//move_and_contact_tiles (script)
///@param tile_map_id
///@param tile_size
///@param velocity_array
var tile_map_id = argument0;
var tile_size = argument1;
var velocity = argument2;

// For the velocity array
var vector2_x = 0;
var vector2_y = 1;

// Move horizontally
x += velocity[vector2_x];

// Right collisions
if velocity[vector2_x] > 0 {
	var tile_right = tile_collide_at_points(tile_map_id, [bbox_right-1, bbox_top], [bbox_right-1, bbox_bottom-1]);
	if tile_right {
		x = bbox_right & ~(tile_size-1);
		x -= bbox_right-x;
		velocity[@ vector2_x] = 0;
	}
} else {
	var tile_left = tile_collide_at_points(tile_map_id, [bbox_left, bbox_top], [bbox_left, bbox_bottom-1]);
	if tile_left {
		x = bbox_left & ~(tile_size-1);
		x += tile_size+x-bbox_left;
		velocity[@ vector2_x] = 0;
	}
}

// Move vertically
y += velocity[vector2_y];

// Vertical collisions
if velocity[vector2_y] > 0 {
	var tile_bottom = tile_collide_at_points(tile_map_id, [bbox_left, bbox_bottom-1], [bbox_right-1, bbox_bottom-1]);
	if tile_bottom {
		y = bbox_bottom & ~(tile_size-1);
		y -= bbox_bottom-y;
		velocity[@ vector2_y] = 0;
	}
} else {
	var tile_top = tile_collide_at_points(tile_map_id, [bbox_left, bbox_top], [bbox_right-1, bbox_top]);
	if tile_top {
		y = bbox_top & ~(tile_size-1);
		y += tile_size+y-bbox_top;
		velocity[@ vector2_y] = 0;
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Player Create
velocity_ = [0, 0];
gravity_ = 1.5;
jump_speed_ = 28;
max_velocity_ = [0,32);
acceleration_ = 2.1;

// get the tilemap id
var layer_id = layer_get_id("CollissionTiles");
collision_tile_map_id_ = layer_tilemap_get_id(layer_id);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Player step function
var x_input = (keyboard_check(vk_right) - keyboard_check(vk_left)) * acceleration_;

// vector variables
var vector2_x = 0;
var vector2_y = 1;

//Horizontal movement
velocity_[vector2_x] = clamp(velocity[vector2_x] + x_input, -max_velocity_[vector2_x], max_velocity[vector2_x]);

//friction
if x_input == 0{
	velocity_[vector2_x] = lerp(velocity_[vector2_x], 0 , .2);
}

// Gravity
velocity_[vector2_y] += gravity_;

// Move and contact tiles
move_and_contact_tiles(collision_tile_map_id_, 64, velocity_);

// Jumping
var on_ground tile_collide_at_points(collision_tile_map_id_, [bbox_left, bbox_bottom], [bbox_right -1, bbox_bottom]);
if on_ground {
	// Jumping
		if keyboard_check_pressed(vk_up){
			velocity_[vector2_y] = -jump_speed_;
		}
} else {
	// control jump height
	if keyboard_check_released(vk_up) && velocity_[vector2_y] <= -(jump_speed_/3) {
		velocity_[vector2_y] = - ( jump_speed_/3);
		}
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
*/