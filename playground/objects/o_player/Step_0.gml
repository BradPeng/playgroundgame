/// @description Insert description here
// You can write your code in this editor


right = keyboard_check(ord("D"));
left = keyboard_check(ord("A"));
up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));

if(!place_meeting(x, y + yspeed, o_solid)) {
	yspeed += 1;
	if (doubleJump and up and alarm[0] <= 0) {
		doubleJump = false;
		yspeed = -20;
	}
		
} else {
	while(!place_meeting(x, y, o_solid)) {
		y++;	
	}
	yspeed = 0;
	doubleJump = true;
	
	if (up) {
		yspeed = -20;
		alarm[0] = 15;
	}
}

if (right) {
	xspeed = 5;	
}
if (left) {
	xspeed = -5;	 
}

if (!left and !right) {
	xspeed = 0;	
}
x += xspeed;
y += yspeed;