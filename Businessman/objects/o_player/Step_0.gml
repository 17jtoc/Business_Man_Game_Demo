switch (state)
{
	case "normal":
		if (hascontrol)
		{
			grv = 0.3;
			walksp = 3;
			
			key_right = keyboard_check(ord("D")) || keyboard_check(vk_right);
			key_left = keyboard_check(ord("A")) || keyboard_check(vk_left);
			key_jump = keyboard_check_pressed(vk_space);

	

			//movement calculations
			var move = key_right - key_left;

			hsp = move * walksp;

			vsp = vsp + grv;


			canjump -= 1;
			if (canjump > 0) && (key_jump)
			{
				vsp = -7;
				canjump = 0;
			}

			//horizontal collision
			if (place_meeting(x + hsp,y,o_wall))
			{
				while (!place_meeting(x+sign(hsp),y,o_wall))
				{
					x = x + sign(hsp);	
				}	
				hsp = 0;
	
			}

			x = x + hsp;


			//vertical collision
			if (place_meeting(x,y + vsp,o_wall))
			{
				while (!place_meeting(x,y + sign(vsp),o_wall))
				{
					y = y + sign(vsp) * 0.1;	
				}	
				vsp = 0;
	
			}

			y  = y + vsp;

			//animation
			if (!place_meeting(x,y + 1,o_wall))
			{
				sprite_index = s_jump;
				image_speed = 0;
				if (sign(vsp) > 0) image_index = 2; else image_index = 1;
				if mouse_check_button_pressed(mb_left)
				{
					image_index = 0;
					state = "air_spin";
				}
	
	
			}
			else
			{
				if mouse_check_button_pressed(mb_left)
				{
					image_index = 0;
					state = "attack_one";
				}
				
				canjump = 8
				image_speed = 1;
	
				if (hsp == 0)
				{
					sprite_index = s_idle;	
				}	
				else 
				{
					sprite_index = s_run
				}
	

				}	
	
			if (hsp != 0) image_xscale = sign(hsp);
			}

		
		break;
		
	case "attack_one":
	
		
		
		sprite_index = s_attack_one;
		

		break;
		
		
		
	case "air_spin":
		
		image_speed = 1;
		grv = 0.2
		walksp = 1;
		sprite_index = s_attack_one;
		vsp += grv;
		
		key_right = keyboard_check(ord("D")) || keyboard_check(vk_right);
		key_left = keyboard_check(ord("A")) || keyboard_check(vk_left);
			

	

		//movement calculations
		var move = key_right - key_left;

		hsp = move * walksp;
		
		
		if (place_meeting(x + hsp,y,o_wall))
			{
				while (!place_meeting(x+sign(hsp),y,o_wall))
				{
					x = x + sign(hsp);	
				}	
				hsp = 0;
	
			}

			x = x + hsp;


			//vertical collision
			if (place_meeting(x,y + vsp,o_wall))
			{
				while (!place_meeting(x,y + sign(vsp),o_wall))
				{
					y = y + sign(vsp) * 0.1;	
				}	
				vsp = 0;
				state = "normal"
	
			}
			y = y  + vsp;
			
			

			
		
}