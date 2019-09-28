package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.util.FlxTimer;
import flixel.math.FlxVector;

class Hero extends Entity {
    public static var VELOCITY_VECTOR:FlxVector = new FlxVector();
    private var movementVelocity = 1;
    private var fightAgainst:Entity = null;
    private var attackTimer = new FlxTimer();
    private var attackInterval = 0.85;
    private var damage = 15;

    public function new():Void {
        super(150, 400);
        health = 500;
    }

    private function fight():Void {
        movementVelocity = 0;
        if(attackTimer.active) return;
        attackTimer.start(attackInterval, function(Timer:FlxTimer){});

        FlxG.log.add('Atacando' + damage);

        var m:Message = new Message();
        m.from = this;
        m.to = fightAgainst;
        m.data = damage;
        m.op = Message.OP_DAMAGE;
        PlayState.MAIL.send(m);
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);

        // Update vector position
        VELOCITY_VECTOR.x = x;
        VELOCITY_VECTOR.y = y;

        if(fightAgainst != null) fight();

        y -= movementVelocity;
    }

    override public function onMessage(m:Message):Void {
        if(m.op == Message.OP_DAMAGE){
            hurt(m.data);
            FlxG.log.add('Vida do heroi -> ' + health);
        } else if (m.op == Message.OP_FIGHT) {
            fightAgainst = m.entities[0];
        }
    }
}