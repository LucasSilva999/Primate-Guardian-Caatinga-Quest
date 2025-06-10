
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
	var _sprite;
	
	switch(_dir)
	{
		case 0: _sprite = _sprite_right break;
		case 1: _sprite = _sprite_up break;
		case 2: _sprite = _sprite_left break;
		case 3: _sprite = _sprite_down break;
	}
	
	return _sprite; 
}
function define_sprite8(_dir = 0,_sprite_up,_sprite_down,_sprite_right,_sprite_left,_sprite_northeast,_sprite_northwest,_sprite_southeast,_sprite_southwest)
{
	
	var _sprite
	
	switch(_dir)
	{
		case 0:  _sprite = _sprite_right;        break; // Direita
        case 1:  _sprite = _sprite_northwest;     break; // Cima-direita
        case 2:  _sprite = _sprite_up;           break; // Cima
        case 3:  _sprite = _sprite_northeast;      break; // Cima-esquerda
        case 4:  _sprite = _sprite_left;         break; // Esquerda
        case 5:  _sprite = _sprite_southeast;    break; // Baixo-esquerda
        case 6:  _sprite = _sprite_down;         break; // Baixo
        case 7:  _sprite = _sprite_southwest;   break; // Baixo-direita
	
	
	
	}
	return _sprite
}