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
import states.BaseState;
import flixel.FlxSprite;
class PlayState3 extends BaseState
{

    override public function create():Void
    {

        loadMap("assets/maps/map2_Map.csv","assets/images/TileSheetLong.png");
        loadItems("assets/maps/map2_Items.csv","assets/images/TileSheetLong.png");
        loadEntities("assets/maps/map2_Entities.csv","assets/images/TileSheetLong.png");
        addObjects(11,cast(itemMap),cast(items),cast(Diamond.new),32);
        addObjects(50,cast(itemMap),cast(items),cast(Door.new),32);
        addObjects(9,(cast(entityMap)),cast(entities),cast(Enemy.new),100);
        player = new Player(90,90,this);
        add(player);
        bullets = new FlxTypedGroup<Square>(50);
        add(bullets);
        super.create();
    }


    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }
    override public function checkPass(player:FlxSprite,item:FlxSprite):Void{
      trace("Check if Passed");
    }
}
