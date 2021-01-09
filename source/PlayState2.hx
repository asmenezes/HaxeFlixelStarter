package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.addons.editors.tiled.TiledMap;
import flixel.tile.FlxTilemap;
import entities.Player;
import objects.Square;
import objects.Diamond;
import objects.Door;
import entities.Enemy;
import flixel.group.FlxGroup;
import flixel.FlxObject;
import flixel.math.FlxPoint;
class PlayState2 extends FlxState
{
  public var map:TiledMap;
  public var player:Player;
  public var bullets:FlxTypedGroup<Square>;
  public var diamonds:FlxTypedGroup<Diamond>;
  public var itemMap:FlxTilemap;
  public var enems:FlxTypedGroup<Enemy>;
  public var door:Door;
    override public function create():Void
    {

      //Create the Map
        map = new TiledMap("assets/maps/map2.tmx");
        //create the Item Map
        itemMap = new FlxTilemap();
        itemMap.loadMapFromCSV("assets/data/mapItems.csv","assets/images/itemSheet.png");
        itemMap.screenCenter();


        map.screenCenter();
        //Set the bounds of the world to the size of the map..... SUPER IMPORTANT
        FlxG.worldBounds.set(map.x, map.y, map.width, map.height);
        //enemy stuff

      //make the camera follow the player
      //FlxG.camera.follow(player,PLATFORMER,1);
        add(map);
        super.create();
    }


    override public function update(elapsed:Float):Void
    {


        super.update(elapsed);
    }
}
