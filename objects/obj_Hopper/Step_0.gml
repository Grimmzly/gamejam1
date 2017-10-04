/// @description Insert description here
// You can write your code in this editor
if (get_timer() - timeFrame > jumpTimer){
	isJumping = true;
	timeFrame = get_timer();
	if (obj_Player.x > x){isWalkingRight = true;};
	if (obj_Player.x < x){isWalkingLeft = true;};
};
event_inherited();
isJumping = false;
isWalkingRight = false;
isWalkingLeft = false;
