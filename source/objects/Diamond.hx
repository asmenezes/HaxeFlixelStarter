package objects;

import flixel.FlxSprite;
import flixel.FlxG;
import states.BaseState;
import objects.Item;
//https://api.haxeflixel.com/flixel/tile/FlxTilemap.html#getTileCoords
//^^^ use this funtion to create an array with the coordinates of all of a type of tile, use that for adding diamonds to the map
class Diamond extends Item
{

  public function new(x:Float,y:Float,pState:BaseState)
  {
      super(x,y,pState);

      loadGraphic("assets/images/Diamond.png");

  }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }
    override public function use() : Void {
      bs.items.remove(this,true);
      Main.gems++;
      trace(Main.gems);
    }
}
