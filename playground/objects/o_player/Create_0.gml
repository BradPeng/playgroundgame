/// @description Insert description here
// You can write your code in this editor

//window_set_fullscreen(true);

yspeed = 0;
xspeed = 0;
doubleJump = true;
xacc = 2;
maxspeed = 10;
yacc = 1;
jumpHeight = 20;
jumpComplete = false;
alarm[1] = 0;
playerState = playerStates.move;
dashSpeed = 30;

enum playerStates {
	move,
	dash
}