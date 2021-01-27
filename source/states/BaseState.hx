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
import flixel.system.FlxSound;
class BaseState extends FlxState{
  public var entities:FlxTypedGroup<Entity>;
  public var player:Player;
  public var itemMap:FlxTilemap;
  public var entityMap:FlxTilemap;
  public var map:FlxTilemap;
  public var items:FlxTypedGroup<Item>;
  public var bullets:FlxTypedGroup<Square>;
  public var bgMusic:FlxSound;
  override public function create():Void
  {
    //sets world size to map size & ensures collisions can happen all over the map --- (required)
    FlxG.worldBounds.set(map.x, map.y, map.width, map.height);
    //sets the camera to follow player in PLATFORMER stye with a lerp of 1 --- (technically optional)
    //change to suitable style -(https://api.haxeflixel.com/flixel/FlxCameraFollowStyle.html)
    FlxG.camera.follow(player,PLATFORMER,1);
    //calls FlxState.create() --- (required)
    super.create();
}

override public function update(elapsed:Float):Void{
  //calls FlxState.update() --- (required)
  super.update(elapsed);
}
public function playMusic(song:String){
  //creates the sound for the background music
  bgMusic = new FlxSound();
  //loads the background music sound in
  bgMusic.loadEmbedded(song,true,false);
  add(bgMusic);
  //if there is nothing playing, play the background music
  if (FlxG.sound.music == null || FlxG.sound.music.playing == false){
    bgMusic.play(false,0.0);
    trace(bgMusic);
}

}
public function checkPass(player:FlxSprite,item:FlxSprite):Void{
//  Override this function in the level
}
public function loadMap(csv:String,tiles:String):Void{
  //creates new tilemap
  map = new FlxTilemap();
  //loads in the map and its tiles
  map.loadMapFromCSV(csv,tiles);
  //adds map to state
  add(map);
}
public function loadItems(csv:String,img:String){
  //creates the itemMap
  itemMap = new FlxTilemap();
  //loads in item positions and a bogus image
  itemMap.loadMapFromCSV(csv,img);
  //creates group for items to be in
  items = new FlxTypedGroup<Item>();
}

public function loadEntities(csv:String,img:String){
  //creates entityMap
  entityMap = new FlxTilemap();
  //loads in entity positions and a bogus image
  entityMap.loadMapFromCSV(csv,img);
  //creates group for entities to be in
  entities = new FlxTypedGroup<Entity>();
}

public function addObjects(id:Int,objMap:FlxTilemap,objGroup:FlxTypedGroup<FlxSprite>,cls,hheight:Int):Void{
  //gets locations of all of one type of object
  var objectLocations:Array<FlxPoint> = objMap.getTileCoords(id);
  for(loc in objectLocations){
    //calls function to add a new object
    addObject(loc,objGroup,cls,hheight);
  }
  //adds the group to the state
  add(objGroup);
}

public function addObject(loc:FlxPoint,objs,cls,hheight){
  //adds a new object to the appropriate group with appropriate offset
  objs.add(cls(loc.x - hheight,loc.y -hheight,this));
}
}
