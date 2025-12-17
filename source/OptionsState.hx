package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import haxe.Timer;

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

    var bg:FlxSprite = new FlxSprite(0,0,AssetPaths.blackStatic__png);

	var pageNMB:Int = 0;

	var fade:FlxSprite = new FlxSprite(0, 0, AssetPaths.fade2__png);

	override function create()
	{
		super.create();

		FlxG.camera.fade(FlxColor.BLACK, 1, true, null, false);

        add(bg);
		add(fade);

		musicOption.setFormat(AssetPaths.digital_7__ttf, 72, FlxColor.WHITE, FlxTextAlign.LEFT);
		musicOptionDsc.setFormat(AssetPaths.digital_7__ttf, 64, FlxColor.WHITE, FlxTextAlign.LEFT);
		add(musicOption);
		add(musicOptionDsc);

		if (FlxG.save.data.musicOptionDsc == null)
		{
			FlxG.save.data.musicOptionDsc = "Music 1";
			FlxG.save.flush();
		}

		noteOption.setFormat(AssetPaths.digital_7__ttf, 72, FlxColor.WHITE, FlxTextAlign.LEFT);
		noteOptionDsc.setFormat(AssetPaths.digital_7__ttf, 64, FlxColor.WHITE, FlxTextAlign.LEFT);
		add(noteOption);
		add(noteOptionDsc);

		if (FlxG.save.data.noteOptionDsc == null)
		{
			FlxG.save.data.musicOptionDsc = "True";
			FlxG.save.flush();
		}

		backToMenu.setFormat(AssetPaths.digital_7__ttf, 72, FlxColor.WHITE, FlxTextAlign.LEFT);
		applyButton.setFormat(AssetPaths.digital_7__ttf, 72, FlxColor.WHITE, FlxTextAlign.LEFT);
		add(backToMenu);
		add(applyButton);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.mouse.overlaps(backToMenu))
		{
			backToMenu.color = FlxColor.GRAY;
			if (FlxG.mouse.justPressed)
			{
				FlxG.switchState(new MainMenu());
			}
		}
		else
		{
			backToMenu.color = FlxColor.WHITE;
		}

		if (pageNMB == 0)
		{
			remove(noteOption);
			remove(noteOptionDsc);
			add(musicOption);
			add(musicOptionDsc);
			if (FlxG.mouse.overlaps(musicOptionDsc))
			{
				musicOptionDsc.color = FlxColor.GRAY;
				if (FlxG.mouse.justPressed)
				{
					musicOptionDscSLC = musicOptionDscSLC + 1;
				}
			}
			else
			{
				musicOptionDsc.color = FlxColor.WHITE;
			}
		}
		else if (pageNMB == 1)
		{
			add(noteOption);
			add(noteOptionDsc);
			remove(musicOption);
			remove(musicOptionDsc);
			if (FlxG.mouse.overlaps(noteOptionDsc))
			{
				noteOptionDsc.color = FlxColor.GRAY;
				if (FlxG.mouse.justPressed)
				{
					noteOptionDscSLC = noteOptionDscSLC + 1;
				}
			}
			else
			{
				noteOptionDsc.color = FlxColor.WHITE;
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

		if (FlxG.mouse.overlaps(applyButton))
		{
			applyButton.color = FlxColor.GRAY;
			if (FlxG.mouse.justPressed)
			{
				applySettings(musicOptionDsc.text, noteOptionDsc.text);
			}
		}
		else
		{
			applyButton.color = FlxColor.WHITE;
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
		FlxG.save.data.musicOptionDsc = example;
		FlxG.save.data.noteOptionDsc = example2;
		FlxG.save.flush();
	}

    function wait(milliseconds:Int, callback:Void->Void):Void
    {
        Timer.delay(callback, milliseconds);
    }
}