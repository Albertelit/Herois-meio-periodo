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
        userAnimation : "attack",
        effectSprite : sAttackBonk,
        effectOnTarget : MODE.ALWAYS,
        func : function(_user, _targets)
        {
            var _damage = ceil(_user.poder + random_range(-_user.poder * 0.25, _user.poder * 0.25));
            BattleChangeHP(_targets[0], -_damage, 0);
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
        userAnimation : "attack",
        effectSprite : sAttackIce,
        effectOnTarget : MODE.ALWAYS,
        func : function(_user, _targets)
        {
			// dano levemente fixo, arrumo dps pra depender de Poder
            var _damage = irandom_range(10,20);
			BattleChangeHP( _targets[0], - _damage);
			// custo vira dps, poe enquanto nao desconta
        }
	}
};

enum MODE
{
 NEVER = 0,
 ALWAYS = 1,
 VARIES = 2
}



// party data

global.party = [
	{
		nome: "Emma", // 0
		hp: 30,
		hpMax: 25,
		pm: 0,
		pmMax: 6,
		poder: 999,
		perigo: 1, //não esqueça que os personagens vão ter perigo para serem focados
		sprites: {idle: spr_EmmaD, attack: spr_EmmaD, defend: spr_EmmaD, down: spr_carteira},
		actions: [global.actionLibrary.attack, global.actionLibrary.Taser]
		},
		
		{
		nome: "Aron", // 1
		hp: 30,
		hpMax: 30,
		pm: 0,
		pmMax: 6,
		poder: 999,
		perigo: 1, //não esqueça que os personagens vão ter perigo para serem focados
		sprites: {idle: spr_EmmaD, attack: spr_EmmaD, defend: spr_EmmaD, down: spr_EmmaL},
		actions: [global.actionLibrary.attack]
		},
		
		{
		nome: "P0IS0N", // 2
		hp: 20,
		hpMax: 20,
		pm: 0,
		pmMax: 6,
		poder: 999,
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
		poder: 999,
		perigo: 1, //não esqueça que os personagens vão ter perigo para serem focados
		sprites: {idle: spr_EmmaD, attack: spr_EmmaD, defend: spr_EmmaD, down: spr_EmmaU},
		actions: [global.actionLibrary.attack]
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
        sprites: {idle: sBat, attack: spr_parede, defend: spr_parede, down: spr_parede},
        actions: [global.actionLibrary.attack],
        AIscript: function() 
		{
            // atacar player aleatório
			var _action = actions[0];
			var _possibleTargets = array_filter(Obj_battle.partyUnits, function(_unit, _index)
			{
			 return (_unit.hp > 0);
			});
			var _targets = _possibleTargets[irandom(array_length(_possibleTargets)-1)];
			return [_action, _targets];
		}
    }
    
    // Outros inimigos podem ser adicionados aqui
];