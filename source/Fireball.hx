package;

import flixel.FlxObject;
import flixel.FlxG;

class Fireball extends Entity {
    public function new() {
        super();
        // loadGraphic(AssetPaths.bullet__png, false, 32, 32);
        // setGraphicSize(bulletSize);
        // updateHitbox();
        // updateFramePixels();
        makeGraphic(64, 64);
    }

    override public function update(elapsed:Float):Void {
        if(!isOnScreen()){
            kill();
        }

        FlxG.overlap(PlayState.HERO, this, onOverlap);

        super.update(elapsed);
    }

    private function onOverlap(s1:FlxObject, s2:FlxObject):Void {
		var m:Message = new Message();
        m.from = this;
        m.to = PlayState.HERO;
        m.op = Message.OP_DAMAGE;
        m.data = 5;
        PlayState.MAIL.send(m);
        kill();
	}
}