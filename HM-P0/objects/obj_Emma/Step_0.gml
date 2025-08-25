right_key = keyboard_check(vk_right);
left_key = keyboard_check(vk_left);
up_key = keyboard_check(vk_up);
down_key = keyboard_check(vk_down);

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