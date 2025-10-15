function NewEncounter(_enemies, _bg) {
    instance_create_depth(
        camera_get_view_x(view_camera[0]),
        camera_get_view_y(view_camera[0]),
        -99999,
        Obj_battle,
        {enemies: _enemies, creator: id, battlebackground: _bg}
    );
}

function BattleChangeHP(_user, _target, _amount, _pmCost, AliveDeadOrEither = 0)
{
    // AliveDeadOrEither: 0 = Vivo  1 = Morto  2 = Qualquer
    var _failed = false;

    // Verifica se o alvo está válido
    if ((AliveDeadOrEither == 0) && (_target.hp <= 0)) _failed = true;
    if ((AliveDeadOrEither == 1) && (_target.hp > 0)) _failed = true;

    // Verifica se o usuário tem PM suficiente
    if (_user.pm < _pmCost)
    {
        
        _failed = true;

        // Texto de falha
        instance_create_depth(
            _target.x,
            _target.y,
            _target.depth - 1,
            oBattleFloatingText,
            { font: fnM5x7, col: c_white, text: "Falhou (sem PM)" }
        );

        return; // Sai da função, nada mais acontece
    }

    // Se passou, consome o PM
    _user.pm = clamp(_user.pm - _pmCost, 0, _user.pmMax);

    // Define cor do texto
    var _col = c_white;
    if (_amount > 0) _col = c_lime;

    if (_failed)
    {
        _col = c_white;
        _amount = "failed";
    }

    // Texto de dano ou cura
    instance_create_depth(
        _target.x,
        _target.y,
        _target.depth - 1,
        oBattleFloatingText,
        { font: fnM5x7, col: _col, text: string(_amount) }
    );

    // Aplica dano/cura se não falhou
    if (!_failed)
    {
        _target.hp = clamp(_target.hp + _amount, 0, _target.hpMax);
    }
}


	
