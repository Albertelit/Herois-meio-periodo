/// @param text_id
function scr_Game_text(_text_id)
{
	function teleportTexto (_sala, _x, _y, _face)
	{
	var _trans = instance_create_depth(0, 0, -9999999, obj_trasisao);
	_trans.target_x = _x;
	_trans.target_y = _y;
	_trans.target_face = _face;
	_trans.target_rm = _sala;
	instance_destroy(obj_CaixaTexto);
	}

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
		
		case "Anniela":
			scr_text("huh? se disse algo?");
			scr_text("nao", "Emma J");
		break;
		
		// --------------------------- Quarto da Emma --------------------------------------------------
		
		case "Emma PC":
			scr_text("Meu Pc... ja me ajudou em muita coisa.", "Emma J Feliz");
			scr_text("Adeus Morto ao amanhecer, iremos nos ver um dia", "Emma J");
		break;
		case "Emma Cama":
			scr_text("Minha cama... muito desconfortavel.", "Emma J");
			scr_text("mesmo com tanto dinheiro ele sempre compra as piores.", "Emma J");
		break;
		case "Emma lixo":
			scr_text("cheio ate a borda.", "Emma J");
			scr_text("deveria limpar meu quarto com mais frequencia.", "Emma J");
		break;
		case "Emma premios":
			scr_text("bem, sempre fui uma aluna incrivel.", "Emma J Feliz");
			scr_text("melhor aluna da minha classe.", "Emma J Feliz");
			scr_text("seria melhor se não tivesse aquele nome.", "Emma J");
		break;
		case "Emma Poster": 
			scr_text("Dead Hill, meu jogo favorito!", "Emma J Feliz");
			scr_text("A arte e bonitinha e soundtrack incrivelmente boa", "Emma J Feliz")
			
		// --------------------------- JJ Corredor --------------------------------------------------
		
		break;
		case "Quarto jj":
			scr_text("o quarto do meu pai.", "Emma J");
			scr_text("quase nunca entrei aqui.", "Emma J");
		break;
		case "Quarto 2":
			scr_text("sala de arquivos... nao tem muito no que falar sobre", "Emma J");
		break;
		case "relogio":
			scr_text("sao 12:12, numeros iguais, que sorte", "Emma J Feliz");
		break;
		case "quadro JJ":
			scr_text("um quadro sobre algo chato das empressas JJ", "Emma J");
		break;
		case "TV?":
			scr_text("por que diabos ele colocou uma tv aqui?", "Emma J Feliz");
		break;
		case "lixo 2":
			scr_text("nada alem de papel", "Emma J");
		break;
		///////////////////////////     Escolha importante      ///////////////////////////////////
		
				
				case "escolha":
				scr_text("ok emma se acalma", "Emma J Feliz")
				scr_text("e hoje que voce sai desse lugar", "Emma J");
				scr_text("voce ja fez suas malas", "Emma J");
				scr_text(" e sua casa antiga da sua vo ta te esperando...", "Emma J");
				scr_text("droga... falta dinheiro... se eu gastar a minha mesada na viagem", "Emma J");
				scr_text("eu não vou ter dinheiro para meu tratamento nem para me manter", "Emma J");
				scr_text("...", "Emma J");
				scr_text("voce consegue se virar Emma, voce sempre consegue...", "Emma J");
				scr_text("se bem que... meu pai guarda bastante dinheiro no armario...", "Emma J");
				scr_text("seria tao ruim assim...?ele nem perceberia... ele tem tanto...", "Emma J");
					src_options("se manter fiel aos seus principios ", "roubo - nao")
					src_options("pegar emprestado o dinheiro", "roubo - sim")
			break;
			case "roubo - nao":
				scr_text("nao... isso é errado, não vou me rebaixar ao nivel dele", "Emma J Feliz")
				src_options("arriscar tudo", "Emma - arrisca")
			break;
			case "Emma - arrisca":
				teleportTexto(Storm_High_Corredores1, 380, 480, UP);
				break;
			case "roubo - sim":
				scr_text("...", "Emma J feliz");
				scr_text("ele nem vai perceber mesmo", "Emma J Feliz")
				src_options("ir ao quarto de JJ", "Emma - vai")
				global.bom += 1
				break;
			case "Emma - vai":
				teleportTexto(JJquarto, 50, 230, UP)
			break;
			
			case "ma_escolha":
				scr_text("que estranho... não tem quase nada no quarto dele", "Emma J");
				scr_text("alem de estar cheio de lixo", "Emma J");
				scr_text("e como se ele nem vivesse aqui...", "Emma J");
				scr_text("pensando bem... ", "Emma J");
				scr_text("quando foi a ultima vez que ele esteve em casa?", "Emma J");
				scr_text("que se dane, esse dinheiro fara eu começar", "Emma J");
				scr_text("minha nova vida", "Emma J Feliz");
				     src_options("pegar o dinheiro", "Emma - pegou");
			break;
				case "Emma - pegou":
					teleportTexto(Storm_High_Corredores1, 380, 450, UP)
				break;
		///////////////////////////     Escolha importante      ///////////////////////////////////
		
		// --------------------------- Escola Corredores --------------------------------------------------
		case "armario":
			scr_text("apenas um armario", "Emma J");
		break;
		case "armario Emma":
			scr_text("esse e meu armario", "Emma J Feliz");
		break;
		case "armario especial":
			scr_text("apenas um... espera...", "Emma J");
			scr_text("nao... isso nao pode ser verda...", "Emma J");
			scr_text("e apenas um armario", "Emma J Feliz");
		break;
		case "rato":
			scr_text("the rats?", "Emma J");
			scr_text("quem e o idiota que colocario esse nome para", "Emma J Feliz");
			scr_text("um time de basquete?", "Emma J Feliz");
		break;
		case "desaparecida":
			scr_text("Lilith uma garota desaparecida", "Emma J");
			scr_text("...ela era da minha turma...", "Emma J");
			scr_text("espero que ela esteja bem...", "Emma J");
		break;
		case "refeitorio":
			scr_text("ulala o refeitorio", "Emma J Feliz");
			scr_text("já consigo sentir o cheiro da comida", "Emma J Feliz");
			scr_text("espero que a comida seja tão bom quanto o cheiro","Emma J feliz");
		break;
			case "sala 1":
			scr_text("sala do primeiro periodo, é aqui que eu vou estudar", "Emma J feliz");
			scr_text("devo entrar agora? talvez tenha mais que eu queira ver", "Emma J");
				src_options("entrar", "emma - sim");
				src_options("nao entrar", "emma - não");
		break;
			case "emma - sim":
				scr_text("vamos la entao", "Emma J Feliz");
				scr_text("...");
				teleportTexto (a, 526, 170, DOWN)
				break;
			case "emma - não":
				scr_text("...", "Emma J");
				scr_text("ainda da para esperar mais um pouco.", "Emma J");
			break;
			
			// --------------------------- Escola Corredores --------------------------------------------------
			
			
				
			case "cadeira patetica":
				scr_text("por que diabos alguem tem tantos livros na mesa?", "Emma J");
				scr_text("a mangueira do bombeiro... que livro e esse?", "Emma J Feliz");
			break;
				
			case "cadeira padrao":
				scr_text("hmmm... não essa ja tem alguem aqui", "Emma J");
			break;
				
			case "cadeira prota":
				scr_text("... parece o lugar perfeito", "Emma J Feliz");
				scr_text("bem... vamos lá?, vou assitir a aula e ir para o clube", "Emma J Feliz");
				scr_text("de jornalismo!", "Emma J Feliz")
					src_options("Simbora", "simbora")
					src_options("melhor olha ao redor", "babaca")
			break;
					
				case "simbora":
					scr_text("so algumas horinhas");
						src_options("partiu clube", "clube");
				break;
				case "clube":
					teleportTexto(Jornalismo, 90, 160, DOWN)
				break;
				
				case "Poison teste":
					scr_text("Voces querem ir para um lugar bem legal?", "Poison", -1);
					scr_text("voce nao quer dizer que...", "Emma J");
						src_options("Poison...... por favor nao.", "Backrooms");
				break;
				case "Backrooms":
					teleportTexto(Room5, 50, 30, DOWN)
				break
				
	}	
}


