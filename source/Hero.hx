package;

import flixel.FlxG;
import flixel.util.FlxTimer;
import flixel.math.FlxVector;

class Hero extends Entity {
    public static var VELOCITY_VECTOR:FlxVector = new FlxVector();
    private var movementVelocity = 1;
    private var fightAgainst:Entity = null;
    var timer:haxe.Timer;
    var isTimerRunning = false;
    private var damage = 15;

    public function new():Void {
        super();
        health = 500;
    }

    private function attack():Void {
        movementVelocity = 0;

        if(isTimerRunning) {
            return;
        }
        isTimerRunning = true;

        timer = new haxe.Timer(1000); // 1000ms delay
        timer.run = function() { 
            FlxG.log.add('deu dano'); 
            isTimerRunning = false;
            timer.stop();
        }

        var m:Message = new Message();
        m.from = PlayState.HERO;
        m.to = fightAgainst;
        m.data = damage;
        m.op = Message.OP_DAMAGE;
        PlayState.MAIL.send(m);
    }

    override public function update(elapsed:Float):Void {
        // Update vector position
        VELOCITY_VECTOR.x = x;
        VELOCITY_VECTOR.y = y;


        if(fightAgainst != null) attack();

        y -= movementVelocity;

        super.update(elapsed);
    }

    override public function onMessage(m:Message):Void {
        if(m.op == Message.OP_DAMAGE){
            hurt(m.data);
        } else if (m.op == Message.OP_FIGHT) {
            if (m.data == 1) {
                fightAgainst = m.entities[0];
            } else {
                movementVelocity = 1;
                fightAgainst = null;
            }
        }
    }
}