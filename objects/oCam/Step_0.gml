global.cmx= lerp(global.cmx, oPlayer.x - global.cmw/2, .2)
global.cmy= lerp(global.cmy, oPlayer.y - global.cmh/2, .2)

camera_set_view_pos(view_camera[0], global.cmx, global.cmy)


