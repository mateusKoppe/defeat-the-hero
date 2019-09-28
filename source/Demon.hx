package;

class Demon extends Entity {
    public function new():Void {
        super();
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