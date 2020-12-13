package objects;

import flixel.FlxSprite;
import flixel.FlxG;

class Door extends FlxSprite
{
  public function new(x:Float,y:Float)
  {
      super(x,y);
      loadGraphic("assets/images/GreenDoor.png");


  }
  public function collision(){
    
  }
    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }
}
