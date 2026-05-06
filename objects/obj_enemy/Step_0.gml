var chao = place_meeting(x, y + 1, obj_ground)

if (!chao)
{
	velv += GRAVIDADE * massa
}

switch (state)
{
	case "parado":
	{
		if (sprite_index =! spr_enemy_idle) {
			image_index = 0	
		}
		sprite_index = spr_enemy_idle
		
		//condição
		if (position_meeting(mouse_x,mouse_y, self))
		{
			if (mouse_check_button_pressed(mb_right))
			{
				state = "hit"
			}	
		}
		break
	}
	
	case "hit":
	{
		if (sprite_index != spr_enemy_hit)
		{
			image_index = 0	
		}
		sprite_index = spr_enemy_hit
		
		if (vida_atual > 0)
		{
			if (image_index > image_number - 1) 
			{
				state = "parado"
			}
		}
		else
		{	
			if (image_index > image_number - 1)	
			{
				state = "dead"
			}
		}
	break
}
	
	case "dead":
	{
		if (sprite_index != spr_enemy_dying)
		{
			image_index = 0
		}
		if (image_index > image_number - 1)
		{	
			image_speed = 0
			image_alpha -= .01
			
			if (image_alpha <= 0) 
			{
				instance_destroy()
			}
		}
		sprite_index = spr_enemy_dying
	break	
	}
}