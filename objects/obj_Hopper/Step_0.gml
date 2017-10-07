/// @description Insert description here
// You can write your code in this editor

//Jump timer
if (get_timer() - timeFrame > jumpTimer){
	isJumping = true;
	timeFrame = get_timer();
	if (obj_Player.x > x){isWalkingRight = true; image_xscale = 1;};
	if (obj_Player.x < x){isWalkingLeft = true; image_xscale = -1;};
	hopperState = 1;
};
event_inherited();
isJumping = false;
isWalkingRight = false;
isWalkingLeft = false;
