//profundidade
depth = -y

//Input de movimento
up    = keyboard_check(ord("W"))
down  = keyboard_check(ord("S"))
left  = keyboard_check(ord("A"))
right = keyboard_check(ord("D"))
//input de golpes e movimentação
attack = mouse_check_button_pressed(mb_left)
roll = keyboard_check_pressed(vk_shift)




//inicando maquina de estado
state_running()