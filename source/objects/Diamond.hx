package objects;

import flixel.FlxSprite;
import flixel.FlxG;
//https://api.haxeflixel.com/flixel/tile/FlxTilemap.html#getTileCoords
//^^^ use this funtion to create an array with the coordinates of all of a type of tile, use that for adding diamonds to the map
class Diamond extends FlxSprite
{
  var ps:PlayState;
  public function new(x:Float,y:Float,pState:PlayState)
  {
      super(x,y);
      ps = pState;
      loadGraphic("assets/images/Diamond.png");
      velocity.y=200;

  }

    override public function update(elapsed:Float):Void
    {
          FlxG.collide(ps.map,this);
        super.update(elapsed);
    }
}
