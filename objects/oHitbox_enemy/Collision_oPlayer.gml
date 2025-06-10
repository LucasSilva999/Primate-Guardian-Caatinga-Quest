/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

instance_destroy()

oScreenshake.ang = 1
oScreenshake.value += 2

with(other)
{
	state_trade(state_hurt)
	
	damage_handler(other.damage)
}