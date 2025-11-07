var _x = 0;
var _y = 0;

var _perso = 0;

function Personagem_Mover (_perso, _x, _y)
{
	while(_perso.x != _x)
	{
		_perso.x++;
	}
	
	while(_perso.y != _y)
	{
		_perso.y++;
	}
}