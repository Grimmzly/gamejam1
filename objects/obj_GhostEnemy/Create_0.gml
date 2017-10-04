/// @description Insert description here
// You can write your code in this editor
randomize();
rnd = (random_range(0,400) / 100);
mySpeed = [4 - rnd,rnd];
tmpx = (x - obj_Player.x);
tmpy = (y - obj_Player.y);
mySpeed[0] *= -(tmpx / abs(tmpx));
mySpeed[1] *= -(tmpy / abs(tmpy));