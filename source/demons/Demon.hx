package demons;

import flixel.FlxObject;
import flixel.FlxG;

class Demon extends Entity {

    public function new():Void {
        super(100, 100);
        health = 80;
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);

        FlxG.overlap(PlayState.HERO, this, onOverlap);
    }

    override public function onMessage(m:Message):Void {
        if(m.op == Message.OP_DAMAGE){
            hurt(m.data);
            if (health <= 0) {
                var m:Message = new Message();
                m.from = this;
                m.to = PlayState.HERO;
                m.op = Message.OP_FIGHT;
                m.data = 0;
                PlayState.MAIL.send(m);
            }
        }
    }

    private function onOverlap(s1:FlxObject, s2:FlxObject):Void {
		var m:Message = new Message();
        m.from = this;
        m.to = PlayState.HERO;
        m.op = Message.OP_FIGHT;
        m.data = 1;
        m.entities = [this];
        PlayState.MAIL.send(m);
	}

    
}