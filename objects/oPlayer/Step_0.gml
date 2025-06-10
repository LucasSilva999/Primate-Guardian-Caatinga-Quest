//profundidade
depth = -y

//Input de movimento
up    = keyboard_check(ord("W")) or gamepad_axis_value(global.gamepad_id,gp_axislv) > global.dzv
down  = keyboard_check(ord("S")) or gamepad_axis_value(global.gamepad_id,gp_axislv) < -global.dzv
left  = keyboard_check(ord("A")) or gamepad_axis_value(global.gamepad_id,gp_axislh) < -global.dzh
right = keyboard_check(ord("D")) or gamepad_axis_value(global.gamepad_id,gp_axislh) > global.dzh
//input de golpes e movimentação
attack = mouse_check_button_pressed(mb_left) or gamepad_button_check(global.gamepad_id,gp_face3)
roll = keyboard_check_pressed(vk_shift)




//inicando maquina de estado
state_running()