package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;
#if sys
import sys.FileSystem;
import sys.io.File;
#end
class TransitionState extends FlxState
{
	var night1:FlxSprite = new FlxSprite(0, 0, AssetPaths.night1__png);
	var timer:Float = 0;
	var color:FlxColor;

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
		#if sys// WHY DOES THIS NOT COMPILE
		var dir2 = 'assets\\data\\gameCreated.axh';
		File.write(dir2, false);

		var options2:haxe.ds.List<String> = new List<String>();
		options2.add("Game_Created");

		var output2;

		for (i in options2)
		{
			output2 = File.append(dir2, false);
			output2.writeString(i + "\n");
			output2.close();
		}
		#end
		FlxG.camera.fade(FlxColor.BLACK, 3, false, onComplete, false);
	}

	function onComplete()
	{
		FlxG.switchState(new PlayState());
	}
}
