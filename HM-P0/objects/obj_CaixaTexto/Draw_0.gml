accept_key = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(90);

texbox_x = camera_get_view_x(view_camera[0]);
texbox_y = camera_get_view_y(view_camera[0]) + 144;

// setup

if (setup == false)
{
	setup = true;
	draw_set_font(global.font_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	//loop entre as paginas
	for(var p = 0; p < page_number; p++)
	{
		// guardas quantos caracteres tem em cada pagina e coloca esse valor no "text_lenght"
		text_lenght[p] = string_length(text[p]);
		
		// pega a posição x da caixa de texto
			// quando não tiver nenhum personagem falando (centraliza a caixa)
			text_x_offset[p] = 44; 
	}
}

// ...........................Digitar o texto..................................//
if (draw_char < text_lenght[page])
{	
	draw_char += text_speed;
	draw_char = clamp(draw_char, 0, text_lenght[page])
}


// ..........................Trocar de paginas.................................//
if accept_key
{
	// se acabou de digitar:
	if (draw_char == text_lenght[page])
	{
		//proxima pagina
		if (page < page_number - 1)
		{
			page++;
			draw_char = 0;
		}
		
		// Exploda a caixa de texto violentamente
		else
		{
			// linkar o texto para as opções
			if (option_number > 0)
			{
				create_textbox(option_link_id[option_pos]);
			}
			instance_destroy();
		}
	}
	
	// se não acabou de digitar
	else
	{
		draw_char = text_lenght[page];
	}
}



// ..........................Desenhar a caixa de texto.........................//
var _txtb_x = texbox_x + text_x_offset[page];
var _txtb_y = texbox_y;
txtb_img += txt_img_spd;
txtb_spr_w = sprite_get_width(txtb_spr);
txtb_spr_h = sprite_get_height(txtb_spr);

draw_sprite_ext(txtb_spr, txtb_img, _txtb_x, _txtb_y, textbox_width/txtb_spr_w, textbox_height/txtb_spr_h, 0, c_white, 1);



//.................................Opções......................................//
if (draw_char == text_lenght[page]) && page == page_number -1
{
	// seleção de opções
	option_pos += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
	option_pos = clamp(option_pos, 0, option_number-1);
	
	// desenhar as opções
	var _op_space = 20;
	var _op_bord = 8;
	for (var op = 0; op < option_number; op++)
	{
		//caixinha de opções
		var _o_w = string_width(option[op]) + _op_bord * 2;
		draw_sprite_ext(txtb_spr, txtb_img, _txtb_x + 16, _txtb_y - _op_space*option_number + _op_space*op, _o_w/txtb_spr_w, (_op_space-1)/txtb_spr_h, 0, c_white, 1);
		
		// A setinha
		if (option_pos == op)
		{
			draw_sprite(spr_texbox_arrow, 0, _txtb_x, _txtb_y - _op_space*option_number + _op_space*op);
		}
		
		//texto das opções
		draw_text(_txtb_x + 16 + _op_bord, _txtb_y - _op_space*option_number+_op_space*op+2, option[op]);
	}
}




// ..........................Desenhar o Texto..................................//
var _drawtext = string_copy(text[page], 1, draw_char);
draw_text_ext(_txtb_x + border, _txtb_y + border, _drawtext, line_sep, line_width);