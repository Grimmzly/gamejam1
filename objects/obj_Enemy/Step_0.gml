/// @description Insert description here
// You can write your code in this editor
//if(!place_free(x,y-1)) {isWalkingRight = !isWalkingRight; isWalkingLeft = !isWalkingLeft;};
if(myPos = myLastPos) {isWalkingRight = !isWalkingRight; isWalkingLeft = !isWalkingLeft;};
event_inherited();
//if(!place_free(x,y)) {isWalkingRight = true; isWalkingLeft = false;}
//else {isWalkingLeft = true; isWalkingRight = false;};
if(place_meeting(x,y,obj_Attack)){myHealth--;};
if(myHealth<=0){instance_destroy();};