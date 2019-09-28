package;

import demons.Pyrosvesti;
import flixel.FlxState;

class PlayState extends FlxState {
	public static var MAIL = new Mail();
	public static var HERO = new Hero();

	override public function create():Void {
		var pyro = new Pyrosvesti();
		
		
		add(MAIL);
		add(HERO);
		add(pyro);

		super.create();
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
	}
}
