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
			scr_text("quem e o idiota que colocario esse nome para um time de basquete?", "Emma J Feliz");
		break;
		case "desaparecida":
			scr_text("Lilith uma garota desaparecida", "Emma J");
			scr_text("...ela era da minha turma...", "Emma J");
			scr_text("espero que ela esteja bem...", "Emma J");
		break;
		case "refeitorio":
			scr_text("olha so, o refeitorio, nao tenho motivo para ir, mas...", "Emma J Feliz");
				src_options("passear", "nada");
				src_options("nao ir", "nada");
				
		break;
		case "sala 1":
			scr_text("sala do primeiro periodo, é aqui que eu vou estudar", "Emma J Feliz");
		break;
		case "sala 2":
			scr_text("sala do 2° ano, estranhamente vazia...?", "Emma J");
		break;
		
		case "Nerds":
			scr_text("Descupe meu clube ja esta com o numero maximo de integrantes");
			scr_text("Descupe ter que decepcionar assim");
			scr_text("mas ja temos muitos Otakus em nossa familia.");
		break;
		case "Cultista":
			scr_text("Tenho que me perdoar");
			scr_text("O clube de ocultismo nao esta aceitando novos discipulos");
			scr_text("os espiritos ja estão ocupados...");
			scr_text("A nao ser que queira ser sacrificio?");
			scr_text("esse cargo tem vaga ainda.");
		break;
		case "Atletas":
			scr_text("Cara... foi mal ai, mas nossa equipe ja ta completa");
			scr_text("mas você sempre está livre pra assistir os treinos!");
		break;
		case "Artistas":
			scr_text("*Trancado*");
		break;
		case "Jornalistas":
			scr_text("Huh? parece que ainda tem vagas... que sorte!", "Emma J Feliz");
				src_options("Entrar", "Jornalista")
				src_options("explorar mais", "nada")
		break;
		case "Jornalista":
			teleportTexto(Jornalismo, 90, 160, DOWN);
		break;
		case "nada":
			scr_text("...", "Emma J");
		break;
			
			
			// --------------------------- Clube de jornalismo --------------------------------------------------
		case "Anni oi":
			scr_text("Oh, voce quer entra no clube de jornalismo?", "Anniela");
			scr_text("Espero que nao seja por nao ter nem um outro clube com vaga haha", "Anniela Feliz");
				src_options("essa foi a ultima opçao", "Anni Decepcao")
				src_options("Quero sim", "A Neutro")
				src_options("ser uma reporter e meu sonho", "Anni animada")
		break;
		case "Anni Decepcao":
			scr_text("oh... eu esperava isso, pessoas normais não escolhem jornalismo", "Anniela");
			scr_text("devem estar no clube de jogos ou de esporte ou qualquer coisa melhor...", "Anniela");
		break
		case "A Neutro":
			scr_text("bem voce pode ir conversar com os outros membros do clube", "Anniela");
			scr_text("cuidado com o poison, ele morde... o aron tambem morde...", "Anniela");
			scr_text("e melhor ficar em uma distancia segura deles", "Anniela Feliz");
		break;
		case "Anni animada":
			scr_text("Ah! serio...? fico surpresa, você vai gostar daqui", "Anniela Feliz");
			scr_text("temos membros agitados, mas você se acustuma", "Anniela Feliz");
			scr_text("Se tiver qualquer duvida pode vim a mim... porfavor.", "Anniela Feliz");
		break;
		
		
		case "1° discusão":
			scr_text("a gente podia sabe o que? se juntar com o clube de esportes", "Aron L");
			scr_text("Tenho certeza que ficariamos famosos assim!", "Aron L");
			
			scr_text("Voce e burro? assim os unicos interessados por nos", "Poison");
			scr_text("sera os que querem saber so de jogos, eles nao ligam!", "Poison")
			
			scr_text("alguma ideia melhor espertao?", "Aron L");
			scr_text("entao, eu tava andando pela tubulacao-", "Poison");
			scr_text("impossivel isso não ser ilegal", "Aron L");
			scr_text("e ouvi professores discutindo sobre um lugar secreto", "Poison");
			scr_text("o misterio ira chamar muita atencao", "Poison");
			scr_text("E! de fofoqueiros, queremos credibilidade", "Aron L");
			
			scr_text("Quer saber? novata, decida", "Poison");
				src_options("vamos a quadra!", "Aron quest");
				src_options("botos sao interessantes", "Poison Quest");
		break;
		case "Aron quest":
			teleportTexto(Esgotos, 30, 125, RIGHT);
		break;
		case "Poison quest":
			teleportTexto(Esgotos, 30, 125, RIGHT);
		break;
		
				
	}	
}