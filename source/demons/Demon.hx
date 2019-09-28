package demons;

class Demon extends Entity {

    public function new():Void {
        super(100, 100);
        health = 80;
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);
    }

    override public function onMessage(m:Message):Void {
        if(m.op == Message.OP_DAMAGE){
            hurt(m.data);
        }
    }
}