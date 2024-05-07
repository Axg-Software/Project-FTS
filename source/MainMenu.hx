package;

import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.sound.FlxSound;
import flixel.util.FlxColor;
#if sys
import sys.FileSystem;
import sys.io.File;
#end

class MainMenu extends FlxState
{
	var selected:String = "start";

	var menuBg:FlxSprite = new FlxSprite(0, 0, AssetPaths.blackStatic__png);

	var startButton:FlxText = new FlxText(0, 193, FlxG.width, "New game", 64);
	var creditsButton:FlxText = new FlxText(0, 260, FlxG.width, "Credits", 64);
	var optionsButton:FlxText = new FlxText(0, 335, FlxG.width, "Options", 64);
	var title:FlxText = new FlxText(0, 0, FlxG.width, "Project: FTS", 72);

	var cursor:FlxSprite;

	var cursorX:Float = FlxG.mouse.x;
	var cursorY:Float = FlxG.mouse.y;
	var camSound:FlxSound;

	var versionNumber:FlxText = new FlxText(0,0,FlxG.width, "v1.2", 32);

	var musicSelect:Int = 0;

	var starComplete:FlxSprite = new FlxSprite(1216, 656, AssetPaths.starComplete__png);

	override public function create()
	{
		super.create();

		FlxG.camera.fade(FlxColor.BLACK, 1, true, null, false);

		camSound = FlxG.sound.load(AssetPaths.cameraOpen__ogg);

		cursor = new FlxSprite(cursorX, cursorY);
		cursor.origin.x = cursor.width / 2;
		cursor.origin.y = cursor.height / 2;
		cursor.makeGraphic(1, 1, FlxColor.BLACK);
		cursor.alpha = 1;
		FlxG.mouse.useSystemCursor = true;

		versionNumber.setFormat(AssetPaths.digital_7__ttf, 29, FlxColor.WHITE, FlxTextAlign.RIGHT);
		optionsButton.setFormat(AssetPaths.digital_7__ttf, 64, FlxColor.WHITE, FlxTextAlign.LEFT);
		startButton.setFormat(AssetPaths.digital_7__ttf, 64, FlxColor.WHITE, FlxTextAlign.LEFT);
		creditsButton.setFormat(AssetPaths.digital_7__ttf, 64, FlxColor.WHITE, FlxTextAlign.LEFT);
		title.setFormat(AssetPaths.digital_7__ttf, 128, FlxColor.WHITE, FlxTextAlign.LEFT);

		add(menuBg);
		add(startButton);
		add(creditsButton);
		add(cursor);
		add(versionNumber);
		add(optionsButton);
		add(title);
	}

	override public function update(elapsed:Float)
	{
		cursor.x = FlxG.mouse.x - cursor.width / 2;
		cursor.y = FlxG.mouse.y - cursor.height / 2;

		if (cursor.overlaps(startButton) && FlxG.mouse.justPressed)
		{
			camSound.play();
			FlxG.switchState(new TransitionState());
		}
		else if (cursor.overlaps(creditsButton) && FlxG.mouse.justPressed)
		{
			camSound.play();
			FlxG.switchState(new CreditState());
		}
		else if (cursor.overlaps(optionsButton) && FlxG.mouse.justPressed)
		{
			camSound.play();
			FlxG.switchState(new OptionsState());
		}

		//Options for music
		#if sys
		var dir = 'C:\\Users\\ehard\\OneDrive\\Desktop\\GameProjects2\\HaxeStuff\\HaxeFlixel\\Project-FTS-main\\assets\\data\\optionsData.txt';
		if (FileSystem.exists(dir))
		{
			var fileContents = File.getContent(dir);
	
			if (fileContents.indexOf("Music 1") != -1)
			{
				if (FlxG.sound.music == null)
				{
					FlxG.sound.playMusic(AssetPaths.five_times_shitting__ogg);
				}
			}
			else if (fileContents.indexOf("Music 2") != -1)
			{
				if (FlxG.sound.music == null)
				{
					FlxG.sound.playMusic(AssetPaths.five_times_shitting2__ogg);
				}
			}
			else if (fileContents.indexOf("Static") != -1)
			{
				if (FlxG.sound.music == null)
				{
					FlxG.sound.playMusic(AssetPaths.bgNoise__ogg);
				}
			}
			else
			{
				trace("SETTINGS NOT APPLIED YET");
			}
		}
		else
		{
			trace("File does not exist.");
		}

		//Makes the star appear in the bottom right when you leave the game
		var dir2 = 'C:\\Users\\ehard\\OneDrive\\Desktop\\GameProjects2\\HaxeStuff\\HaxeFlixel\\Project-FTS-main\\assets\\data\\win.txt';
		if (FileSystem.exists(dir))
		{
			var fileContents = File.getContent(dir);
	
			if (fileContents.indexOf("WonGame") != -1)
			{
				addStar();
			}
		}
		else
		{
			trace("File does not exist.");
		}
		#end
	}

	function addStar() 
	{
		add(starComplete);
	}
}
