package;

import flixel.FlxG;
import flixel.FlxSprite;

class Entity extends FlxSprite {
    public function onMessage(m:Message):Void {
        FlxG.log.add("Message received. OP --> " + m.op);
    }
}