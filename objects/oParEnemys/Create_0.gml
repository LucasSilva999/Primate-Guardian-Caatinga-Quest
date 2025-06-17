//randomizando
randomize()
//status
life = noone
poise_max = noone
dead = false

//var attack
damage = noone
damage_value = noone

spd= 0.2
hspd = 0 
vspd = 0

//ia
alarm [0]= 1

//definindo poise
poise = poise_max

//lidando com o dano
damage_handler = function(_damage = 1, _poise = 1)
{
	life -= _damage
	
	poise = max(poise - _poise,0)
	
	if (poise<=0 or state_curret != state_attack)
	{
		state_trade(state_hurt)
	}
}

//states
state_ia = new state()
state_idle = new state()
state_walk = new state()
state_attack = new state()
state_hurt = new state()
state_dead = new state()




start_state(state_ia)