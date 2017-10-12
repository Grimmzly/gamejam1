/// @description Insert description here
// You can write your code in this editor
randomize();
rnd = (random_range(0,400) / 100);
mySpeed = [4 - rnd,rnd];
tmpx = (x - obj_Player.x);
tmpy = (y - obj_Player.y);
mySpeed[0] *= -(tmpx / abs(tmpx));
mySpeed[1] *= -(tmpy / abs(tmpy));

//This code will create a random colour for the ghost on spawn
//image_blend = make_colour_rgb(random(255),random(255),random(255));