/// @description Insert description here
// You can write your code in this editor
if(place_meeting(x,y,obj_Attack)){
	if (!isInvincible){
		myHealth--; 
		isInvincible = true;
	};
	if (place_meeting(x,y,obj_Bullet)){
		instance_destroy(obj_Bullet);
	};
};
//if(myHealth<=0){instance_destroy();};
event_inherited();