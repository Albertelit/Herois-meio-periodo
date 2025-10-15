//Action Library
global.actionLibrary =

{
    attack :
    {
        name : "Attack", //0
        description : "{0} Ataca!",
        subMenu : -1,
        targetRequired : true,
        targetEnemyByDefault : true,
        targetAll : MODE.NEVER,
        Atack: ACAO.INIMIGO,
        userAnimation : "attack",
        effectSprite : sAttackBonk,
        effectOnTarget : MODE.ALWAYS,
        func : function(_user, _targets)
        {
            var _target = _targets[0]; // <- pega o primeiro alvo
            var _damage = ceil((_user.poder + random_range(-_user.poder * 0.25, _user.poder * 0.25)) - _target.defesa);
            
            if (_damage < 1) { 
                _damage = _user.poder; // <- aqui também corrigi "user" para "_user"
            }
            
           BattleChangeHP(_user, _target, -_damage, 0, 0);
;
        }
    },

	Taser : // sim eu sei, e meio paia, mas deixa funfar primeiro e dps troco
	{
		name : "Taser", //1
        description : "{0} Eletrecuta!",
        subMenu : "Magic",
		pmCost : 2,
        targetRequired : true,
        targetEnemyByDefault : true, //0: party/self
        targetAll : MODE.NEVER,
		Atack: ACAO.INIMIGO,
        userAnimation : "attack",
        effectSprite : sAttackIce,
        effectOnTarget : MODE.ALWAYS,
        func : function(_user, _targets)
        {
			var _target = _targets[0]; // <- pega o primeiro alvo
            var _damage = ceil((_user.int + random_range(-_user.int * 0.25, _user.int * 0.25)) - _target.defesa);
            
            if (_damage < _user.int) { 
                _damage = _user.int; // <- aqui também corrigi "user" para "_user"
            }
            
            BattleChangeHP(_user, _target, -_damage, 2, 0);
        }
	},
	cura : // mais paia ainda
	{
		name : "cura sanguinea", // texto sai da caixa, concertar tamanho
        description : "cura um aliado!",
        subMenu : "Magic",
		pmCost : 2,
        targetRequired : true,
        targetEnemyByDefault : true, //0: party/self
        targetAll : MODE.NEVER,
		Atack: ACAO.ALIADO,
        userAnimation : "attack",
        effectSprite : sAttackCure,
        effectOnTarget : MODE.ALWAYS,
        func: function(_user, _targets)
{
    var _heal = irandom_range(10, 20);
    BattleChangeHP(_user, _targets[0], _heal, 2, 0);
}

	},
};

enum MODE
{
 NEVER = 0,
 ALWAYS = 1,
 VARIES = 2
}
enum ACAO
{
INIMIGO = 0,
ALIADO = 1,
PROPRIO =2,
}


// party data

global.party = [
	{
		nome: "Emma", // 0
		hp: 555,
		hpMax: 5,
		defesa: 2,
		pm: 0,
		pmMax: 6,
		poder: 1,
		int: 4,
		perigo: 2, //não esqueça que os personagens vão ter perigo para serem focados
		sprites: {idle: spr_EmmaD, attack: spr_EmmaD, defend: spr_EmmaD, down: spr_carteira},
		actions: [global.actionLibrary.attack, global.actionLibrary.Taser]
		},
		
		{
		nome: "Aron", // 1
		hp: 30,
		hpMax: 30,
		pm: 0,
		pmMax: 6,
		poder: 4,
		defesa: 2,
		int: 2,
		perigo: 4, //não esqueça que os personagens vão ter perigo para serem focados
		sprites: {idle: spr_EmmaD, attack: spr_EmmaD, defend: spr_EmmaD, down: spr_EmmaL},
		actions: [global.actionLibrary.attack]
		},
		
		{
		nome: "P0IS0N", // 2
		hp: 20,
		hpMax: 20,
		pm: 0,
		pmMax: 6,
		poder: 2,
		defesa: 2,
		int: 8,
		perigo: 1, //não esqueça que os personagens vão ter perigo para serem focados
		sprites: {idle: spr_EmmaD, attack: spr_EmmaD, defend: spr_EmmaD, down: spr_EmmaR},
		actions: [global.actionLibrary.attack]
		},
		
		{
		nome: "Anniela", // 3
		hp: 20,
		hpMax: 20,
		pm: 0,
		pmMax: 6,
		poder: 2,
		defesa: 2,
		int: 4,
		perigo: 1, //não esqueça que os personagens vão ter perigo para serem focados
		sprites: {idle: spr_EmmaD, attack: spr_EmmaD, defend: spr_EmmaD, down: spr_EmmaU},
		actions: [global.actionLibrary.attack,global.actionLibrary.cura]
		}
	
]

// inimigos

global.enemies = [
    {
        nome: "morcego",// 0
        hp: 9,
        hpMax: 9,
        pm: 6,
        pmMax: 6,
        poder: 4,
		defesa: 2,
        sprites: {idle: sBat, attack: spr_parede, defend: spr_parede, down: spr_parede},
        actions: [global.actionLibrary.attack],
        AIscript: function() 
		{
    var _action = actions[0];
    var _possibleTargets = array_filter(Obj_battle.partyUnits, function(_unit, _index)
    {
        return (_unit.hp > 0);
    });

    

    var totalPerigo = 0;
    for (var i = 0; i < array_length(_possibleTargets); i++)
    {
        totalPerigo += _possibleTargets[i].perigo;
    }

    
    var sorteio = irandom_range(1, totalPerigo);

    var acumulado = 0;
    var _target = _possibleTargets[0]; 

    for (var i = 0; i < array_length(_possibleTargets); i++)
    {
        acumulado += _possibleTargets[i].perigo;
        if (sorteio <= acumulado)
        {
            _target = _possibleTargets[i];
            break;
        }
    }

    // retorna ação + alvo
    return [_action, _target];
		}
	},
]
