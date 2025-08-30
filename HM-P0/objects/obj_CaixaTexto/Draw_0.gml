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
	page_number = array_length(text);
	for(var p = 0; p < page_number; p++)
	{
		// guardas quantos caracteres tem em cada pagina e coloca esse valor no "text_lenght"
		text_lenght[p] = string_length(text[p]);
		
		// pega a posição x da caixa de texto
			// quando não tiver nenhum personagem falando (centraliza a caixa)
			text_x_offset[p] = 44; 
	}
}

// ...........................Digitar o texto..................................
if (draw_char < text_lenght[page])
{	
	draw_char += text_speed;
	draw_char = clamp(draw_char, 0, text_lenght[page])
}


// ..........................Trocar de paginas.................................
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
			instance_destroy();
		}
	}
	
	// se não acabou de digitar
	else
	{
		draw_char = text_lenght[page];
	}
}

// ..........................Desenhar a caixa de texto.........................
txtb_img += txt_img_spd;
txtb_spr_w = sprite_get_width(txtb_spr);
txtb_spr_h = sprite_get_height(txtb_spr);

draw_sprite_ext(txtb_spr, txtb_img, texbox_x + text_x_offset[page], texbox_y, textbox_width/txtb_spr_w, textbox_height/txtb_spr_h, 0, c_white, 1);

// ..........................Desenhar o Texto..................................
var _drawtext = string_copy(text[page], 1, draw_char);
draw_text_ext(texbox_x + text_x_offset[page] + border, texbox_y + border, _drawtext, line_sep, line_width);