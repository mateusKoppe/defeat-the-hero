package;

import flixel.FlxObject;

class Message{
    public static inline var OP_DAMAGE:Int = 0;
    public static inline var OP_HEAL:Int = 1;
    public static inline var OP_COLLISION:Int = 2;
    public static inline var OP_FIGHT:Int = 3;
    
    public var from:Entity;
    public var to:Entity;
    public var data:Float;
    public var entities:Array<Entity>;
    public var op:Int;

    public function new() { }
}