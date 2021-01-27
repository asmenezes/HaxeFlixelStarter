package objects;
// example of how to extend the item class properly
import flixel.FlxSprite;
import flixel.FlxG;
import states.BaseState;
import objects.Item;

class Diamond extends Item
{

  public function new(x:Float,y:Float,pState:BaseState)
  {
      //calls item.new() --- (required)
      super(x,y,pState);
      //loads the items image --- (required)
      loadGraphic("assets/images/Diamond.png");
  }

    override public function update(elapsed:Float):Void
    {
        //call item.update() --- (required)
        super.update(elapsed);
    }
    override public function use() : Void {
      //removes this item from the group if used --- (optional)
      bs.items.remove(this,true);
      //adds one to gem count if used --- (optional)
      Main.gems++;
      //logs the gem count --- (optional)
      trace(Main.gems);
    }
}
