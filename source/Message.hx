package;

class Message{
    public static inline var OP_DAMAGE:Int = 0;
    public static inline var OP_HEAL:Int = 1;
    public static inline var OP_COLLISION:Int = 2;
    
    public var from:Entity;
    public var to:Entity;
    public var data:Float;
    public var op:Int;

    public function new(){

    }
}