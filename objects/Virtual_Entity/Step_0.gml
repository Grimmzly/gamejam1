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
	if (isOnGround && isJumping) { mySpeed[1] = -20; isOnGround = false;};

	//Check to see if you're walking
	if (isWalkingRight && !isWalkingLeft) {myAccel[0] = 1;};
	else if (isWalkingLeft && !isWalkingRight) {myAccel[0] = -1;};
	else {myAccel[0] = 0;};

	//Throttling speed
	//x = clamp(myPos[0],-20,20);
	if (mySpeed[0] < maxSpeed[0] && mySpeed[0] > -maxSpeed[0]) {
		mySpeed[0] += myAccel[0];
	};
	if (mySpeed[1] < maxSpeed[1] && mySpeed[1] > -maxSpeed[1]) {
		mySpeed[1] += myAccel[1];
	};

	//Keeping the throttled speed within the parameters
	if mySpeed[0] > maxSpeed[0] mySpeed[0] = maxSpeed[0];
	if mySpeed[0] < -maxSpeed[0] mySpeed[0] = -maxSpeed[0];
	if mySpeed[1] > maxSpeed[1] mySpeed[1] = maxSpeed[1];
	if mySpeed[1] < -maxSpeed[1] mySpeed[1] = -maxSpeed[1];

	if (!isWalkingRight && !isWalkingLeft && isOnGround) mySpeed[0] *= 0.65;

	//Set the new Position
	myPos[0] += mySpeed[0];
	myPos[1] += mySpeed[1];

	
	//This collision system is horrible
	if (myPos != myLastPos){
		if (!place_free(myPos[0],myPos[1])){
			//Find out where you came from
			displacement = [myPos[0] - myLastPos[0],myPos[1] - myLastPos[1]];
	
	
			//Check to see if moving back towards the previous position on the x axis still collides
			if (place_free(myPos[0] - displacement[0],myPos[1])){
				xCollision = true;
				mySpeed[0] = 0;
			}else xCollision = false;
		
			//Check to see if moving back towards the previous position on the y axis still collides
			if (place_free(myPos[0],myPos[1] - displacement[1])){
				yCollision = true;
				mySpeed[1] = 0;
				//Check to see if you hit the ground or not
				if (place_free(myPos[0],myPos[1] - abs(displacement[1]))){
					isOnGround = true;
				};
			}else yCollision = false;
		
			//Enter a loop
			while (!place_free(myPos[0],myPos[1])){
				//Move out of the collision 1 pixel at a time. God, this is horrible
				if (xCollision){
					myPos[0] -= floor(displacement[0]/abs(displacement[0]));
				};
				if (yCollision){
					myPos[1] -= floor(displacement[1]/abs(displacement[1]));
				};
				if (!yCollision && !xCollision){
					if place_free(myLastPos[0],myLastPos[1]){
						myPos = myLastPos;
					};
				};
			};
		};
	};
	//Finally, update the character's x and y positions
	x = myPos[0];
	y = myPos[1];
};