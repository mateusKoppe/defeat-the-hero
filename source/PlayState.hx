package;

import flixel.group.FlxGroup.FlxTypedGroup;
import demons.Pyrosvesti;
import flixel.FlxState;
import flixel.FlxG;

class PlayState extends FlxState {
	public static var MAIL = new Mail();
	public static var HERO = new Hero();
	public static var DEMONS = new FlxTypedGroup<Entity>();

	public static var GRID:Array<Array<Entity>> = [];

	var HUD:HUD;

	override public function create():Void {
		var pyro = new Pyrosvesti();
		DEMONS.add(pyro);
		pyro.y = 160;
		pyro.x = 240;
		GRID = [
			[],
			[],
			[null, pyro],
			[],
			[],
			[],
			[],
			[],
			[],
			[null, HERO]
		];
		for (row in 0...19) {
			for (col in 0...10) {
				if (GRID[row]!= null && GRID[row][col] != null) {
					GRID[row][col].y = row * 60;
					GRID[row][col].x = col * 60;
				}
			}
		}

		HUD = new HUD();
		
		add(MAIL);
		add(HERO);
		add(DEMONS);
		add(HUD);

		super.create();
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
	}
}
