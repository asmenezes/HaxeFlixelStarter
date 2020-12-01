package objects;

import flixel.FlxSprite;
import flixel.FlxG;

class Square extends FlxSprite
{


  //add a direction to constructor
    public function new(x:Float,y:Float,right:Bool)
    {
        super(x,y);
        loadGraphic("assets/images/Square.png");
        velocity.y=20;
        velocity.x = if (right) 900 else -900;
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }
}
