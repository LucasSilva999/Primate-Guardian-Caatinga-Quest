//estados
state_idle = new state()
state_walk = new state()
state_attack = new state()
state_roll = new state()
state_hurt = new state()
state_dead = new state()


#region Estado_idle
state_idle.start = function()
{
	sPlayer_idle_northeast = sPlayer_idle_up;
	sPlayer_idle_northwest = sPlayer_idle_up;
	sPlayer_idle_southeast = sPlayer_idle_down;
	sPlayer_idle_southwest = sPlayer_idle_down;

	sprite_index = define_sprite8(dir,sPlayer_idle_up, sPlayer_idle_down, sPlayer_idle_right, sPlayer_idle_left,sPlayer_idle_northeast, sPlayer_idle_northwest,sPlayer_idle_southeast, sPlayer_idle_southwest)
	
	
	image_index = 0
}

state_idle.running = function()
{
	if (up xor down or left xor right)
	{
		state_trade(state_walk)
	}
	
	if (attack)
	{
		state_trade(state_attack)
	}
	if (roll)
	{
		state_trade(state_roll)
	}
	
}

#endregion

#region Estado_walk
state_walk.start = function()
{
	dir = (point_direction(0,0,right - left,down - up) div 45) mod 8
		
	sprite_index = define_sprite8(dir, sPlayer_run_up, sPlayer_run_down,sPlayer_run_right,sPlayer_run_left,sPlayer_run_northwest,sPlayer_run_northeast,sPlayer_run_southwest,sPlayer_run_southeast)
	
	image_index = 0
	
}

state_walk.running = function()
{
	dir = (point_direction(0,0,hspd,vspd) div 45 ) mod 8
	
	
	vspd = (down - up) * spd
	hspd = (right - left) * spd
	
	
	if (hspd == 0 &&  vspd == 0)
	{
		state_trade(state_idle)
	}
	if (attack)
	{
		state_trade(state_attack)
	}
	if (roll)
	{
		state_trade(state_roll)
	}
	
	

}
#endregion

#region Estado_attack
state_attack.start = function()
{
	dirm = (point_direction(x,y,mouse_x,mouse_y)  div 90)
	
	sprite_index = define_sprite(dirm, sPlayer_attack_up, sPlayer_attack_down, sPlayer_attack_right, sPlayer_attack_left )
	
	image_index = 0
	
	hspd = 0
	vspd = 0

	var _x = x + lengthdir_x(16, dir * 90)
	var _y = y + lengthdir_y(16, dir * 90)

	
	damage = instance_create_depth(_x,_y,depth, oHitbox)
	
	
	
}

state_attack.running = function()
{
	dirm = (point_direction(x,y,mouse_x,mouse_y) div 90)
	
	if end_animation()
	{
		  state_trade(state_idle)
	}
}

state_attack.ending = function()
{
	instance_destroy(damage)

}
#endregion

#region Estado_rolamento
state_roll.start = function()
{
	dir = (point_direction(0,0,right - left,down - up) div 90 )
	
	
	image_index = 0
	

}
state_roll.running = function()
{
	dir = (point_direction(0,0,right - left,down - up) div 90 )
	
	hspd = lengthdir_x(dir,dash_dir)
	vspd = lengthdir_y(dir,dash_dir)
	
	if end_animation()
	{
		state_trade(state_idle)
	}
}
#endregion

#region Estado_hurt
state_hurt.start = function()
{
	dir = (point_direction(0,0,right - left, down - up)div 90)

	image_index = 0
}		
state_hurt.running = function()
{


}				
#endregion

#region Estado_dead
state_dead.start = function()
{
	dir = (point_direction(0,0,right - left, down - up)div 90)
	
	sprite_index = define_sprite(sPlayer_dead_up,sPlayer_dead_down,sPlayer_dead_right,sPlayer_dead_left)
	image_index = 0

}
state_dead.running = function()
{

}
#endregion

#region Iniciando variaveis
//controles
up = noone
down = noone
left = noone
right = noone
attack = noone
roll = noone

//Var de movimento
hspd = 0
vspd = 0

//status
spd = 2
damage = noone

// direçoes 
dir = 0
dirm = 0
dash_dir = 4
#endregion

start_state(state_idle)