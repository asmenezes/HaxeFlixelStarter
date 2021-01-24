package states;

import flixel.FlxState;
import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
class CreditsState extends FlxState{
   var playButton:FlxButton;
    override public function create():Void{
      playButton = new FlxButton(0, 0, "Menu", clickMenu);
      playButton.screenCenter();
      playButton.y += 60;
      add(playButton);
      FlxG.camera.bgColor = FlxColor.fromString("#96ace8");
        super.create();
    }

    override public function update(elapsed:Float):Void{
        super.update(elapsed);
    }
    function clickMenu(){
    FlxG.switchState(new MenuState());
}
}
