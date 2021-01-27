package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
class MenuState extends FlxState{
   var playButton:FlxButton;
   var creditsButton:FlxButton;
    override public function create():Void{
      if (FlxG.sound.music == null || FlxG.sound.music.playing == false){
        FlxG.sound.playMusic("assets/music/Soliloquy.mp3", 1, true);
      }
      playButton = new FlxButton(0, 0, "Play", clickPlay);
      playButton.screenCenter();
      add(playButton);
      creditsButton = new FlxButton(0, 0, "Credits", clickCredits);
      creditsButton.screenCenter();
      creditsButton.y += 60;
      add(creditsButton);
      FlxG.camera.bgColor = FlxColor.fromString("#96ace8");
      super.create();
    }

    override public function update(elapsed:Float):Void{
        super.update(elapsed);
    }
    function clickPlay(){
      FlxG.sound.pause();
    FlxG.switchState(new PlayState3());
}
function clickCredits(){
  FlxG.sound.pause();
FlxG.switchState(new states.CreditsState());
}
}
