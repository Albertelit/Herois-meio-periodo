var _option = "";
var _link_id = "";

function src_set_default_for_text()
{
	line_break_pos[0, page_number] = 0;
	line_break_num[page_number] = 0;
	line_break_offset[page_number] = 0;
	
	txtb_spr[page_number] = spr_menu;
	speaker_sprite[page_number] = noone;
	speaker_side[page_number] = 1;
	snd[page_number] = Animal_Crossing;
}




/// @param text
/// @param [portrait]
/// @param [side]
function scr_text(_text)
{
	src_set_default_for_text()
	
	text[page_number] = _text;
	
	// pegar informações do personagem
	if argument_count > 1
	{
		switch (argument[1])
		{
			case "Emma J":
				speaker_sprite[page_number] = spr_Eneutro;
				txtb_spr[page_number] = spr_Emenu;
				snd[page_number] = Animal_Crossing;
			break;
			case "Emma J Feliz":
				speaker_sprite[page_number] = spr_EFeliz;
				txtb_spr[page_number] = spr_Emenu;
				snd[page_number] = Animal_Crossing;
			break;
			
			case "Aron L":
				speaker_sprite[page_number] = spr_Aneutro;
				txtb_spr[page_number] = spr_Amenu;
				snd[page_number] = Animal_Crossing;
			break;
			case "Aron L Feliz":
				speaker_sprite[page_number] = spr_Afeliz;
				txtb_spr[page_number] = spr_Amenu;
				snd[page_number] = Animal_Crossing;
			break;
			case "Poison":
				speaker_sprite[page_number] = spr_Pneutro;
				txtb_spr[page_number] = spr_Pmenu;
				snd[page_number] = Animal_Crossing;
			break;
			case "Anniela":
				speaker_sprite[page_number] = Anni_Neutra;
				txtb_spr[page_number] = spr_Amenu;
			break;
			case "Anniela Feliz":
				speaker_sprite[page_number] = Anni_Feliz;
				txtb_spr[page_number] = spr_Amenu;
			break;
		}
	}
	// lado em que está o personagem
	if argument_count > 2
	{
		speaker_side[page_number] = argument[2];
	}
	
	page_number++;
	
}




/// @param option
/// @param link_id
function src_options(_option, _link_id)
{
	option[option_number] = _option;
	option_link_id[option_number] = _link_id;
	option_number++;
}




/// @param text_id
function create_textbox(_text_id)
{
	with (instance_create_depth(0, 0, -999, obj_CaixaTexto))
	{
		scr_Game_text(_text_id);
	}
}

function interagir_texto()
{
	if place_meeting(x, y, obj_Emma) && (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(90))
	{
		if (instance_exists(obj_CaixaTexto) == false)
		{
		create_textbox(text_id);
		}
	}
}