package states;
import flixel.FlxState;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.tile.FlxTilemap;
import objects.Item;
import entities.Entity;
import flixel.group.FlxGroup;
import flixel.FlxObject;
import flixel.math.FlxPoint;
import flixel.FlxSprite;
import objects.Square;
import objects.Diamond;
import objects.Door;
import entities.Player;
class BaseState extends FlxState{
  public var entities:FlxTypedGroup<Entity>;
  public var player:Player;
  public var itemMap:FlxTilemap;
  public var entityMap:FlxTilemap;
  public var map:FlxTilemap;
  public var items:FlxTypedGroup<Item>;
  public var bullets:FlxTypedGroup<Square>;
  override public function create():Void
  {

  FlxG.worldBounds.set(map.x, map.y, map.width, map.height);
  FlxG.camera.follow(player,PLATFORMER,1);
  super.create();
}

override public function update(elapsed:Float):Void{
  super.update(elapsed);
}

public function checkPass(player:FlxSprite,item:FlxSprite):Void{
//  Override this function in the level
}
public function loadMap(csv:String,tiles:String):Void{
  map = new FlxTilemap();
  map.loadMapFromCSV(csv,tiles,64,64,0,1);

  //map.screenCenter;
  add(map);
}
public function loadItems(csv:String,img:String){
  itemMap = new FlxTilemap();
  itemMap.loadMapFromCSV(csv,img);

  //itemMap.screenCenter();
  items = new FlxTypedGroup<Item>();
}

public function loadEntities(csv:String,img:String){
  entityMap = new FlxTilemap();
  entityMap.loadMapFromCSV(csv,img);
  entities = new FlxTypedGroup<Entity>();
}

public function addItems(id:Int,cls):Void{

  var itemLocations:Array<FlxPoint> = itemMap.getTileCoords(id);
  for(itm in itemLocations){
    addItem(itm,cls);
  }
  add(items);
}

public function addItem(loc:FlxPoint,cls){
  items.add(cls(loc.x - 32,loc.y -32,this));
}
}
/*
map and tiles
player location
enemies maps
item maps
goal state
background images
sounds



public var map:FlxTilemap;
public var player:Player;
public var bullets:FlxTypedGroup<Square>;
public var diamonds:FlxTypedGroup<Diamond>;
public var itemMap:FlxTilemap;
public var enems:FlxTypedGroup<Enemy>;
public var door:Door;

*/
