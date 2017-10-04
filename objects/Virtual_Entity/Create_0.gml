/// @description Insert description here
// You can write your code in this editor
draw_set_colour(c_white);

//This is where we initialise all local variables for entities that exist in the game
isActive = false;							//Default to false to avoid running background objects
myHealth = 1;								//Health - how much damage it can take
if(x && y){
	myPos = [x,y];							//Position - Where it is on the map
	myLastPos = [x,y];						//Last Position - Where it was last frame
}else {myPos = [0,0]; myLastPos = [0,0];}	//Just in case they didn't initialise properly
myJumpSpeed = -20;							//How much force is the jump creating
mySpeed = [0,0];							//Speed - How much position changes per frame
maxSpeed = [20,50];							//Max Speed - The fastest they can go
myAccel = [0,1];							//Acceleration - how much speed changes per frame
isOnGround = false;							//Is this touching the ground? (Useful for jumping)
isJumping = false;							//Is it Jumping?
myWidth = sprite_width;						//Width of the sprite (or bounding box)
myHeight = sprite_height;					//Height of the sprite (or bounding box)
isWalkingLeft = false;						//Some logic for walking
isWalkingRight = false;						//""				""
isInvincible = false;						//This is for modders, and specific sections of code
isAttacking = false;						//For attacking logic