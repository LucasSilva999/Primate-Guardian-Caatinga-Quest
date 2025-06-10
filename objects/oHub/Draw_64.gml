/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
#region HUD
var _scale = 2

var _guia = display_get_gui_height()
var _spra = sprite_get_height(sHp_bar) * _scale
var _huda =  _spra

var _life = oPlayer.life
var _max_life = oPlayer.max_life







//vida
draw_sprite_ext(sLife_bar,0,90.5,39, (_life/_max_life) *_scale,_scale,0,c_white,1)

//energia
draw_sprite_ext(sEnergy_bar,0,94,80, (_life/_max_life) *_scale,_scale,0,c_white,1)

//hud
draw_sprite_ext(sHp_bar,0,100,42, _scale, _scale, 0, c_white,1)


#endregion