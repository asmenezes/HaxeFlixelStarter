package entities;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.system.FlxSound;
import flixel.FlxObject;
import objects.Square;
class Player extends FlxSprite
{
final SPEED:Int = 300;
var up:Bool = false;
var down:Bool = false;
var left:Bool = false;
var right:Bool = false;
var ps:PlayState;
var sSound: FlxSound;
var cSound: FlxSound;

    public function new(x:Float = 0,y:Float = 0,pstate:PlayState){
      //Have to call super first
      super(x,y);
      //get playstate access
      ps = pstate;
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
      //set the bounding box size 45 * 66, offset 30
      setSize(55,66);
      offset.set(20,30);
      //set the health
      health = 5;
      //400 gravity
      acceleration.y = Main.GRAVITY;
      //set max velocities
      maxVelocity.x = maxVelocity.y = 300;
      // Set drag
      drag.x = drag.y = Main.DRAG;
      //elasticity == bounciness, 1 is full bounce
      //elasticity = .1;
      }
      //movement function
      function move(elapsed:Float){
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


        if(up && isTouching(FlxObject.DOWN)){
          velocity.y = -1570;
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
          velocity.x = 0;
          animation.play("idle");
        }
      }
      function shoot(){
        if(FlxG.keys.justPressed.SPACE){
          sSound.play();
          ps.bullets.add(new Square(x,y,facing == FlxObject.RIGHT,ps));
        }
      }
      function collectDiamond(player:Player,diamond){
        cSound.play();
        ps.diamonds.remove(diamond,true);
        Main.gems++;
        trace( Main.gems );
      }
    override public function update(elapsed:Float):Void{
      //call the movement function to move
      FlxG.collide(ps.map,this);
      FlxG.collide(this,ps.diamonds,collectDiamond);
      move(elapsed);
      shoot();
        super.update(elapsed);


    }
}
