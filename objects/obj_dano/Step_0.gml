var outro = instance_place(x, y, obj_enemy)

if (outro)
{
	if (outro.id != pai)
	{
		if (outro.vida_atual > 0)
		{
		outro.state = "hit"
		outro.vida_atual -= dano
		instance_destroy()
		}
	}
}