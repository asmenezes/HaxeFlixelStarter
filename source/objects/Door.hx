package objects;

import flixel.FlxSprite;
import flixel.FlxG;

class Door extends FlxSprite
{
  var ps:PlayState;
  public function new(x:Float,y:Float,pState:PlayState)
  {

      super(x,y);
      ps = pState;
      loadGraphic("assets/images/GreenDoor.png");


  }
  public function collision(){

  }
    override public function update(elapsed:Float):Void
    {
      FlxG.collide(ps.map,this);
        super.update(elapsed);
    }
}
