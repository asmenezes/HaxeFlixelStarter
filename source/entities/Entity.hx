/*
Health
FSM
SPEED
graphic
BaseState ie level
default state ie main function
I can make sure functions get called by putting them before the super call
*/
package entities;
import flixel.FlxSprite;
import flixel.FlxG;
import FSM;
import flixel.FlxObject;
import states.BaseState;
class Entity extends FlxSprite{
  private var SPEED:Int;
  private var bs: BaseState;
  private var controller:FSM;
  private var up:Bool = false;
  private var down:Bool = false;
  private var left:Bool = false;
  private var right:Bool = false;

  public function new(x:Float,y:Float,state:BaseState){

    super(x,y);
    bs=state;
    controller = new FSM();
    controller.pushState(defaultState);
    acceleration.y = Main.GRAVITY;
    drag.x = drag.y = Main.DRAG;
    maxVelocity.x = maxVelocity.y = Main.MAXVELOCITY;


  }
  override public function update(elapsed:Float):Void{
          FlxG.collide(bs.map,this);
          super.update(elapsed);
  }
  public function defaultState():Void{
    //override this funciton
  }
}
