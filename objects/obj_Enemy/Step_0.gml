/// @description Insert description here
// You can write your code in this editor
event_inherited();
if(!place_free(x + maxSpeed[0],y)) {isWalkingRight = false; isWalkingLeft = true;}
if(!place_free(x - maxSpeed[0],y)) {isWalkingRight = true; isWalkingLeft = false;}
else {isWalkingLeft = true; isWalkingRight = false;};