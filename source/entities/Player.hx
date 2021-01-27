package entities;

import entities.Entity;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.system.FlxSound;
import flixel.FlxObject;
import objects.Square;
import states.BaseState;
class Player extends Entity
{

var sSound: FlxSound;

var cSound: FlxSound;

    public function new(x:Float = 0,y:Float = 0,pstate:BaseState){
      //calls Entity.new() --- (required)
      super(x,y,pstate);

      //get playstate access
      //set speed of player movement --- (required)
      SPEED=300;
      //Load the sprite sheet
      loadGraphic("assets/images/CharSheet.png",true,96,96);
      //Load player sound effects --- (optional)
      sSound = FlxG.sound.load("assets/sounds/shoot.wav");
      cSound = FlxG.sound.load("assets/sounds/pickup.wav");
      //make the sprite animations flippable --- (optional)
      setFacingFlip(FlxObject.LEFT,true,false);
      setFacingFlip(FlxObject.RIGHT,false,false);
      //creates animations for the player --- (optional)
      //name of anim, frames to play, loops?, flip x?, flip y?
      animation.add("walk",[7,8],5,true,false);
      animation.add("idle",[5],5,false,false);
      animation.add("jump",[6],5,false,false);
      animation.add("shoot",[9],5,false,false);
      //set the bounding box size and offset of Player --- (optional)
      //45 * 66, offset 30
      setSize(55,66);
      offset.set(20,30);
      //set the health of the player --- (optional)
      health = 25;
      //set the bounciness of the player --- (optional)
      //elasticity == bounciness, 1 is full bounce
      elasticity = .1;

      }
      function getBtns(){
        //get the buttons pressed
        up = FlxG.keys.justPressed.UP || FlxG.keys.justPressed.W;
        down = FlxG.keys.anyPressed([DOWN, S]);
        left = FlxG.keys.anyPressed([LEFT, A]);
        right = FlxG.keys.anyPressed([RIGHT, D]);
        //cancel out any conflicting button presses
        if (up && down){
          up = down = false;
        }
        if (left && right){
          left = right = false;
        }

      }
      //movement function/default state for state machine --- (required)
      /*this function MUST be overridden if you don't want to use a state machine
      just put all player logic in this one function.
      */
      override function defaultState(){
        //movement right now is basic platformer movement
        //change as required game by game
        if(up && isTouching(FlxObject.DOWN)){
          velocity.y = -1570;
        }else if (!isTouching(FlxObject.DOWN)){
          controller.popState();
          controller.pushState(fall);
        }if(FlxG.keys.justPressed.SPACE){
          controller.popState();
          controller.pushState(shoot);
        }
        if(right){
          velocity.x = SPEED;
          animation.play("walk");
          facing = FlxObject.RIGHT;

        }else if (left){
          velocity.x = -SPEED;
          animation.play("walk");
          facing = FlxObject.LEFT;
        }else{
          controller.popState();
          controller.pushState(idle);
        }
      }
      function shoot(){
        //shoot state for state machine --- (optional)
        if(!animation.finished){
          animation.play("shoot");
          sSound.play();
        }else{
          bs.bullets.add(new Square(x,y,facing == FlxObject.RIGHT,bs));
          if(isTouching(FlxObject.DOWN)){
            controller.popState();
            controller.pushState(defaultState);
          }else {
              controller.popState();
              controller.pushState(fall);
          }}

      }
      function fall(){
        //fall function for state machine --- (optional)
        animation.play("jump");
        if (left){
          velocity.x = -SPEED;
          facing = FlxObject.LEFT;
        }else if(right){
          velocity.x = SPEED;
          facing = FlxObject.RIGHT;
        }
        if(isTouching(FlxObject.DOWN)){
          controller.popState();
          controller.pushState(defaultState);
        }else if(FlxG.keys.justPressed.SPACE){
          controller.popState();
          controller.pushState(shoot);
        }
      }
      function idle(){
        //idle function for state machine --- (optional)
        velocity.x = 0;
        animation.play("idle");
        if(up && isTouching(FlxObject.DOWN)){
          velocity.y = -1570;
        }
        if(FlxG.keys.justPressed.SPACE){
          controller.popState();
          controller.pushState(shoot);
        }
        if(!isTouching(FlxObject.DOWN) ){
          controller.popState();
          controller.pushState(fall);
        }else if(up||right||left){
        controller.popState();
        controller.pushState(defaultState);
        }
      }
      //function called when player touches item --- (technically optional)
      function collectItem(player:Player,item){
        //calls use function of the item touched --- (technically optional)
        item.use();
      }
    override public function update(elapsed:Float):Void{
      //gets appropriate button input --- (technically optional)
      getBtns();
      //has player collide with map
      FlxG.collide(bs.map,this);
      //calls collect item function when appropriate --- (optional)
      FlxG.overlap(this,bs.items,collectItem);
      //calls player state machine --- (required)
      controller.update();
      //calls entity.update() --- (required)
      super.update(elapsed);
    }
}
