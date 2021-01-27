package objects;

import flixel.FlxSprite;
import flixel.FlxG;
import states.BaseState;

class Item extends FlxSprite{
  public var bs:BaseState;

public function new(x:Float,y:Float,bState:BaseState){
  //sets the items BaseState --- (required)
  bs = bState;
  //calls FlxSprite.new() --- (required)
  super(x,y);
  //sets gravity the item is affected by --- (optional)
  acceleration.y = Main.GRAVITY;
}
override public function update(elapsed:Float){
  //sets the item to collide with the states map --- (technically optional)
  FlxG.collide(bs.map,this);
  //calls FlxSprite.update() --- (required)
  super.update(elapsed);
}
public function use():Void{
  //override this function in item if you want something to happen when it gets touched
}
}
