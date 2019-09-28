package demons;

import flixel.FlxG;
import flixel.util.FlxTimer;
import flixel.math.FlxVector;

class Pyrosvesti extends Demon {
    // Time to attack
    var _attackTimer = new FlxTimer();
    static var ATTACK_TIME_INTERVAL = 0.75;

    public function new():Void {
        super();
        health = 90;
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);
        attack();
    }

    private function attack() {
        if (_attackTimer.active) return;
        _attackTimer.start(ATTACK_TIME_INTERVAL, function(Timer:FlxTimer) { 
            // setSpritesheetAnim("move");
        });

        var fireballVector:FlxVector = new FlxVector();
        fireballVector.x = Hero.VELOCITY_VECTOR.x - getMidpoint().x;
        fireballVector.y = Hero.VELOCITY_VECTOR.y - getMidpoint().y;
        fireballVector.normalize();
        fireballVector.scale(1024);
        
        var fireball = new Fireball();
        FlxG.state.add(fireball);
        fireball.reset(getMidpoint().x, getMidpoint().y);
        fireball.velocity.x = fireballVector.x;
        fireball.velocity.y = fireballVector.y;
    }
}