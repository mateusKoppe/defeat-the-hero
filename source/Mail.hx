package;

import flixel.FlxObject;

class Mail extends FlxObject{
    var _queue:Array<Message> = [];

    override public function update(elapsed:Float):Void{
        for(m in _queue){
            m.to.onMessage(m);
        }

        _queue = [];
        
        super.update(elapsed);
    }

    public function send(m:Message):Void{
        _queue.push(m);
    }
}