
function state() constructor
{
	static start = function() {}
	
	static running = function() {}

	static ending = function() {}
	
}

 function start_state(_state)
 {
 
	state_curret = _state
	
	state_curret.start()
 }
 
 function state_running()
 {
	state_curret.running()
 
 }
 
 function state_trade(_state)
 {
	state_curret.ending()
	
	state_curret = _state
	
	state_curret.start()
 }
 
function define_sprite(_dir = 0, _sprite_up,_sprite_down,_sprite_right,_sprite_left)
{
	var _sprite
	
	switch(_dir)
	{
		case 0: _sprite = _sprite_right break;
		case 1: _sprite = _sprite_up break;
		case 2: _sprite = _sprite_left break;
		case 3: _sprite = _sprite_down break;
	}
	
	return _sprite; 
}
 