value = 0
ang = 0

//forma que altera o angulo
shake_ang = function()
{
	var _val = random_range(-ang,ang)
	
	if (ang != 0)
	{
		ang = lerp(ang,0,.1)
		
		
		
		camera_set_view_angle(view_camera[0], _val)
		if (ang <= 0.1) 
		{
			ang = 0
			
			camera_set_view_angle(view_camera[0],0)
		}
			
	}
}
//forma que altera a posição do viewport
shake_pos = function()
{
	//definindo os limites da mudança de valor
	var _val = random_range(-value, value)
	
	if (value != 0)
	{
		value = lerp(value,0,  .2)
		
		
		
		view_set_xport(0, _val)
		view_set_yport(0, _val)
		
		if (value <= 0.1)
		{
			value = 0
			
			view_set_xport(0, 0)
			view_set_yport(0, 0)
		}
	}
	
	
}