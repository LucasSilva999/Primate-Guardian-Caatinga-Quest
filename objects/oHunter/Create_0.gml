event_inherited();
time_state = game_get_speed(gamespeed_fps) * 5
timer_state = time_state

destiny_x = 0
destiny_y = 0

dist_aggro= 70
dist_desaggro=70
target = noone

state_hunt = new state()

#region State_idle
state_idle.start = function()
{
	

		
	image_speed = 0
	image_index = 0 
	
	timer_state = time_state
}
state_idle.running = function()
{
	
	
	timer_state--
	
	var _time = irandom(timer_state)
	if (_time <= 0)
	{
		var _state_new = choose(state_idle,state_idle,state_walk)
		state_trade(_state_new)
	} 
	if(distance_to_object(oPlayer)<= dist_aggro)
	{
		state_trade(state_hunt)
	}
}
#endregion

#region State_walk
state_walk.start = function()
{
 
	destiny_x = irandom_range(0,room_width)
	destiny_y = irandom_range(0,room_height)
	
	
	image_speed = 1
	image_index = 0
	
	timer_state = time_state
		
}
state_walk.running = function()
{
	
	
	
	timer_state--
	var _time = irandom(timer_state)
	if (_time <= 0)
	{
		var _state_new = choose(state_idle,state_walk)
		
		state_trade(_state_new)
	}
	
	if(distance_to_object(oPlayer)<= dist_aggro)
	{
		state_trade(state_hunt)
	}
	
	
	mp_potential_step_object(destiny_x,destiny_y,1,oColision)
}

#endregion 

#region State_attack
state_attack.start = function()
{
	
	sprite_index= sHunter_left_attack
	image_index=0
}

state_attack.running = function()
{
	
	if end_animation()
	{
		state_trade(state_idle)
	}
}

state_attack.ending = function()
{
	target = noone

}
#endregion

#region State_hurt
state_hurt.start = function()
{
	
	image_index = 0
}
state_hurt.running = function()
{
	if end_animation()
	{	
		if (life) > 0
		{
			state_trade(state_idle)
		
		}else
		{
			state_trade(state_dead)
		}
	}
}

#endregion

#region State_dead
state_dead.start = function()
{
	
	image_index = 0
}
state_dead.running = function()
{
	if end_animation()
	{
		instance_destroy()
	}
}
#endregion

#region State_hunting
state_hunt.start = function()
{
	image_index = 0
	
	if (instance_exists(oPlayer))
	{
		target = oPlayer.id
	}	
}
state_hunt.running = function()
{
	if (!instance_exists(oPlayer))
	{
		target = noone
		state_trade(state_idle)
	}
	if (distance_to_object(oPlayer)>= dist_desaggro)
	{
		state_trade(state_idle)
	}
	
	mp_potential_step(target.x,target.y,1,oColision)
	
	var _dist = point_distance(x,y,target.x,target.y)
	if (_dist <= 30)
	{
		state_trade(state_attack)
	}
	
	var _n = instance_number(object_index)
	
	for (var i = 0; i < _n; i++)
	{
		var _slime = instance_find(object_index,i)
		
		if (_slime == id)
		{
			
		}
		else
		{
			if (_slime.target != target)
			{
				var _dist = point_distance(x,y,_slime.x,_slime.y)
				if (_dist < 100)
				{
				
					with(_slime)
					{
						state_trade(state_hunt)
					}
				}
			}
		}
	}
}

#endregion

start_state(state_idle)

