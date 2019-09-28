package;

import flixel.group.FlxGroup.FlxTypedGroup;
import demons.Pyrosvesti;
import flixel.FlxState;

class PlayState extends FlxState {
	public static var MAIL = new Mail();
	public static var HERO = new Hero();
	public static var DEMONS = new FlxTypedGroup<Entity>();

	var HUD:HUD;

	override public function create():Void {
		var pyro = new Pyrosvesti();
		DEMONS.add(pyro);

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
