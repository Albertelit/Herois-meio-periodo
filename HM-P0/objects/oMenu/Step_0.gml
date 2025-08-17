if (active)
{
	//controle do menu usando um teclado
	
	hover += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up)
	if (hover > array_length(options)-1) hover = 0;
	if (hover < 0) hover = array_length(options)-1;
	
	//executar acao
	
	if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(90))
	{
		if (array_length(options[hover]) > 1) && (options[hover][3] == true)
		{
			if (options[hover][1] != -1)
			{
				var _func = options[hover][1];
				if (options[hover][2] != -1) script_execute_ext(_func,options[hover][2]); else _func();
			}
		}
	}
	if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(88))
	{
		if (subMenuLevel > 0) MenuGoBack();
	}
}