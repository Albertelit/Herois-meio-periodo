right_key = keyboard_check(vk_right);
left_key = keyboard_check(vk_left);
up_key = keyboard_check(vk_up);
down_key = keyboard_check(vk_down);

xspd = (right_key - left_key) * move_speed;
yspd = (down_key - up_key) * move_speed;

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

sprite_index = sprite[face];