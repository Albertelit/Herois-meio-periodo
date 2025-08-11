function Menu(_x, _y, _options, _description = -1, _width = undefined, _height = undefined){
	with(instance_create_depth(_x,_y,-999999,oMenu))
	{
		options = _options;
		description = _description;
		var _optionsCount = array_length(_options);
		visibleOptionsMax = _optionsCount;
	
		//setar tamanho
		xmargin = 10;	
		ymargin = 8;
		draw_set_font(fnM5x7);
		heightline = 12;
	
	
		//auto width
		if (_width == undefined)
		{
			width = 1;
			if (description != -1) width = max(width, string_width(_description));
			for (var i = 0; i < _optionsCount; i++)
			{
				width = max(width, string_width(_options[i][0]));
			}
			widthFull = width + xmargin * 2;
		} 
		else widthFull = _width;
	
		//auto heigth
		if (_height == undefined)
		{
			height = heightline * (_optionsCount + ! (description == -1));
			heightFull = height + ymargin * 2;
		} 
		else
		{
			heightFull = _height;
			//escrolar
			if (heightline * (_optionsCount + !(description == -1)) > _height - (ymargin*2))
			{
			scrolling = true;
			visibleOptionsMax =	(_height - ymargin * 2) div heightline;
			}
		}
	}
}

function SubMenu(_options)
{
	// guarda opcoes antigas e sobe o nivel do submenu
	optionsAbove[subMenuLevel] = options;
	subMenuLevel++;
	options = _options;
	hover = 0;
}
function MenuGoBack()
{
	subMenuLevel--;
	options = optionsAbove[subMenuLevel];
	hover = 0; 
}

function MenuSelectAction(_user, _action)
{
	with (oMenu) active = false;
	with (Obj_battle) BeginAction(_user, _action, _user);
	with (oMenu) instance_destroy();
}