// @description Insert description here
// You can write your code in this editor
// Trashio Codio
//if (place_meeting(x,y,obj_Enemy)) room_restart();
///////////////////////////////
startFrameTime = get_timer();
event_inherited();
if(!isAttacking && keyboard_check_pressed(vk_space)){
	audio_play_sound(Sound_Explosion,1,false);
	myAttack = instance_create_depth(myPos[0],myPos[1],depth,obj_Attack);
	myAttack.myAttacker = self;
	isAttacking = true;
};
//if (isAttacking){isInvincible = true; myInvincibleTimer = 0;}

if(keyboard_check_released(ord("1"))){testFunction(1);};
if(keyboard_check_released(ord("2"))){testFunction(2);};
if(keyboard_check_released(ord("3"))){testFunction(3);};
if(keyboard_check_released(ord("4"))){testFunction(4);};
if(keyboard_check_released(vk_numpad1)){testFunction(1);};



//This is where the new controls will go


if (keyboard_check(vk_left) && !keyboard_check(vk_right)){
	//move the character left
	
};
if (keyboard_check(vk_right) && !keyboard_check(vk_left)){
	//move the character right
	
};

//Alternate controls for WASD
if (keyboard_check(ord("D")) && !keyboard_check(ord("A"))){
	//move the character right
	isWalkingRight = true;
	image_xscale = 1;
	mask_index = spr_PlayerWalk;
	//myAccel[0] = 2;
} else isWalkingRight = false;
if (keyboard_check(ord("A")) && !keyboard_check(ord("D"))){
	//move the character left
	isWalkingLeft = true;
	image_xscale = -1;
	mask_index = spr_PlayerWalk;
	//myAccel[0] = -2;
} else isWalkingLeft = false;
if (keyboard_check(ord("W")) && !keyboard_check(ord("S"))){
	//move the character up
	isJumping = true;
	if (place_meeting(x + sprite_width/2,y,obj_Solid) || place_meeting(x - sprite_width/2,y,obj_Solid) && !isOnGround){
		wallJump = true;
	};
};
if (keyboard_check_released(ord("W")) && isJumping){
	isJumping = false;
};
if (keyboard_check(ord("S")) && !keyboard_check(ord("W"))){
	//move the character down
	//Not used yet
};

//If you hit an enemy, react here
if (place_meeting(myPos[0],myPos[1],obj_badCrate)){mySpeed[1] *= -1; isInvincible = true;}

if(!isInvincible && place_meeting(myPos[0],myPos[1],Virtual_Enemy)) {
	myHealth--;
	isInvincible = true;
	myPos = myLastPos;
	mySpeed[0] = -mySpeed[0];
	mySpeed[1] = -mySpeed[1];
};


//This is our starting movement control scheme
/*
if (keyboard_check(vk_left))
	if (place_free(x-4,y)) x -=4;
	else if !(place_free(x - 4,y))
		{
			while (place_free(x - 1,y)) x--;
		}

if (keyboard_check(vk_right))
	if (place_free(x+4,y)) x +=4;
	else if !(place_free(x + 4,y))
		{
			while (place_free(x + 1,y)) x++;
		}

if (keyboard_check(vk_up))
	if (place_free(x,y-4)) y -=4;
	else if !(place_free(x,y - 4))
		{
			while (place_free(x,y - 1)) y--;
		}

if (keyboard_check(vk_down))
	if (place_free(x,y+4)) y +=4;
	else if !(place_free(x,y + 4))
		{
			while (place_free(x,y + 1)) y++;
		}
*/
if(mouse_check_button_pressed(mb_left)) { //Added Statement
		//(instance_create_depth(x,y,depth,obj_Bullet)).myAttacker = self;
		newBullet = instance_create_depth(x,y,depth,obj_Bullet);
		newBullet.myAttacker = self;
		newBullet.direction = point_direction(self.x,self.y,mouse_x,mouse_y);
		dd = angle_difference(newBullet.image_angle, newBullet.direction);
		newBullet.image_angle -= dd + 90;
}


if(mouse_x == clamp(mouse_x, bbox_left, bbox_right) && mouse_y == clamp(mouse_y, bbox_top, bbox_bottom)){
	if mouse_check_button_pressed(mb_left) {
		audio_play_sound(Sound_OhMy,1,false);
	};
};


if(!keyboard_check(vk_anykey) && isOnGround){mask_index = spr_PlayerIdle;};