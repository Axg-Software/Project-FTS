package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;
import haxe.Timer;
#if sys
import sys.FileSystem;
import sys.io.File;
#end

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

		#if sys
		var dir = 'assets\\data\\win.axh';
		File.write(dir, false);

		var options:haxe.ds.List<String> = new List<String>();
		options.add("WonGame");

		var output;

		for (i in options)
		{
			output = File.append(dir, false);
			output.writeString(i + "\n");
			output.close();
		}

		if (FileSystem.exists(dir))
		{
			var fileContents = File.getContent(dir);

			if (fileContents.indexOf("WonGame") != -1)
			{
				trace("The file contains 'Example'.");
			}
			else
			{
				trace("The file does not contain 'Example'.");
			}
		}
		else
		{
			trace("File does not exist.");
		}
		#end

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

	function wait(milliseconds:Int, callback:Void->Void):Void
	{
		Timer.delay(callback, milliseconds);
	}
}
