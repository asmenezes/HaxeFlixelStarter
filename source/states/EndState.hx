package states;

import flixel.FlxState;
import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.util.FlxColor;
class EndState extends FlxState{
   var playButton:FlxButton;
    override public function create():Void{
      playButton = new FlxButton(0, 0, "Menu", clickMenu);
      playButton.screenCenter();
      playButton.y += 60;
      add(playButton);
      FlxG.camera.bgColor = FlxColor.fromString("#96ace8");
      var disp = new FlxText();
      disp.text = "Game Over";
      disp.color = FlxColor.RED;
      disp.size = 25;
      disp.screenCenter();
      disp.y -= 100;
      add(disp);
      super.create();
    }

    override public function update(elapsed:Float):Void{
        super.update(elapsed);
    }
    function clickMenu(){
    FlxG.switchState(new MenuState());
}
}
