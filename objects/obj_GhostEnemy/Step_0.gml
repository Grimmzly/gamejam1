/// @description Insert description here
// You can write your code in this editor
if (y > room_height){mySpeed[1] = -2;};
if (x > room_width){mySpeed[0] = -2;};
if (x < 0){mySpeed[0] = 2;};
if (y < 0){mySpeed[1] = 2;};

if (place_meeting(x,y,obj_Attack)){instance_destroy();};

x += mySpeed[0];
y += mySpeed[1];