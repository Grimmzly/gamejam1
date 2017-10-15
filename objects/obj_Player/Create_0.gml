/// @description Insert description here
// You can write your code in this editor
event_inherited();
isActive = true;
myHealth = 3;
myInvincibleTimer = 0;
startFrameTime = get_timer();
myAttackCooldown = 1000000;					//My attack rate is one attack per second
mask_index = spr_PlayerIdle;
myAttack = 0;
image_speed = 0.5;							//Animation Speed