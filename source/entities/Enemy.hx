package entities;

import flixel.FlxSprite;
import objects.Square;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.tile.FlxTilemap;
import flixel.graphics.FlxGraphic;
import flixel.graphics.atlas.FlxAtlas;
import flixel.graphics.frames.FlxAtlasFrames;
import FSM;
import states.BaseState;
class Enemy extends Entity
{
  var timer: Float = 0;
  public var damage:Int;
  public var hitByBullet:Bool = false;

    public function new(x:Float = 0,y:Float = 0,pstate:BaseState){
      //Have to call super first
      super(x,y,pstate);
      //Attempt to get an atlas
      SPEED = 200;
      var atlasFrames = FlxAtlasFrames.fromTexturePackerJson("assets/images/EnemySheet1.png","assets/images/EnemySheet1.json");

      frames = atlasFrames;
      //make the sprite flippable
      setFacingFlip(FlxObject.LEFT,true,false);
      setFacingFlip(FlxObject.RIGHT,false,false);

      //name of anim, Prefix in atlas, nums to play, Postfix in atlas, loops?, flip x?, flip y?
      animation.addByIndices("walk","Walk",[1,2,3,4,5,6],"",10,true,false);
      animation.addByIndices("hit","Hit",[1,2,3,4],"",15,false,false);
      animation.addByIndices("attack","Attack",[1,2,3,4],"",10,false,false);
      //create the FSM

      //set the bounding box size 45 * 66, offset 30
      //setSize(55,66);
      //offset.set(20,30);

      damage = 1;
      //elasticity == bounciness, 1 is full bounce
      elasticity = .1;
      //set health to 13
      health = 13;
      }
      //movement function
      override function defaultState(){

        animation.play("walk");
        velocity.x = SPEED;
        if(hitByBullet){
          trace(SPEED);
          controller.popState();
          //push the hit state
          controller.pushState(hit);

        }
        else if(justTouched(FlxObject.RIGHT)||justTouched(FlxObject.LEFT)){
          //trace("Turn should get pushed");
          controller.popState();
          controller.pushState(turn);

        }

      }
    function turn(){
          //trace( "Turning Enemy" );
        SPEED *= -1;
        if(facing == FlxObject.RIGHT){
          facing = FlxObject.LEFT;
        }else{
          facing = FlxObject.RIGHT;
        }
        controller.popState();
        controller.pushState(defaultState);

      }
      function hit(){
        if(hitByBullet){
          hurt(2);

        }
        hitByBullet = false;
        if(!animation.finished){
          animation.play("hit");
          if(isTouching(FlxObject.DOWN)){
          velocity.y = -20;
        }
        }else{

        controller.popState();
        controller.pushState(defaultState);
      }
      }
      function hitEnemy(enemy:Enemy,bullet:Square):Void{
        bs.bullets.remove(bullet,true);
        hitByBullet = true;
        }

      function hitPlayer(enemy:Enemy,player):Void{
        bs.player.hurt(.25);

        }


    override public function update(elapsed:Float):Void{
      FlxG.collide(bs.map,this);
      FlxG.collide(bs.entities,this);
      FlxG.collide(this,bs.bullets,hitEnemy);
      FlxG.collide(this,bs.player,hitPlayer);
      controller.update();

      super.update(elapsed);


    }
}
