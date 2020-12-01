package objects;

import flixel.FlxSprite;
import flixel.FlxG;
//https://api.haxeflixel.com/flixel/tile/FlxTilemap.html#getTileCoords
//^^^ use this funtion to create an array with the coordinates of all of a type of tile, use that for adding diamonds to the map
class Diamond extends FlxSprite
{
  public function new(x:Float,y:Float)
  {
      super(x,y);
      loadGraphic("assets/images/Diamond.png");
      velocity.y=200;

  }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }
}
