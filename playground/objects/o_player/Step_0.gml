/// @description Insert description here
// You can write your code in this editor


right = keyboard_check(ord("D"));
left = keyboard_check(ord("A"));
up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));
up_release = keyboard_check_released(ord("W"));
space = keyboard_check_pressed(vk_space);

switch playerState {
	case playerStates.move:
		if (!isOnGround(o_solid)) {
			yspeed += yacc;
			if (up_release) jumpComplete = true;
			if (up_release and yspeed < -6) {
				yspeed = -jumpHeight/2;
			}
	
			if (doubleJump and up and alarm[0] <= 0 and jumpComplete = true) {
				doubleJump = false;
				yspeed = -jumpHeight;
			}
			
		} else {
			doubleJump = true;
			if (up) {
				jumpComplete = false;
				yspeed = -jumpHeight;
				alarm[0] = 20;
			}
		}
	
		if ((isOnWallRight(o_solid) and right) or (isOnWallLeft(o_solid) and left)) {
			playerState = playerStates.wallSlide;
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

		if (space and alarm[2] <= 0) {
			playerState = playerStates.dash
				alarm[1] = 5;
				
		}
		move(o_solid);
		
	break;
		
	case playerStates.dash:
		xspeed = dashSpeed * sign(xspeed); 
		if (alarm[1] <= 0) {
			alarm[2] = 20;
			playerState = playerStates.move;
		}
		move(o_solid);
	break;
		
	case playerStates.wallSlide:
		if ((isOnWallRight and !right) or (isOnWallLeft and !left)) {
			playerState = playerStates.move;	
		} else {
			yspeed = wallSlideSpeed;
			move(o_solid);
		}
	break;
	
}
