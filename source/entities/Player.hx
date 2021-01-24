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
      //Have to call super first
      super(x,y,pstate);

      //get playstate access
      //set speed
      SPEED=300;
      //Load the sprite sheet
      loadGraphic("assets/images/CharSheet.png",true,96,96);
      //shooty sound
      sSound = FlxG.sound.load("assets/sounds/shoot.wav");
      //Collection Sound
      cSound = FlxG.sound.load("assets/sounds/pickup.wav");
      //make the sprite flippable
      setFacingFlip(FlxObject.LEFT,true,false);
      setFacingFlip(FlxObject.RIGHT,false,false);

      //name of anim, frames to play, loops?, flip x?, flip y?
      animation.add("walk",[7,8],5,true,false);
      animation.add("idle",[5],5,false,false);
      animation.add("jump",[6],5,false,false);
      animation.add("shoot",[9],5,false,false);
      //set the bounding box size 45 * 66, offset 30
      setSize(55,66);
      offset.set(20,30);
      //set the health
      health = 25;

      //elasticity == bounciness, 1 is full bounce
      //elasticity = .1;
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
      //movement function
      override function defaultState(){


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
      function collectItem(player:Player,item){
        item.use();
      }
    override public function update(elapsed:Float):Void{
      getBtns();
      //call the movement function to move
      FlxG.collide(bs.map,this);
      FlxG.overlap(this,bs.items,collectItem);
    //  shoot();
      controller.update();
        super.update(elapsed);


    }
}
/*
Side to side movement state is default
-if not touching floor then in jumping state
-if moving then and shoot do movingshoot state

jumping state
-if touching floor then go to default state



*/
