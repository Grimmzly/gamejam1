/// @description Insert description here
// You can write your code in this editor

event_inherited();
//Lower image animation speed for testing
image_speed = 0.75;

jumpTimer = 2500000;
timeFrame = get_timer();
isActive = true;
maxSpeed[0] = 50;

//Animation variables
hopperState = 0;
mask_index = spr_hopperIdle;