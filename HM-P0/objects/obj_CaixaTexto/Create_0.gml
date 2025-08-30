depth = -999999999999

// Tamanho da caixa de texto
textbox_width = 200;
textbox_height = 64;
border = 8;
line_sep = 12;

txtb_spr = spr_menu;
txtb_img = 0;
txt_img_spd = 6/60;
txtb_spr_w = 0;
txtb_spr_h = 0;

// tamanho maximo de uma linha de texto
line_width = textbox_width - border * 2;


//aonde a caixa vai ficar
texbox_x = camera_get_view_x(view_camera[0]);
texbox_y = camera_get_view_y(view_camera[0]) + 144;


// O texto:
page = 0;
page_number = 0;


text[0] = "Essa e a primeira pagina do texto"; // o texto escrito (a string)
text[1] = "lala";
text[2] = "esse bagulho de testar e divertido";
text[3] = "AAAAAAAAAAHHHHHHHHHHHH!!!!!!";
text[4] = "Esse texto vai ser longo para um caralho, so avisando, isso e um teste para saber o quao longo um texto pode ficar";


text_lenght  = string_length(text[0]);
draw_char = 0; // quantos caracteres foram digitados (efeito de digitação)
text_speed = 1;

setup = false;

accept_key = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(90);