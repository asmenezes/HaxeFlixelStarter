package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.tile.FlxTilemap;
import entities.Player;
import objects.Square;
import objects.Diamond;
import flixel.group.FlxGroup;
import flixel.FlxObject;
import flixel.math.FlxPoint;
class PlayState extends FlxState
{
  var map:FlxTilemap;
  var player:Player;
  var bullets:FlxTypedGroup<Square>;
    var diamonds:FlxTypedGroup<Diamond>;
  var itemMap:FlxTilemap;
    override public function create():Void
    {

      //Create the Map
        map = new FlxTilemap();
        //create the Item Map
        itemMap = new FlxTilemap();
        itemMap.loadMapFromCSV("assets/data/mapItems.csv","assets/images/itemSheet.png");
        itemMap.screenCenter();
        //get an array of the tiles coordinates so that I can use them to place diamonds
        diamonds = new FlxTypedGroup<Diamond>();
        var diamondLocations:Array<FlxPoint> = itemMap.getTileCoords(1);
        for(dia in diamondLocations){
          addDiamond(dia);
        }
        add(diamonds);
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
    function shoot(){
      if(FlxG.keys.justPressed.SPACE){
        bullets.add(new Square(player.x,player.y,player.facing == FlxObject.RIGHT));
      }


    }
    function addDiamond(location:FlxPoint){
      diamonds.add(new Diamond(location.x,location.y));
    }
    function collectDiamond(player:Player,diamond:Diamond){
      diamonds.remove(diamond,true);
      Main.gems++;
      trace( Main.gems );
    }
    override public function update(elapsed:Float):Void
    {
    FlxG.collide(map,player);
    FlxG.collide(map,diamonds);
    FlxG.collide(player,diamonds,collectDiamond);
    FlxG.collide(map,bullets,hitBullet);
    shoot();
        super.update(elapsed);


    }
}
