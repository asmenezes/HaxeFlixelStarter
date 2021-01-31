package;
//example of how to extend the BaseState
//duplicate this and make adjustments for each level (or do it the hard way)
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
import states.BaseState;
import flixel.FlxSprite;
class PlayState3 extends BaseState
{

    override public function create():Void
    {
        //load and play background music --- optional
        playMusic("assets/music/MandatoryOvertime.mp3");
        //load tilemap and map --- (required((Kinda)))
        loadMap("assets/maps/map2_Map.csv","assets/images/TileSheetLong.png");
        //load item map and bogus images string --- (optional)
        loadItems("assets/maps/map2_Items.csv","assets/images/TileSheetLong.png");
        //load entity map and bogus images string --- (optional)
        loadEntities("assets/maps/map2_Entities.csv","assets/images/TileSheetLong.png");
        //load objects of type 11 (Diamond) into game and set offset dist --- (optional)
        addObjects(11,cast(itemMap),cast(items),cast(Diamond.new),32);
        //load object of type 50 (Door) into game and set offset dist --- (optional)
        addObjects(50,cast(itemMap),cast(items),cast(Door.new),32);
        //load entities of type 9 (Enemy) into game and set offset dist --- (optional)
        addObjects(9,(cast(entityMap)),cast(entities),cast(Enemy.new),100);
        //load player into game --- (required)
        player = new Player(90,90,this);
        //actually puts the player in the scene --- (required)
        add(player);
        //creates bullet group for projectiles --- (required but removable)
        bullets = new FlxTypedGroup<Square>(50);
        add(bullets);
        //calls BaseState.create() --- (required)
        super.create();
    }


    override public function update(elapsed:Float):Void
    {
        //calls BaseState.update() --- (required)
        super.update(elapsed);
    }
    override public function checkPass(player:FlxSprite,item:FlxSprite):Void{
      trace("Check if Passed");
    }
}
