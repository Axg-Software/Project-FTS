package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;

class TransitionState extends FlxState
{
	var night1:FlxSprite = new FlxSprite(0, 0, AssetPaths.night1__png);
	var timer:Float = 0;
	var color:FlxColor;
	var direction(default, null):Bool;

	override function create()
	{
		super.create();
		bgColor = 0;
		add(night1);
		FlxG.sound.playMusic(AssetPaths.bgNoise__ogg, 1, true);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		FlxG.camera.fade(FlxColor.BLACK, 3, false, onComplete, false);
	}

	function onComplete()
	{
		FlxG.switchState(new PlayState());
	}
}
