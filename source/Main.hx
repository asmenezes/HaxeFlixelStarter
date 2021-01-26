package;

import flixel.FlxGame;
import openfl.display.Sprite;
import flixel.FlxG;
import flixel.graphics.atlas.FlxAtlas;
import flixel.graphics.frames.FlxAtlasFrames;
class Main extends Sprite
{
	//Game Variables not related to any state or object.
	public static var gems:Int;
	public static final GRAVITY: Float = 900.0;
	public static final DRAG: Float = 2600.0;
	public static final MAXVELOCITY: Float = 300.0;

	public function new()
	{
		//FlxG.sound.toggleMuted();
		gems = 0;
		super();
		addChild(new FlxGame(0, 0, MenuState));
	}
}
