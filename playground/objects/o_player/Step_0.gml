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
	while(!place_meeting(x, y, o_solid) and yspeed > 0) {
		y++;	
	}
	
	if(place_meeting(x, y - yspeed, o_solid)) {
		yspeed = 1;
	}
	
	yspeed = 0;
	doubleJump = true;
	
	if (up) {
		yspeed = -20;
		alarm[0] = 20;
	}
}

if (right) {
	xspeed = clamp(xspeed + xacc, 0, maxspeed);	
}
if (left) {
	xspeed = clamp(xspeed - xacc, -maxspeed, 0);		 
}

if (!left and !right) {
	xspeed = 0;	
}
x += xspeed;
y += yspeed;