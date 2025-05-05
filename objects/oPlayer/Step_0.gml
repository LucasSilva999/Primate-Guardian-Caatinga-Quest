//profundidade
depth = -y

//Input de movimento
up    = keyboard_check(ord("W"))
down  = keyboard_check(ord("S"))
left  = keyboard_check(ord("A"))
right = keyboard_check(ord("D"))
//input de golpes
attack = mouse_check_button_pressed(mb_left)




//inicando maquina de estado
state_running()