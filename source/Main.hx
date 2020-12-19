package;

import flixel.FlxGame;
import openfl.display.Sprite;
import flixel.FlxG;
class Main extends Sprite
{
	//Game Variables not related to any state or object.
	public static var gems:Int;
	public static final GRAVITY: Int = 900;
	public static final DRAG: Int = 2600;
	public function new()
	{
		gems = 0;
		super();
		addChild(new FlxGame(0, 0, MenuState));
	}
}
