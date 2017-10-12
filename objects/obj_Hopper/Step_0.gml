/// @description Insert description here
// You can write your code in this editor

//Jump timer
if (isOnGround){mask_index = spr_hopperIdle;};
if (get_timer() - timeFrame > jumpTimer){
	isJumping = true;
	//If you comment out the next line, he goes apeshit.               //HOW TO PISS OFF THE HOPPER
	timeFrame = get_timer();
	if (obj_Player.x > x){isWalkingRight = true; image_xscale = 1;};
	if (obj_Player.x < x){isWalkingLeft = true; image_xscale = -1;};
	mask_index = spr_hopperAngry;
};

//Sets the frame manually
if(mask_index = spr_hopperAngry && (image_index > image_number - 1)){image_index -= 4};


event_inherited();
isJumping = false;
isWalkingRight = false;
isWalkingLeft = false;