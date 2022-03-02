/// @description Insert description here
// You can write your code in this editor


right = keyboard_check(ord("D"));
left = keyboard_check(ord("A"));
jump = keyboard_check_pressed(vk_space);//keyboard_check(ord("W"));
down = keyboard_check(ord("S"));
jumpHold = keyboard_check(vk_space);
jump_release = keyboard_check_released(vk_space)//keyboard_check_released(ord("W"));
dash = keyboard_check_pressed(vk_shift);

switch playerState {
	case playerStates.move:
		//show_debug_message("move");
		if (!isOnGround(o_solid)) {
			yspeed += yacc;
			if (jump_release) jumpComplete = true;
			if (jump_release and yspeed < -6) {
				yspeed = -jumpHeight/2;
			}
	
			if (doubleJump and jump and alarm[0] <= 0 and jumpComplete = true) {
				doubleJump = false;
				yspeed = -jumpHeight;
			}
			
		} else {
			doubleJump = true;
			if (jump) {
				jumpComplete = false;
				yspeed = -jumpHeight;
				alarm[0] = 20;
			}
		}
	
		if ((isOnWallRight(o_solid) and right) or (isOnWallLeft(o_solid) and left)) {
			playerState = playerStates.wallSlide;
			doubleJump = true;
		} 
		
		
		if (left and xspeed > -maxspeed) {
			xspeed += -xacc;
			
			if (place_meeting(x, y + 1, o_moving_platform)) {
				currentPlatform = instance_nearest(x, y, o_moving_platform);
				if (currentPlatform.xspeed > 0) {
					xspeed = xspeed - (currentPlatform.xspeed);	 
				} else {
					xspeed = xspeed + (currentPlatform.xspeed);	 
				}	 
			}
		} else if (right and xspeed < maxspeed) {
			xspeed += xacc;
			
			if (place_meeting(x, y + 1, o_moving_platform)) {
				currentPlatform = instance_nearest(x, y, o_moving_platform);
				if (currentPlatform.xspeed > 0) {
					xspeed = xspeed + (currentPlatform.xspeed);	 
				} else {
					xspeed = xspeed - (currentPlatform.xspeed);	 
				}
			}
		} else if (!place_meeting(x, y+1, o_moving_platform)) {
			
			if (xspeed > 0) {
				xspeed -= xacc;
			} else if (xspeed < 0) {
				xspeed += xacc;	
			}
			
		} else if (place_meeting(x, y+1, o_moving_platform)) {
			currentPlatform = instance_nearest(x, y, o_moving_platform);
			xspeed = currentPlatform.spd * currentPlatform.dir	 
		}

		if (dash and alarm[2] <= 0) {
			playerState = playerStates.dash
			alarm[1] = 5;
				
		}
		move(o_solid);
		
	break;
		
	case playerStates.dash:
		xspeed = dashSpeed * sign(xspeed); 
		if (alarm[1] % 2 == 0) {
			instance_create_layer(x, y, "Instances", o_player_dash_image);
		}
		if (alarm[1] <= 0) {
			alarm[2] = 20;
			playerState = playerStates.move;
		}
		move(o_solid);
	break;
		
	case playerStates.wallSlide:
		//show_debug_message("slide");
		doubleJump = true;
		onLeft = isOnWallLeft(o_solid);
		onRight = isOnWallRight(o_solid);
		if ((!onLeft and !onRight) or ((onRight and !right) or (onLeft and !left))) {
			playerState = playerStates.move;	
		} else {
			if (((onLeft and left) or (onRight and right)) and jumpHold) {
				doubleJump = true;
				jumpComplete = false;
				yspeed = -jumpHeight;
				xspeed = wallKickXSpeed * (left - right);
				alarm[0] = 20;
				playerState = playerStates.move;	
		
			} else {
				yspeed = wallSlideSpeed;
				move(o_solid);
			}
		}
	break;
	
}
