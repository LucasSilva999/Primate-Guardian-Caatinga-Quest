event_inherited();


//walk var
destiny_x = 0
destiny_y = 0

//status var
damage_value = 1
poise_max = 10
life = 2

//hunt var
dist_aggro= 70
dist_desaggro=70
target = noone

state_hunt = new state()

#region State_Ia
state_ia.start = function()
{
	var _next_state = choose(state_idle,state_walk)
	
	if _next_state == state_walk
	{
		
		state_trade(state_walk)
		
	}else if _next_state == state_idle
	{
		state_trade(state_idle)
	}
	

}
state_ia.running = function()
{


}

#endregion

#region State_idle
state_idle.start = function()
{
	
	
	image_index = 0 
	image_speed = 0
	
}
state_idle.running = function()
{
	
	
	

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
	
	var _dir = point_direction(x, y, destiny_x,destiny_y)
	
	
	
	hspd = lengthdir_x(spd, _dir)
	vspd = lengthdir_y(spd, _dir)

	image_speed = 1
	image_index = 0
	

}
state_walk.running = function()
{
	
	
	
	var _dir = point_direction(x, y, destiny_x,destiny_y)

	
	if(distance_to_object(oPlayer)<= dist_aggro)
	{
		state_trade(state_hunt)
	}
	
	
	mp_potential_step_object(hspd,vspd,0.5,oColision)
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
	if(damage == noone && image_index >= 2)
	{
		damage = instance_create_depth(x-20,y,depth,oHitbox_enemy)
		damage.damage = damage_value
	}
	
	if end_animation()
	{
		state_trade(state_ia)
	}
}

state_attack.ending = function()
{
	target = noone
	
	if (instance_exists(damage))
	{
		instance_destroy(damage)
	}
	damage = noone
}
#endregion

#region State_hurt
state_hurt.start = function()
{
	
	image_index = 0
}
state_hurt.running = function()
{
	
		if (life > 0)
		{
			state_trade(state_ia)
		
		}else
		{
			state_trade(state_dead)
		}
	
}
state_hurt.ending = function()
{
	if (poise < 1)
	{
		poise = poise_max
	}
}
#endregion

#region State_dead
state_dead.start = function()
{
	
	image_index = 0
	
	dead = true
}
state_dead.running = function()
{
	
		instance_destroy()
	
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
						if (state_curret != state_dead)
						{
							state_trade(state_hunt)
						}
					}
				}
			}
		}
	}
}

#endregion

start_state(state_ia)

