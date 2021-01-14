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

  private function new(x:Float,y:Float,state:BaseState){
    //Get and set the state the player will be in
    bs=state;

    super(x,y);
  }
}
