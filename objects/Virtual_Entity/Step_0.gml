/// @description Insert description here
// You can write your code in this editor
//Before we waste a frame on them, are they already dead?
if (myHealth <= 0){instance_destroy(self);};
startFrameTime = get_timer();

if (isInvincible){
	if(myInvincibleTimer = 0){
		image_alpha = 1;
		myInvincibleTimer = get_timer();
	};
	if((startFrameTime - myInvincibleTimer) > 1000000){
		isInvincible = false;
		myInvincibleTimer = 0;
		image_alpha = 1;
	}else if (!isAttacking){
		image_alpha = sin(get_timer());
	};
};


//As long as this Object is active, run the following
if(isActive){
	//Update the logic frames per step
	myLastPos[0] = myPos[0];
	myLastPos[1] = myPos[1];

	//Check to see if you're jumping
	if (isOnGround && isJumping) { mySpeed[1] = myJumpSpeed; isOnGround = false;};
	if (!isOnGround && isWallJumping){
		push = 0;
		if (mask_index){
			hw = sprite_get_width(mask_index) / 2;
		}else {
			hw = sprite_width / 2;
		};
		if (place_free(x + hw,y)){
			push = 10;
		}else if (place_free(x - hw,y)){
			push = -10;
		};
		mySpeed[1] = myJumpSpeed/2;
		mySpeed[0] = push;
		isWallJumping = false;
	};

	//Check to see if you're walking
	if (isWalkingRight && !isWalkingLeft) {myAccel[0] = 1;};
	else if (isWalkingLeft && !isWalkingRight) {myAccel[0] = -1;};
	else {myAccel[0] = 0;};

	//Throttling speed
	mySpeed[0] = clamp(mySpeed[0]+ myAccel[0], -maxSpeed[0], maxSpeed[0]);
	mySpeed[1] = clamp(mySpeed[1]+ myAccel[1], -maxSpeed[1], maxSpeed[1]);
	
	//Friction slows the character naturally
	if (!isWalkingRight && !isWalkingLeft && isOnGround) mySpeed[0] *= 0.69;

	//Set the new Position
	myPos[0] += mySpeed[0];
	myPos[1] += mySpeed[1];
	
	//New Collisions
	/*
	if (myPos != myLastPos){
		if (myPos[1] != myLastPos[1]){isOnGround = false;};
		if (!place_free(myPos[0], myPos[1])){
			
			//Initialise the local variables
			yCollision = true;
			xCollision = true;
			//Find out where you came from
			displacement = [myPos[0] - myLastPos[0], myPos[1] - myLastPos[1]];
			absDisp = [abs(displacement[0]), abs(displacement[1])];
			
			
			if (displacement[0] != 0){
				xMod = floor(displacement[0]/absDisp[0]);
			};
			if (displacement[1] != 0){
				yMod = floor(displacement[1]/absDisp[1]);
			};
			
			hw = (sprite_get_width(mask_index) / 2);
			hh = (sprite_get_height(mask_index) / 2);
			CollidingObject = collision_rectangle(myPos[0] - hw, myPos[1] - hh, myPos[0] + hw, myPos[1] + hh, obj_Solid, true, true);
	
			while (CollidingObject != noone) {
				
	
				//Find out the colliding object's dimensions
				cx = CollidingObject.x;
				cy = CollidingObject.y;
				chh = (CollidingObject.sprite_height / 2);
				chw = (CollidingObject.sprite_width / 2);
			
				//Find the distance between them
				xTest = myPos[0] - cx;
				yTest = myPos[1] - cy;
			
				//Find out how far apart they need to be
				xDis = ceil(chw + hw + 1);
				yDis = ceil(chh + hh + 1);
			
				////Check to see if moving back towards the previous position on the x axis still collides
				//if (place_free(cx + (xDis * xMod),myPos[1])){
				//	yCollision = false;
				//};
				////Check to see if moving back towards the previous position on the y axis still collides
				//if (place_free(myPos[0],cy + (yDis * yMod))){
				//	xCollision = false;
				//};
			
				//Is the xCollision bigger than the yCollision?
				if (xDis - abs(xTest)) < (yDis - abs(yTest)){
					//If so, let's see what side I'm on
					if (xMod < 0){
						//Collision is on the left side of me
						myPos[0] = cx + xDis;//move me right
					}else if (xMod > 0){
						//Collision is on the right side of me
						myPos[0] = cx - xDis;//move me left
					};
					mySpeed[0] = 0;//stop me
				}else if (xDis - abs(xTest)) > (yDis - abs(yTest)){
					//It's either x or y
					if (yMod < 0){
						//Collision is on top of me
						myPos[1] = cy + yDis;//move me down
					}else if (yMod > 0){
						//Collision is under me
						myPos[1] = cy - yDis;//move me up
						isOnGround = true;
					};
					mySpeed[1] = 0;//stop me
				}else if (xDis - abs(xTest)) == (yDis - abs(yTest)){
					//If it came in diagonally the same amount
					if (yMod < 0){
						myPos[1] = cy + yDis;//move me down
					}else{
						myPos[1] = cy - yDis;//move me up
						isOnGround = true;
					};
					if (xMod < 0){
						myPos[0] = cx + xDis;//move me right
					}else{
						myPos[0] = cx - xDis;//move me left
					};
					//mySpeed = [0,0];
				};
				
				CollidingObject = collision_rectangle(myPos[0] - hw, myPos[1] - hh, myPos[0] + hw, myPos[1] + hh, obj_Solid, false, true);
			};
		};
	};
	
	*/
	
	//This collision system is horrible, but works
	if (myPos != myLastPos){
		if (myPos[1] != myLastPos[1]){isOnGround = false;};
		if (!place_free(myPos[0],myPos[1])){
		
			//Initialise the local variables
			yCollision = true;
			xCollision = true;
			
			//Find out where you came from
			displacement = [myPos[0] - myLastPos[0], myPos[1] - myLastPos[1]];
			absDisp = [abs(displacement[0]), abs(displacement[1])];
			if (displacement[0] != 0){
				xMod = floor(displacement[0]/absDisp[0]);
			};
			if (displacement[1] != 0){
				yMod = floor(displacement[1]/absDisp[1]);
			};
			
			//All this is sloppy as fuck. I need it cleaner.//////////////////
			//Check to see if moving back towards the previous position on the x axis still collides
			if (place_free(myPos[0] - displacement[0],myPos[1])){
				yCollision = false;
				mySpeed[0] = 0;
			};		
			//Check to see if moving back towards the previous position on the y axis still collides
			if (place_free(myPos[0],myPos[1] - displacement[1])){
				xCollision = false;
				mySpeed[1] = 0;
				//Check to see if you hit the ground or not
				if (place_free(myPos[0],myPos[1] - absDisp[1])){
					isOnGround = true;
				};
			};
			////////////////////////////////////////////////////////////////
			
			//Enter a loop
			while (!place_free(myPos[0],myPos[1])){
				//Move out of the collision 1 pixel at a time. God, this is horrible
				if (xCollision && yCollision){
					//myPos = myLastPos;
					mySpeed = [0,0];
					//while (!place_free(myPos[0],myPos[1])){
						myPos[0] -= xMod;
						myPos[1] -= yMod;
					//};
				}else if (yCollision && !xCollision){
					myPos[1] -= yMod;
				};
				else if (xCollision && !yCollision){
					myPos[0] -= xMod;
				};
				else if (!xCollision && !yCollision){
					//This should never happen
					break;
				};
			};
		};
	};//End of sloppy collisions
	
	
	/*
	//I'm not sure these ever worked...
	if (place_meeting(myPos[0],myPos[1],obj_Solid)){
		tempXDis = obj_Solid.sprite_width/2 + sprite_width/2;
		tempYDis = obj_Solid.sprite_width/2 + sprite_height/2;
		overlapX = myPos[0] - obj_Solid.x;
		overlapY = myPos[1] - obj_Solid.y;
		myDisp = [myPos[0] - myLastPos[0],myPos[1] - myLastPos[1]];
		
		if (myDisp[0] > 0){
			//This means the object is to the right of the entity
			//do stuff
			tempXDis *= -1;
		};
		if (myDisp[1] > 0){
			//This means the object is below the entity
			//do stuff
			tempXDis *= -1;
		};
		if (!place_meeting(myPos[0],myLastPos[1],obj_Solid)&& obj_Solid.y > y){
			isOnGound=true;
		};
		if (abs(overlapX) > abs(overlapY)){
			//The collision is mostly vertical
			myPos[1] = obj_Solid.y + tempYDis;
		}else{
			myPos[0] = obj_Solid.x + tempXDis;
		};
		
	};
	*/
	
	//Debug reasons
	//if (myPos[1] > room_height) { myPos[1] = 1 + sprite_get_height(mask_index);};
	
	//Finally, update the character's x and y positions
	x = myPos[0];
	y = myPos[1];
};