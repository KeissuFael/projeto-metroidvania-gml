//colisão e movimentação
var _velh = sign(velh)
var _velv = sign(velv)

repeat (abs(velh))
{
	if place_meeting(x + _velh, y, obj_ground)
	{
		velh = 0
		break
	}
	x += _velh
}
// VERTICAL
repeat (abs(velv))
{
	if place_meeting(x, y + _velv, obj_ground)
	{
		velv = 0
		break
	}
	y += _velv
}