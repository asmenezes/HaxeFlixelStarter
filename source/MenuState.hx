package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
class MenuState extends FlxState{
   var playButton:FlxButton;
    override public function create():Void{
      playButton = new FlxButton(0, 0, "Play", clickPlay);
      playButton.screenCenter();
      add(playButton);
      FlxG.camera.bgColor = FlxColor.fromString("#96ace8");
        super.create();
    }

    override public function update(elapsed:Float):Void{
        super.update(elapsed);
    }
    function clickPlay(){
    FlxG.switchState(new PlayState());
}
}
