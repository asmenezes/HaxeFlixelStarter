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
    //calls FlxSprite.new() --- (required)
    super(x,y);
    //sets the state that the entity appears in --- (required)
    bs=state;
    //creates the state machine that controls the entity --- (required)
    controller = new FSM();
    //starts the state machine at the default state --- (required)
    controller.pushState(defaultState);
    //sets the "gravity" that the entity is affected by --- (optional)
    acceleration.y = Main.GRAVITY;
    //sets the drag that the entity is affected by --- (optional)
    drag.x = drag.y = Main.DRAG;
    //sets the maximum X and Y velocities of the entity --- (optional)
    maxVelocity.x = maxVelocity.y = Main.MAXVELOCITY;
  }
  override public function update(elapsed:Float):Void{
    //ensures the entity collides with the map --- (technically optional)
    FlxG.collide(bs.map,this);
    //calls FlxSprite.update() --- (required)
    super.update(elapsed);
  }
  public function defaultState():Void{
    //override this funciton
  }
}
