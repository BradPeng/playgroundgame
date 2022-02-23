/// @description Insert description here
// You can write your code in this editor


right = keyboard_check(ord("D"));
left = keyboard_check(ord("A"));
up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));
up_release = keyboard_check_released(ord("W"));

if (!isOnGround(o_solid)) {
	yspeed += yacc;
	
	if (up_release and yspeed < -6) {
		yspeed = -jumpHeight/2;
	}
	
	if (doubleJump and up and alarm[0] <= 0) {
		doubleJump = false;
		yspeed = -jumpHeight;
	}
} else {
	doubleJump = true;
	if (up) {
		yspeed = -jumpHeight;
		alarm[0] = 20;
	}
}


if (place_meeting(x, y + yspeed, o_solid)) {
	while(!place_meeting(x, y + sign(yspeed), o_solid)) {
		y += sign(yspeed);	
	}
	yspeed = 0;
}
	
if (left or right) {
	xspeed += (right - left) * xacc;
	xspeed = clamp(xspeed, -maxspeed, maxspeed);	
} else {
	if (xspeed > 0) {
		xspeed -= xacc;
	} else if (xspeed < 0) {
		xspeed += xacc;	
	}
}	

if (place_meeting(x + xspeed, y, o_solid)) {
	while(!place_meeting(x + sign(xspeed), y, o_solid)) {
		x += sign(xspeed);	
	}
	xspeed = 0;
}
	
	
x += xspeed;
y += yspeed;