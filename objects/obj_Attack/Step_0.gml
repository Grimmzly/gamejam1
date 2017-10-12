/// @description Insert description here
// You can write your code in this editor
if (myAttacker = 0){instance_destroy()};
if (get_timer() - i > 660000){
	instance_destroy();
	myAttacker.isAttacking=false;
};
x=myAttacker.myPos[0];
y=myAttacker.myPos[1];