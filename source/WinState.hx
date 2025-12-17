package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;
import haxe.Timer;

class WinState extends FlxState
{
	var sprite:FlxSprite = new FlxSprite(0, 0, AssetPaths.win__png);

	override function create()
	{
		super.create();
		add(sprite);
		FlxG.sound.playMusic(AssetPaths.bgNoise__ogg, 1, true);

		FlxG.save.data.wonGame = "WonGame";
		FlxG.save.flush();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.save.data.wonGame == "WonGame")
		{
			// idk if i even need this
		}

		if (FlxG.keys.justPressed.R)
		{
			FlxG.switchState(new EndNoteState());
		}

		FlxG.camera.fade(FlxColor.BLACK, 3, true, onComplete, false);
	}

	function onComplete()
	{
		FlxG.camera.fade(FlxColor.BLACK, 3, false, onComplete2, false);
	}

	function onComplete2()
	{
		FlxG.switchState(new EndNoteState());
	}

	function wait(milliseconds:Int, callback:Void->Void):Void
	{
		Timer.delay(callback, milliseconds);
	}
}
