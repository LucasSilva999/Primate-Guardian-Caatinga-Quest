//estados
state_idle = new state()
state_walk = new state()
state_attack = new state()
state_dash = new state()
state_hurt = new state()
state_dead = new state()
state_cure = new state()

#region Damage_handler
damage_handler = function(_damage = 1)
{
	if (state_curret == state_dead)return;
	life -= _damage 
	
	if (life <= 0)
	{
		state_trade(state_dead)
		return
	}
}
#endregion

#region Estado_idle
state_idle.start = function()
{
	sPlayer_idle_northeast = sPlayer_idle_up;
	sPlayer_idle_northwest = sPlayer_idle_up;
	sPlayer_idle_southeast = sPlayer_idle_down;
	sPlayer_idle_southwest = sPlayer_idle_down;
	

	sprite_index = define_sprite8(last_dir,sPlayer_idle_up, sPlayer_idle_down, sPlayer_idle_right, sPlayer_idle_left,sPlayer_idle_northeast, sPlayer_idle_northwest,sPlayer_idle_southeast, sPlayer_idle_southwest)
	
	
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
	if (dash)
	{
		state_trade(state_dash)
	}
	if (cure)
	{
		state_trade(state_cure)
	}
	
	
}

#endregion

#region Estado_walk
state_walk.start = function()
{
	dir = (point_direction(0,0,right - left,down - up) div 45) mod 8
	last_dir = dir
	
		
	sprite_index = define_sprite8(dir, sPlayer_run_up, sPlayer_run_down,sPlayer_run_right,sPlayer_run_left,sPlayer_run_northwest,sPlayer_run_northeast,sPlayer_run_southwest,sPlayer_run_southeast)
	
	image_index = 0
	
}

state_walk.running = function()
{
	
	
	dir = (point_direction(0,0,hspd,vspd) div 45 ) mod 8
	sprite_index = define_sprite8(dir, sPlayer_run_up, sPlayer_run_down,sPlayer_run_right,sPlayer_run_left,sPlayer_run_northwest,sPlayer_run_northeast,sPlayer_run_southwest,sPlayer_run_southeast)
	
	
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
	if (dash)
	{
		state_trade(state_dash)
	}
	
	

}
#endregion

#region Estado_attack
state_attack.start = function()
{
	sPlayer_attack_northeast = sPlayer_attack_up;
    sPlayer_attack_northwest = sPlayer_attack_up;
    sPlayer_attack_southeast = sPlayer_attack_down;
    sPlayer_attack_southwest = sPlayer_attack_down;

		dirm = (point_direction(x,y,mouse_x,mouse_y)  div 45) mod 8
		last_dir = dirm
	    sprite_index = define_sprite8(dirm, sPlayer_attack_up, sPlayer_attack_down, sPlayer_attack_right, sPlayer_attack_left,sPlayer_attack_northeast,sPlayer_attack_northwest, sPlayer_attack_southeast, sPlayer_attack_southwest )
		image_index = 0
		 
	
	
	hspd = 0
	vspd = 0
	
}

state_attack.running = function()
{
	if (image_index >= 4 && my_damage == noone)
	{
		if gamepad_is_connected(global.gamepad_id)
		{
			var _x = x + lengthdir_x(16, dir * 90)
			var _y = y + lengthdir_y(16, dir * 90)

			my_damage = instance_create_depth(_x,_y,depth, oHitbox)
			my_damage.damage_poise = damage_poise
		}
		else
		{	
		var _x = x + lengthdir_x(16, dirm * 45)
		var _y = y + lengthdir_y(16, dirm * 45)

		my_damage = instance_create_depth(_x,_y,depth, oHitbox)
		my_damage.damage_poise = damage_poise
		
		}
	}
	
	if end_animation()
	{
		  state_trade(state_idle)
	}
}

state_attack.ending = function()
{
	if (instance_exists(my_damage))
	{
		instance_destroy(my_damage)
	}
	my_damage = noone
}
#endregion

#region Estado_dash
state_dash.start = function()
{
    sPlayer_dash_northeast = sPlayer_dash_up;
    sPlayer_dash_northwest = sPlayer_dash_up;
    sPlayer_dash_southeast = sPlayer_dash_down;
    sPlayer_dash_southwest = sPlayer_dash_down;

	
    if (hspd != 0 or vspd != 0)
    {
        dash_dir = point_direction(0,0, right - left, down - up);
        dir = (point_direction(0,0, right - left, down - up) div 45) mod 8;
    }
    else
    {
       
        dash_dir = last_dir * 45
        dir = last_dir;
    }

    
    sprite_index = define_sprite8(dir, sPlayer_dash_up, sPlayer_dash_down, sPlayer_dash_right, sPlayer_dash_left, sPlayer_dash_northeast, sPlayer_dash_northwest, sPlayer_dash_southeast, sPlayer_dash_southwest);
    image_index = 0;
	
}

state_dash.running = function()
{

	if (image_index < 5)
	{
		hspd = 0
		vspd = 0
		
		take_dmg = true
	}
	else
	{
		take_dmg = false
		
		hspd = lengthdir_x(dash_spd, dash_dir);
        vspd = lengthdir_y(dash_spd, dash_dir);
	}   

    sprite_index = define_sprite8(dir, sPlayer_dash_up, sPlayer_dash_down, sPlayer_dash_right, sPlayer_dash_left, sPlayer_dash_northeast, sPlayer_dash_northwest, sPlayer_dash_southeast, sPlayer_dash_southwest);

    if (end_animation())
    {
 
		
		state_trade(state_idle);
        hspd = 0;
        vspd = 0;
    }
}

state_dash.ending = function()
{
	take_dmg = true
}

#endregion

#region Estado_cure
state_cure.start = function()
{
	
	dir = (point_direction(0,0,right - left, down - up) div 90)
	
	image_index = 0
	
	hspd = 0
	vspd = 0
	
	if (cure_amount > 0)
	{
		cure_amount -= 1
		life += cure_val
	}
}
state_cure.running = function()
{
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

	take_dmg = false
	
	image_index = 0
	
	vspd = 0
	hspd = 0
	
}		
state_hurt.running = function()
{
	if end_animation()
	{
		state_trade(state_idle)
	}
	

}
state_hurt.ending = function()
{
	take_dmg = true
}
#endregion

#region Estado_dead
state_dead.start = function()
{
	dir = (point_direction(0,0,right - left, down - up)div 90)
	
	sprite_index = define_sprite(dir,sPlayer_dead_up,sPlayer_dead_down,sPlayer_dead_right,sPlayer_dead_left)
	image_index = 0
	imageindex = image_index

}
state_dead.running = function()
{
	if end_animation()
	{
		image_index = image_number - 1
	}
}
#endregion

#region Iniciando variaveis
//controles
up = noone 
down = noone
left = noone
right = noone
attack = noone
dash = noone
cure = noone

//Var de movimento
hspd = 0
vspd = 0



//status
spd = 2
my_damage = noone
damage_poise = 8
max_life = 10
life = max_life

// direçoes 
dir = 0
dirm = 0
last_dir = 0

//dash
dash_dir = noone
dash_spd = 2

//cure
cure_val = 1
cure_amount = 2

//invicibilidade
take_dmg = true
alarm [0]= 1

#endregion

start_state(state_idle)