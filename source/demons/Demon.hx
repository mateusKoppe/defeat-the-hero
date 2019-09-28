package demons;

import flixel.FlxObject;
import flixel.FlxG;
import flixel.addons.ui.FlxUIBar;
import flixel.util.FlxColor;

class Demon extends Entity {
    var heroHealthBar:FlxUIBar;
    var heroHealthBarStyle:FlxBarStyle = {
        borderColor: null,
        chunkSize: null,
        emptyColors: null,
        emptyImgSrc: null,
        filledColor: FlxColor.RED, 
        filledColors: null,
        emptyColor: FlxColor.GRAY,
        filledImgSrc: null,
        gradRotation: null
    };

    var demonHealthBar:FlxUIBar;

    public function new():Void {
        super();
        health = 80;

        makeGraphic(60, 60);

        demonHealthBar = new FlxUIBar(0, 0, LEFT_TO_RIGHT, 64, 4, this, "health", 0, health, false);
        demonHealthBar.set_style(heroHealthBarStyle);
        FlxG.state.add(demonHealthBar);
    }

    override public function update(elapsed:Float):Void {
        demonHealthBar.x = x;
        demonHealthBar.y = y - 8;

        FlxG.overlap(PlayState.HERO, this, onOverlap);

        super.update(elapsed);
    }

    public function onDeath() {
        var m:Message = new Message();
        m.from = this;
        m.to = PlayState.HERO;
        m.op = Message.OP_FIGHT;
        m.data = 0;
        PlayState.MAIL.send(m);
        demonHealthBar.kill();
    }

    override public function onMessage(m:Message):Void {
        if(m.op == Message.OP_DAMAGE){
            hurt(m.data);
            if (health <= 0) { onDeath(); }
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