

#region Verificando se o controle esta conectado
global.gamepad_id = noone
//dead zone
global.dzh = noone
global.dzv = noone

gamepad_connect = function()
{
	var _gamepad_slots = gamepad_get_device_count()
	
	for (var _i = 0; _i < _gamepad_slots; _i++)
	{
		if(gamepad_is_connected(_i))
		{
			global.gamepad_id = _i
			return true
		}
	}
	
	return false
}
#endregion