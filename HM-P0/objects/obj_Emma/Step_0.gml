right_key = keyboard_check(vk_right) || keyboard_check(68);
left_key = keyboard_check(vk_left) || keyboard_check(65);
up_key = keyboard_check(vk_up) || keyboard_check(87);
down_key = keyboard_check(vk_down) || keyboard_check(83);

xspd = (right_key - left_key) * move_speed;
yspd = (down_key - up_key) * move_speed;


//pausa o jogador

if instance_exists(obj_pausa)
	{
	xspd = 0;
	yspd = 0;
	}

//colisão

if place_meeting(x + xspd, y, obj_parede) == true
{
	xspd = 0;
}

if place_meeting(x, y + yspd, obj_parede) == true
{
	yspd = 0;
}

//mover o player, yay

x += xspd;
y += yspd;

//mudança de sprites

if (xspd > 0) {face = RIGHT};
if (xspd < 0) {face = LEFT};
if (yspd < 0) {face = UP};
if (yspd > 0) {face = DOWN};

mask_index = sprite[DOWN];
sprite_index = sprite[face];

// animacao

if(xspd == 0 && yspd == 0)
{
	image_index = 0;
}

// profundidade

depth = -bbox_bottom;

//menu de pause

if (keyboard_check_pressed(vk_escape))
{
	instance_create_depth(x, y, -99999999, obj_MenuPause);
}