package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import haxe.Timer;
#if sys
import sys.FileSystem;
import sys.io.File;
#end

class OptionsState extends FlxState
{
	public var musicOption:FlxText = new FlxText(0, 0, FlxG.width, "What type of music?");
	public var musicOptionDsc:FlxText = new FlxText(0, 64, FlxG.width, "Music 1");
	public var musicOptionDscSLC:Int = 0;

	public var noteOption:FlxText = new FlxText(0, 0, FlxG.width, "Note Appears in game?");
	public var noteOptionDsc:FlxText = new FlxText(0, 64, FlxG.width, "True");
	public var noteOptionDscSLC:Int = 0;

	var backToMenu:FlxText = new FlxText(0, 632, FlxG.width, "Back to menu", 64);
	var applyButton:FlxText = new FlxText(0, 504, FlxG.width, "Apply", 64);
    var restartGame:FlxText = new FlxText(300, 504, FlxG.width, "Restart game to see changes", 64);

    var bg:FlxSprite = new FlxSprite(0,0,AssetPaths.blackStatic__png);

	var pageNMB:Int = 0;

	override function create()
	{
		super.create();

		FlxG.camera.fade(FlxColor.BLACK, 1, true, null, false);

        add(bg);

		musicOption.setFormat(AssetPaths.digital_7__ttf, 72, FlxColor.WHITE, FlxTextAlign.LEFT);
		musicOptionDsc.setFormat(AssetPaths.digital_7__ttf, 64, FlxColor.WHITE, FlxTextAlign.LEFT);
		add(musicOption);
		add(musicOptionDsc);

		noteOption.setFormat(AssetPaths.digital_7__ttf, 72, FlxColor.WHITE, FlxTextAlign.LEFT);
		noteOptionDsc.setFormat(AssetPaths.digital_7__ttf, 64, FlxColor.WHITE, FlxTextAlign.LEFT);
		add(noteOption);
		add(noteOptionDsc);

		backToMenu.setFormat(AssetPaths.digital_7__ttf, 72, FlxColor.WHITE, FlxTextAlign.LEFT);
		applyButton.setFormat(AssetPaths.digital_7__ttf, 72, FlxColor.WHITE, FlxTextAlign.LEFT);
		add(backToMenu);
		add(applyButton);

        restartGame.setFormat(AssetPaths.digital_7__ttf, 32, FlxColor.WHITE, FlxTextAlign.LEFT);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.mouse.overlaps(backToMenu) && FlxG.mouse.justPressed)
		{
			FlxG.switchState(new MainMenu());
		}

		if (pageNMB == 0)
		{
			remove(noteOption);
			remove(noteOptionDsc);
			add(musicOption);
			add(musicOptionDsc);
			if (FlxG.mouse.overlaps(musicOptionDsc) && FlxG.mouse.justPressed)
			{
				musicOptionDscSLC = musicOptionDscSLC + 1;
			}
		}
		else if (pageNMB == 1)
		{
			add(noteOption);
			add(noteOptionDsc);
			remove(musicOption);
			remove(musicOptionDsc);
			if (FlxG.mouse.overlaps(noteOptionDsc) && FlxG.mouse.justPressed)
			{
				noteOptionDscSLC = noteOptionDscSLC + 1;
			}
		}

		if (FlxG.keys.justPressed.D)
		{
			pageNMB = 1;
		}
		else if (FlxG.keys.justPressed.A)
		{
			pageNMB = 0;
		}

		if (FlxG.mouse.overlaps(applyButton) && FlxG.mouse.justPressed)
		{
            add(restartGame);
            wait(1000, removeRestart);
			applySettings(musicOptionDsc.text, noteOptionDsc.text);
		}

		switch musicOptionDscSLC
		{
			case 0:
				musicOptionDsc.text = "Music 1";
			case 1:
				musicOptionDsc.text = "Music 2";
			case 2:
				musicOptionDsc.text = "Static";
		}

		switch noteOptionDscSLC
		{
			case 0:
				noteOptionDsc.text = "True";
			case 1:
				noteOptionDsc.text = "False";
		}

		if (musicOptionDscSLC > 2)
		{
			musicOptionDscSLC = 0;
		}
		if (noteOptionDscSLC > 1)
		{
			noteOptionDscSLC = 0;
		}
	}

	public static function applySettings(example:String, example2:String)
	{
		#if sys
		var dir = 'assets\\data\\optionsData.txt';
		File.write(dir, false);

		var options:haxe.ds.List<String> = new List<String>();
		options.add(example);

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

			if (fileContents.indexOf("Music 1") != -1 || fileContents.indexOf("Music 2") != -1 || fileContents.indexOf("Static") != -1)
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

		//Options 2
		var dir2 = 'assets\\data\\optionData2.txt';
		File.write(dir2, false);

		var options2:haxe.ds.List<String> = new List<String>();
		options2.add(example2);

		var output2;

		for (i in options2)
		{
			output2 = File.append(dir2, false);
			output2.writeString(i + "\n");
			output2.close();
		}

		if (FileSystem.exists(dir2))
		{
			var fileContents2 = File.getContent(dir2);

			if (fileContents2.indexOf("True") != -1 || fileContents2.indexOf("False") != -1)
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
	}

    function wait(milliseconds:Int, callback:Void->Void):Void
    {
        Timer.delay(callback, milliseconds);
    }

    function removeRestart() 
    {
        remove(restartGame);
    }
}