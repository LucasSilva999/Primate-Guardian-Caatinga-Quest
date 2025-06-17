/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

instance_destroy()



with(other)
{
	if take_dmg == true
	{
		oScreenshake.ang = 1
		oScreenshake.value += 2
		
		state_trade(state_hurt)
	
		damage_handler(other.damage)	
		take_dmg = false
	}
}