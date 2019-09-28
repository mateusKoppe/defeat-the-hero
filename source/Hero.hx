package;

import flixel.FlxG;
import flixel.math.FlxVector;

class Hero extends Entity {
    public static var VELOCITY_VECTOR:FlxVector = new FlxVector();

    public function new():Void {
        super(0, 400);
        health = 500;
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);

        // Update vector position
        VELOCITY_VECTOR.x = x;
        VELOCITY_VECTOR.y = y;

        x += 1;        
    }

    override public function onMessage(m:Message):Void {
        if(m.op == Message.OP_DAMAGE){
            hurt(m.data);
            FlxG.log.add('Vida do heroi -> ' + health);
        }
    }
}