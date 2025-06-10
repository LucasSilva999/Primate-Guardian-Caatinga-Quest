/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
gamepad_connect()

if gamepad_is_connected(global.gamepad_id)
{
	global.dzh = 0.50
	global.dzv = 0.50
}else
{
	global.dzh = 0
	global.dzv = 0

}