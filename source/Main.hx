package;

import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	//Game Variables not related to any state or object.
	public static var gems:Int;
	
	public function new()
	{
		gems = 0;
		super();
		addChild(new FlxGame(0, 0, PlayState));
	}
}
