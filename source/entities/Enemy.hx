package entities;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.tile.FlxTilemap;

class Enemy extends FlxSprite
{
  var SPEED: Int = 200;
  final MAXVELOCITY: Int = 300;
    public function new(x:Float = 0,y:Float = 0){
      //Have to call super first
      super(x,y);
      //Load the sprite sheet
      loadGraphic("assets/images/Monster_Walk.png",true,95,95);
      //make the sprite flippable
      setFacingFlip(FlxObject.LEFT,true,false);
      setFacingFlip(FlxObject.RIGHT,false,false);

      //name of anim, frames to play, loops?, flip x?, flip y?
      animation.add("walk",[1,2,3,4,5,6],5,true,false);
      animation.play("walk");
      //set the bounding box size 45 * 66, offset 30
      setSize(55,66);
      offset.set(20,30);
      //400 gravity
      acceleration.y = Main.GRAVITY;

      //set max velocities
      maxVelocity.x = maxVelocity.y = MAXVELOCITY;
      // Set drag
      drag.x = drag.y = Main.DRAG;
      //elasticity == bounciness, 1 is full bounce
      //elasticity = .1;
      //set health to 13
      health = 13;
      }
      //movement function
      function move(elapsed:Float){

        animation.play("walk");
        velocity.x = SPEED;


      }
    public function turn(enemy:Enemy,map:FlxTilemap){
      if(justTouched(FlxObject.WALL)){

          //trace( "Turning Enemy" );
        SPEED *= -1;
        if(facing == FlxObject.RIGHT){
          facing = FlxObject.LEFT;
        }else{
          facing = FlxObject.RIGHT;
        }}
      }
    override public function update(elapsed:Float):Void{

      move(elapsed);

        super.update(elapsed);


    }
}
