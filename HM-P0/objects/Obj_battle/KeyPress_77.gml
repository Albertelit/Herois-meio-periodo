// In your Key Press M event:
if (instance_exists(oMenu)) instance_destroy(oMenu);

Menu(x+10,y+10,
[
	["Fight", -1, -1, true],
	["Magic", SubMenu,
		[[
			["Ice", -1, -1, true],
			["Fire", -1, -1, false],
			["Back", MenuGoBack, -1, true]
		]],
		true
	],
	["Escape", -1, -1, true]
]);
