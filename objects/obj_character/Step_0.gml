//MOVIMENTAÇÃO

var left, right, jump, attack
var chao = place_meeting(x, y + 1, obj_ground)
right = keyboard_check(vk_right)
left = keyboard_check(vk_left)
jump = keyboard_check_pressed(ord("Z"))
attack = keyboard_check(ord("X"))

velh = (right - left) * max_velh

//GRAVIDADE IN GAME
if(!chao)
{
	if (velv < max_velv * 2) {
	velv += GRAVIDADE * massa
	}
}
// INICIANDO STATE MACHINE
switch(state)
{
#region Idle
	case "parado":
	{
		//Comportamento do state
		sprite_index = spr_idle
		// Condição de troca de state
		// MOV
		if (right || left)
		{
			state = "movendo"	
		} else if (jump) {
			state = "pulando"
			velv = (-max_velv * jump)
			image_index = 0
		} else if (velv != 0) { 
		state = "pulando"
	} else if (attack) {
			state = "atacando"
			image_index = 0
		}
		break
	}
#endregion
#region Moving
	case "movendo":
	{
	//comportamento do estado de mov
	sprite_index = spr_running
		
	//condição de trocas de estados
	//parado
	if (abs(velh) < .1)
	{
		state = "parado"
		velh = 0
	} else if (jump) {
		state = "pulando"
		velv = -max_velv
		image_index = 0
	} else if (velv != 0) { 
		state = "pulando"
	} else if (attack) {
		state = "atacando"
		image_index = 0
	}
	break
	}
#endregion
#region Jumping	
	case "pulando":
	{
	//comportamento
		sprite_index = spr_jumping
	//condição de troca de estado
	if(chao)
	{
		state = "parado"
	}
		break
	}
#endregion
#region Attacking
	case "atacando":
	{
		sprite_index = spr_attacking
		
		if (image_index > 3 && dano == noone && avaible)
		{
			dano = instance_create_layer(x + sprite_width/2, y - sprite_height/4.5, layer, obj_dano)
			dano.dano = ataque
			dano.pai = id
			avaible = false
		}
		
		if(image_index > image_number-1 ) 
		{
			state = "parado"
			avaible = true
			if (dano)
			{
				instance_destroy(dano, false)
				dano = noone
			}
		}
		break
	}
#endregion
#region Dashing
	case "dash":
	{
		sprite_index = spr_attacking
		
		//velocidade dash
		velh = image_xscale * dash_velh
		
		// parando
		if(image_index > image_number-1 ) 
		{
			state = "parado"			
		}
	break
	}
#endregion
}
if (keyboard_check_pressed(ord("R"))) {
	room_restart()	
}
