xspd = 0;
yspd = 0;

move_speed = 4;

sprite[RIGHT] = spr_EmmaR;
sprite[UP] = spr_EmmaU;
sprite[LEFT] = spr_EmmaL;
sprite[DOWN] = spr_EmmaD;

face = DOWN;

right_key = keyboard_check(vk_right) || keyboard_check(68);
left_key = keyboard_check(vk_left) || keyboard_check(65);
up_key = keyboard_check(vk_up) || keyboard_check(87);
down_key = keyboard_check(vk_down) || keyboard_check(83);