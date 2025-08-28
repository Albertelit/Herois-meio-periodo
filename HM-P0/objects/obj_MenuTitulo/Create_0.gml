// valores de tamanho e posição do texto
width = 104;
height = 104;

op_border = 8;
op_space = 16;

//onde o mouse começa
pos = 0;

//opçoes disponiveis na caixa de titulo
option[0, 0] = "Comecar Jogo";
option[0 ,1] = "Configuracoes";
option[0, 2] = "Sair";

// Menu configurações
option[1, 0] = "Tamanho da janela"
option[1, 1] = "Brilho"
option[1, 2] = "Controles"
option[1, 3] = "Voltar"

op_lenght = 0;
menu_level = 0;


// inputs pro menu
up_key = keyboard_check_pressed(vk_up) || keyboard_check_pressed(87);
down_key = keyboard_check_pressed(vk_down) || keyboard_check_pressed(83);

accept_key = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(90);