package;

import demons.Pyrosvesti;
import flixel.FlxState;

class PlayState extends FlxState {
	public static var MAIL = new Mail();
	public static var HERO = new Hero();

	var HUD:HUD;

	override public function create():Void {
		var pyro = new Pyrosvesti();		

		HUD = new HUD();
		
		add(MAIL);
		add(HERO);
		add(pyro);
		add(HUD);

		super.create();
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
	}
}
