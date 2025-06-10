/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//achando a direção para onde eu devo ser empurrado

var _dir = point_direction(other.x,other.y,x,y)

var _vspd = lengthdir_x(1, _dir)
var _hspd = lengthdir_y(1, _dir)

if (!place_meeting(x + _vspd, y + _hspd, oColision))
{
	x += _vspd
	y += _hspd
}