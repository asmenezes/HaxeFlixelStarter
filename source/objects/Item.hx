package objects;

import flixel.FlxSprite;
import flixel.FlxG;
import states.BaseState;
/*
//there are no Abstract classes like in java in Haxe so I just gotta make a class with a private constructor and extend that instead possibly also make an interface for security   ie https://stackoverflow.com/a/30431577
-Damage
-playstate
-on colision with player
*/
class Item extends FlxSprite{
  public var bs:BaseState;

public function new(x:Float,y:Float,bState:BaseState){
  bs = bState;

super(x,y);
acceleration.y = Main.GRAVITY;
}
override public function update(elapsed:Float){
  FlxG.collide(bs.map,this);
  super.update(elapsed);
}
public function use():Void{

}
}
