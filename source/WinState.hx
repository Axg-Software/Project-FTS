package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;

class WinState extends FlxState
{
	var sprite:FlxSprite = new FlxSprite(0, 0, AssetPaths.win__png);

	override function create()
	{
		super.create();
		add(sprite);
		FlxG.sound.playMusic(AssetPaths.bgNoise__ogg, 1, true);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.R)
		{
			FlxG.switchState(new MainMenu());
		}

		FlxG.camera.fade(FlxColor.BLACK, 3, true, onComplete, false);
	}

	function onComplete()
	{
		FlxG.camera.fade(FlxColor.BLACK, 3, false, onComplete2, false);
	}

	function onComplete2()
	{
		FlxG.switchState(new MainMenu());
	}
}
