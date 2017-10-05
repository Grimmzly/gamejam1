/// @description Insert description here
// You can write your code in this editor
if (get_timer() - lastSpawnTime > spawnRate){
	lastSpawnTime = get_timer(); 
	instance_create_depth(x,y,depth,spawnType);
};
if (place_meeting(x,y,obj_Attack)){instance_destroy();};