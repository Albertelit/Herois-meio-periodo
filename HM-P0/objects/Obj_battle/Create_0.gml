instance_deactivate_all(true);

units = [];
turn = 0;
unitTurnOrder = [];
unitRenderOrder = [];
turnCount = 0;
roundCount = 0;
battleWaitTimeFrames = 30;
battleWaitTimeRemaining = 0;
battleText = "";
currentUser = noone;
currentAction = -1;
currentTargets = noone;

cursor =
{
    activeUser: noone,
    activeTarget: noone,
    activeAction : -1,
    targetSide : -1,
    targetIndex : 0,
    targetAll : false,
    confirmDelay : 0,
    active : false
};


//criar inimigos
for (var i = 0; i < array_length(enemies); i++)
{
    enemyUnits[i] = instance_create_depth(x+250+(i*10), y+68+(i*20), depth-10, obj_battleUnitEnemy, enemies[i]);
	array_push(units, enemyUnits[i]); 
}
//criar equipe
for (var i = 0; i < array_length(global.party); i++)
{
    partyUnits[i] = instance_create_depth(x+70+(i*10), y+68+(i*20), depth-10, Obj_batlleUnitPc, global.party[i]);
	array_push(units, partyUnits[i]); 
}

//turnos embaralhados
unitTurnOrder = array_shuffle(units);

// ordem de aparecer
RefreshRenderOrder = function()
{
	unitRenderOrder = [];
	array_copy(unitRenderOrder,0,units,0,array_length(units));
	array_sort(unitRenderOrder,function(_1, _2)
   {
	 return _1.y - _2.y  
   });
}
RefreshRenderOrder();

function BattleStateSelectAction()
{
	if (!instance_exists(oMenu))
	{
		// descobrir de quem e o turno
		var _unit = unitTurnOrder[turn];
	
		// descobre se ta incapacitado ou morto
		if (!instance_exists(_unit) || (_unit.hp <= 0))
		{
			battleState = BattleStateVictoryCheck;
			exit;
		}
	
		//Seleciona uma ação para agir
		//BeginAction(_unit.id,	global.actionLibrary.attack, _unit.id);
	
		//se unidade e controlada por player
		if (_unit.object_index == Obj_batlleUnitPc)
		{
			//compilar o menu de acao
			var _menuOptions = [];
			var _subMenus = {};
			
			var _actionList = _unit.actions;
			
			for (var i = 0; i < array_length(_actionList); i++)
			{
				var _action = _actionList[i];
				var _available = true // dps cuida do custo de pm por aqui
				var _nameAndCount = _action.name; //caso seja um item modificaremos isso dps tbm, para saber a quantidade
				if (_action.subMenu == -1)
				{
					array_push(_menuOptions, [_nameAndCount, MenuSelectAction, [_unit, _action], _available]);
				}
				else
				{
					// cria ou adiciona um subMenu
					if (is_undefined(_subMenus[$ _action.subMenu]))
					{
						variable_struct_set(_subMenus, _action.subMenu, [[_nameAndCount, MenuSelectAction, [_unit, _action], _available]]);
					}
					else
					{
						array_push(_subMenus[$ _action.subMenus], [_nameAndCount, MenuSelectAction, [_unit, _action], _available])
					}
				}
			}
			
			// transforma submenus em Arrays, pq? nao sei
			var _subMenusArray = variable_struct_get_names(_subMenus);
			for (var i = 0; i < array_length(_subMenusArray); i++)
			{
				// filtra um submenu se necessario
				// aqui
				
				// adiciona o "voltar" pra todos os menus
				array_push(_subMenus[$ _subMenusArray[i]], ["Back", MenuGoBack, -1, true]);
				// coloca submenu no menu principal
				array_push(_menuOptions, [_subMenusArray[i], SubMenu, [_subMenus[$ _subMenusArray[i]]], true]);
			}
			
		Menu(x+10, y+110, _menuOptions, , 74, 60);
			
		}
		else
		{
			//Se unidade for controlada por IA
			var _enemyAction = _unit.AIscript();
			if (_enemyAction != -1) BeginAction(_unit.id, _enemyAction[0], _enemyAction[1]);
		}
	}
}

function BeginAction(_user, _action, _targets)
{
    currentUser = _user;
    currentAction = _action;
    currentTargets = _targets;
	battleText = string_ext(_action.description, [_user.nome])
    if (!is_array(currentTargets)) currentTargets = [currentTargets];
    battleWaitTimeRemaining = battleWaitTimeFrames;
    with (_user)
    {
        acting = true;
        //play user animation if it is defined for that action, and that user
        if (!is_undefined(_action[$ "userAnimation"]) && (!is_undefined(_user.sprites[$ _action.userAnimation])))
        {
            sprite_index = sprites[$ _action.userAnimation];
            image_index = 0;
        }
    }

    battleState = BattleStatePerformAction;
}


function BattleStatePerformAction()
{
	//If animation etc is still playing
if (currentUser.acting)
{
    //When it ends, perform action effect if it exists
    if (currentUser.image_index >= currentUser.image_number - 1)
    {
        with (currentUser)
        {
            sprite_index = sprites.idle;
            image_index = 0;
            acting = false;
        }

        if (variable_struct_exists(currentAction, "effectSprite"))
        {
            if (currentAction.effectOnTarget == MODE.ALWAYS) || ( (currentAction.effectOnTarget == MODE.VARIES) && (array_length(currentTargets) <= 1) )
            {	
                for (var i = 0; i < array_length(currentTargets); i++)
                {
                    instance_create_depth(currentTargets[i].x, currentTargets[i].y, currentTargets[i].depth - 1, oBattleEffect, {sprite_index : currentAction.effectSprite});
                }
            }
            else //play it at 0,0
            {
                var _effectSprite = currentAction.effectSprite
                if (variable_struct_exists(currentAction, "effectSpriteNoTarget")) _effectSprite = currentAction.effectSpriteNoTarget;
                instance_create_depth(x, y,depth-100,oBattleEffect,{sprite_index : _effectSprite});
            }
        }

        currentAction.func(currentUser, currentTargets);
    }
}
else //wait for delay and then end the turn
{	
    if (!instance_exists(oBattleEffect))
    {
        battleWaitTimeRemaining--;
        if (battleWaitTimeRemaining == 0)
        {
            battleState = BattleStateVictoryCheck;
        }
    }
}

}

function BattleStateVictoryCheck()
{
	
	battleState = BattleStateTurnProgression;
}

function BattleStateTurnProgression()
{
	battleText = ""; // reseta o texto da batalha
	turnCount++; // contagem de turnos
	turn++;
	//loop
	if (turn > array_length(unitTurnOrder) - 1)
	{
	turn = 0
	roundCount++;
	}
	battleState =  BattleStateSelectAction;
}

battleState = BattleStateSelectAction;
