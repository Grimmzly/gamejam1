/// @description Insert description here
// You can write your code in this editor
motion_set(direction,10);//Added
if (!place_free(x,y)){
	if(place_meeting(x,y,Virtual_Enemy)){instance_destroy()};
	if (!place_meeting(x,y,myAttacker)){instance_destroy()};
};