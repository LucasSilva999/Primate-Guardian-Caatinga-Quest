
var _list = ds_list_create()

var _qty = instance_place_list(x,y,oParEnemys,_list,false)

for (var i = 0; i < ds_list_size(_list); i++)
{
	var _actual = _list[| i]
	
	var _exist = array_contains(list_enemy, _actual)
	
	if (!_exist)
	{
		array_push(list_enemy, _actual)
		
		with(_actual)
		{
			if (!dead)
			{
				damage_handler(, other.damage_poise)
			}
		}
	}
}


ds_list_destroy(_list)

