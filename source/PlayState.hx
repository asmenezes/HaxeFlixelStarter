package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.tile.FlxTilemap;
import entities.Player;
import objects.Square;
import objects.Diamond;
import objects.Door;
import entities.Enemy;
import flixel.group.FlxGroup;
import flixel.FlxObject;
import flixel.math.FlxPoint;
class PlayState extends FlxState
{
  public var map:FlxTilemap;
  public var player:Player;
  public var bullets:FlxTypedGroup<Square>;
  public var diamonds:FlxTypedGroup<Diamond>;
  public var itemMap:FlxTilemap;
  public var enems:FlxTypedGroup<Enemy>;
  public var door:Door;
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
        //adds the first door to the map
        var doorLocation:Array<FlxPoint> = itemMap.getTileCoords(2);
        door = new Door(doorLocation[0].x,doorLocation[0].y,this);
        add(door);
        //Add one to all CSV numbers and add a blank initial tile
        map.loadMapFromCSV("assets/data/map.csv","assets/images/TileSheet.png");

        map.screenCenter();
        //Set the bounds of the world to the size of the map..... SUPER IMPORTANT
        FlxG.worldBounds.set(map.x, map.y, map.width, map.height);
        //enemy stuff
        enems = new FlxTypedGroup<Enemy>();
        var enem = new Enemy(300,100,this);
        enems.add(enem);
        add(enems);
        //Create the Player
    player = new Player(90,90,this);
    //add player to the level
      add(player);
      bullets = new FlxTypedGroup<Square>(50);
      add(bullets);
      //make the camera follow the player
      FlxG.camera.follow(player,PLATFORMER,1);
        add(map);
        super.create();
    }

    function addDiamond(location:FlxPoint){
      diamonds.add(new Diamond(location.x,location.y,this));
    }

    function checkPass(){
      //go to new level but check first
              if(FlxG.collide(player,door)){
      trace("Go to new level");
      FlxG.resetState();
    }else if(player.health <= 0){
      trace("You lose");
      FlxG.resetState();
    }

    }
    function addItems(){

    }
    function addEnemies(){

    }
function addMap(){

}
    override public function update(elapsed:Float):Void
    {
  
      checkPass();
        super.update(elapsed);
    }
}
