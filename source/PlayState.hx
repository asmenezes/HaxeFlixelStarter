package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.tile.FlxTilemap;
import entities.Player;
import objects.Square;
import flixel.group.FlxGroup;
import flixel.FlxObject;
class PlayState extends FlxState
{
  var map:FlxTilemap;
  var player:Player;
  var bullets:FlxTypedGroup<Square>;

    override public function create():Void
    {

      //Create the Map
        map = new FlxTilemap();
        //Add one to all CSV numbers and add a blank initial tile
        map.loadMapFromCSV("assets/data/map.csv","assets/images/TileSheet.png");
        map.screenCenter();
        //Set the bounds of the world to the size of the map..... SUPER IMPORTANT
        FlxG.worldBounds.set(map.x, map.y, map.width, map.height);

        //Create the Player
    player = new Player(90,90);
    //add player to the level
      add(player);
      bullets = new FlxTypedGroup<Square>(50);
      add(bullets);
      //make the camera follow the player
      FlxG.camera.follow(player,PLATFORMER,1);
        add(map);
        super.create();
    }
    function hitBullet(map:FlxTilemap,bullet:Square):Void{
      bullets.remove(bullet,true);
    }

    override public function update(elapsed:Float):Void
    {
    FlxG.collide(map,player);
    FlxG.collide(map,bullets,hitBullet);
    if(FlxG.keys.justPressed.SPACE){
      bullets.add(new Square(player.x,player.y,player.facing == FlxObject.RIGHT));
    }
        super.update(elapsed);


    }
}
