/// @description Insert description here
// You can write your code in this editor
if (place_free(x,y)) 
{
	do { y++; } until !place_free(x,y);
}