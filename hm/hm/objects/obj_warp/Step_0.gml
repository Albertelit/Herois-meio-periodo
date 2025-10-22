if place_meeting(x, y, obj_Emma) && !instance_exists(obj_trasisao) && keyboard_check_pressed(vk_enter)
	{
	var inst = instance_create_depth(0, 0, -9999, obj_trasisao);
	inst.target_x = target_x;
	inst.target_y = target_y;
	inst.target_rm = target_rm;
	inst.target_face = target_face;
	}