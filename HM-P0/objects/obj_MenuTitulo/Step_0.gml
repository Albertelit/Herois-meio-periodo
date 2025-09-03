// inputs pro menu
up_key = keyboard_check_pressed(vk_up) || keyboard_check_pressed(87);
down_key = keyboard_check_pressed(vk_down) || keyboard_check_pressed(83);

accept_key = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(90);

// numeros de opções no meu atual
op_lenght = array_length(option[menu_level])

// mover pelo menu
pos += down_key - up_key;

if pos >= op_lenght {pos = 0};
if pos < 0 {pos = op_lenght - 1};

// usar as opções
if (accept_key)
{
	var _sml = menu_level;
	
	switch (menu_level)
	{
		
		// menu de pause
		case 0:
			switch (pos) 
			{
				// começar o jogo
				case 0:	room_goto_next();	break;
				// configurações
				case 1: menu_level = 1;	break;
				// sair do jogo
				case 2:	game_end()	break;
			}
		break;
		
		// configurações
		case 1:
			switch (pos) 
			{
				//tamanho da janela
				case 0:
				
				break;
				// brilho
				case 1:
				
				break;
				//controles
				case 2:
				
				break;
				//voltar
				case 3:
					menu_level = 0;
				break;
			}
		break;
	}
	
	// posicionar o menu de volta
	if _sml != menu_level {pos = 0};
	
	// numeros correto de opções
	op_lenght = array_length(option[menu_level])
}