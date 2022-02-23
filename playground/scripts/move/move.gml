// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function move(groundObject){
	if (place_meeting(x + xspeed, y, o_solid)) {
		while(!place_meeting(x + sign(xspeed), y, o_solid)) {
			x += sign(xspeed);	
		}
	xspeed = 0;
	}
	x += xspeed;
	
	if (place_meeting(x, y + yspeed, o_solid)) {
		while(!place_meeting(x, y + sign(yspeed), o_solid)) {
			y += sign(yspeed);	
		}
		yspeed = 0;
	}
	
	y += yspeed;
}