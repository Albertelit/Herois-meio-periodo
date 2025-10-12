/// @param text_id
function scr_Game_text(_text_id)
{	
	switch (_text_id)
	{
		case "Aron":
			scr_text("Eai Emma, eu to com problemas em matematica", "Aron L", -1);
			scr_text("voce pode me ajudar depois?", "Aron L");
				src_options("Claro, mais tarde eu ajudo", "Aron - sim");
				src_options("Cara... o ano comecou agora", "Aron - não");
		break;
			case "Aron - sim":
				scr_text("Beleza, nao tava indo com a cara desse professor", "Aron L Feliz");
				break;
			case "Aron - não":
				scr_text("...", "Aron L");
				scr_text("e tem razao, vou tentar mais um pouco.", "Aron L");
			break;
		
		case "P0ISON":
			scr_text("Estou com uma leve vontade de te morder agora");
			scr_text("apenas leve, entao nao se preucupe");
		break;
		
		case "Aniella":
			scr_text("ai");
			scr_text("oque? queria mais dialogo?");
		break;
	}	
}