/// @description Insert description here
// You can write your code in this editor
if (!position_meeting(x + 3 * dir, y, o_moving_platform_path_h)) {
	dir *= -1;
}
xspeed = spd * dir;
x += xspeed