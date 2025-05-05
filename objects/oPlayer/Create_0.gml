//stados
state_idle = new state()
state_walk = new state()

#region Estado_idle
state_idle.start = function()
{
	
	sprite_index = define_sprite(dir,sPlayer_idle_up, sPlayer_idle_down,sPlayer_idle_right,sPlayer_idle_left)
	
	
	image_index = 0
}

state_idle.running = function()
{
	if (up xor down or left xor right)
	{
		state_trade(state_walk)
	}
}

#endregion


#region Estado_walk
state_walk.start = function()
{
	dir = (point_direction(0,0,right - left,down - up) div 90 )
		
	sprite_index = define_sprite(dir, sPlayer_run_up, sPlayer_run_down,sPlayer_run_right,sPlayer_run_left)
	
	image_index = 0
	
}

state_walk.running = function()
{
	dir = (point_direction(0,0,hspd,vspd) div 90 )
	
	
	vspd = (down - up) * spd
	hspd = (right - left) * spd
	
	if (hspd == 0 &&  vspd == 0)
	{
		state_trade(state_idle)
	}

}
#endregion

#region Iniciando variaveis

up = noone
down = noone
left = noone
right = noone

//Var de movimento
hspd = 0
vspd = 0

//status
spd = 2

dir = 0
#endregion

start_state(state_idle)