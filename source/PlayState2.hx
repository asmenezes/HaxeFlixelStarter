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
class PlayState2 extends BaseState
{

    override public function create():Void
    {


        loadMap("assets/data/map.csv","assets/images/TileSheet.png");
        loadItems("assets/data/mapItems.csv","assets/images/itemSheet.png");
        addItems(1,cast(Diamond.new));
        addItems(2,cast(Door.new));
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
