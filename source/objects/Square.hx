package objects;

import flixel.FlxSprite;
import flixel.FlxG;
import states.BaseState;
class Square extends FlxSprite
{
public var damage:Int;
var ps: BaseState;
  //add a direction to constructor
    public function new(x:Float,y:Float,right:Bool,pState:BaseState)
    {
      ps = pState;
      damage = 2;
        super(x,y+20);
        loadGraphic("assets/images/Square.png");
        velocity.y=20;
        velocity.x = if (right) 900 else -900;
    }
    function hitMap(map,bullet:Square):Void{
      ps.bullets.remove(bullet,true);
    }
    override public function update(elapsed:Float):Void
    {
      FlxG.collide(ps.map,this,hitMap);
        super.update(elapsed);
    }
}
