/// @description Insert description here
// You can write your code in this editor

//Before we waste a frame on them, are they already dead?
if (myHealth <= 0){instance_destroy(self);};

//As long as this Object is active, run the following
if(isActive){
	//Update the logic frames per step
	myLastPos[0] = myPos[0];
	myLastPos[1] = myPos[1];

	//Check to see if you're jumping
	if (isOnGround && isJumping) { mySpeed[1] = myJumpSpeed; isOnGround = false;};

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
	
	
	//This collision system is horrible, but works
	if (myPos != myLastPos){
		if (!place_free(myPos[0],myPos[1])){
		
			//Initialise the local variables
			yCollision = true;
			xCollision = true;
			//Find out where you came from
			displacement = [myPos[0] - myLastPos[0], myPos[1] - myLastPos[1]];
			absDisp = [abs(displacement[0]), abs(displacement[1])];
			xMod = floor(displacement[0]/absDisp[0])
			yMod = floor(displacement[1]/absDisp[1]);
			
			
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
				if (yCollision && !xCollision){
					myPos[1] -= yMod;
				};
				else if (xCollision && !yCollision){
					myPos[0] -= xMod;
				};
				else{
					myPos = myLastPos;
					mySpeed = [0,0];
					while place_free(myPos[0]+xMod,myPos[1]+yMod){
						myPos[0] += xMod;
						myPos[1] += yMod;
					};
				};
			};
		};
	};//End of sloppy collisions
	
	/*
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
	//Finally, update the character's x and y positions
	x = myPos[0];
	y = myPos[1];
};