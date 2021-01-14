package objects;

import flixel.FlxSprite;
import flixel.FlxG;
import states.BaseState;
class Door extends Item
{

  public function new(x:Float,y:Float,pState:BaseState)
  {

      super(x,y,pState);
      loadGraphic("assets/images/GreenDoor.png");
  }
  public function collision(){

  }
    override public function update(elapsed:Float):Void
    {
      FlxG.collide(bs.map,this);
      FlxG.overlap(bs.player,this,bs.checkPass);
        super.update(elapsed);
    }
}
