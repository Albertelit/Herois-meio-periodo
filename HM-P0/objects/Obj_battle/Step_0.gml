battleState();

// corsor 
if (cursor.active)
{
	with (cursor)
	{
		var _keyUp	= keyboard_check_pressed(vk_up);
		var _keyDown	= keyboard_check_pressed(vk_down);
		var _keyLeft	= keyboard_check_pressed(vk_left);
		var _keyRigth	= keyboard_check_pressed(vk_right);
		var _keyToggle	= false;
		var _keyConfirme	=  false;
		var _keyCancel = false;
		confirmDelay ++
		if (confirmDelay > 1)
		{
			_keyConfirme = keyboard_check_pressed(vk_enter);
			_keyCancel = keyboard_check_pressed(vk_escape);
			_keyToggle = keyboard_check_pressed(vk_shift);
		}
		var _moveH = _keyRigth - _keyLeft;
		var _moveV = _keyDown - _keyUp;
		
		if (_moveH == -1) targetSide = Obj_battle.partyUnits;
		if (_moveH == 1) targetSide = Obj_battle.enemyUnits;
		
		
		if (targetSide == Obj_battle.enemyUnits)
		{
			targetSide = array_filter(targetSide, function(_element, _index)
			{
				return _element.hp > 0;
			});
		}
		if (targetAll == false)
		{
			if (_moveV == 1) targetIndex++;
			if (_moveV == -1) targetIndex--;
			
			var _targets = array_length(targetSide);
			if (targetIndex < 0) targetIndex = _targets - 1;
			if (targetIndex > (_targets - 1)) targetIndex = 0;
			
			activeTarget = targetSide[targetIndex];
			
			if (activeAction.targetAll == MODE.VARIES) &&  (_keyToggle) 
			{
			 targetAll = true;	
			}
		}
		else 
		{
			activeTarget = targetSide; 
			if (activeAction.targetAll  == MODE.VARIES) && (_keyToggle)
			{
				targetAll = false;
			}
		}
		if (_keyConfirme)
		{
			with (Obj_battle) BeginAction(cursor.activeUser, cursor.activeAction,cursor.activeTarget);
			with (oMenu) instance_destroy();
			active = false;
			confirmDelay = 0;
		}
		if (_keyCancel) && (!_keyConfirme)
		{
			with(oMenu) active = true;
			active = false;
			confirmDelay = 0;
		}
	}
}
