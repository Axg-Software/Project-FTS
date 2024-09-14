package;

import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.sound.FlxSound;
import flixel.util.FlxColor;
import handlers.DiscordHandler;
#if sys
import sys.FileSystem;
import sys.io.File;
#end

class MainMenu extends FlxState
{
	var selected:String = "start";

	var menuBg:FlxSprite = new FlxSprite(0, 0, AssetPaths.blackStatic__png);

	var startButton:FlxText = new FlxText(0, 193, FlxG.width, "New game", 64);  // 75 is the difference between all of them
	var creditsButton:FlxText = new FlxText(0, 260, FlxG.width, "Credits", 64); // THANK U PAST ETHAN ^^^^
	var optionsButton:FlxText = new FlxText(0, 335, FlxG.width, "Options", 64);
	var customNightButton:FlxText = new FlxText(0, 405, FlxG.width, "Custom Night");
	var title:FlxText = new FlxText(0, 0, FlxG.width, "Project: FTS", 72);

	var camSound:FlxSound;

	var versionNumber:FlxText = new FlxText(0,0,FlxG.width, "v1.4", 32);

	var musicSelect:Int = 0;

	var starComplete:FlxSprite = new FlxSprite(1216, 656, AssetPaths.starComplete__png);
	var starMiniGame:FlxSprite = new FlxSprite(1152, 656, AssetPaths.starComplete__png);

	override public function create()
	{
		super.create();

		DiscordHandler.init();

		FlxG.camera.fade(FlxColor.BLACK, 1, true, null, false);

		camSound = FlxG.sound.load(AssetPaths.cameraOpen__ogg);

		FlxG.mouse.useSystemCursor = true;

		versionNumber.setFormat(AssetPaths.digital_7__ttf, 29, FlxColor.WHITE, FlxTextAlign.RIGHT);
		optionsButton.setFormat(AssetPaths.digital_7__ttf, 64, FlxColor.WHITE, FlxTextAlign.LEFT);
		startButton.setFormat(AssetPaths.digital_7__ttf, 64, FlxColor.WHITE, FlxTextAlign.LEFT);
		creditsButton.setFormat(AssetPaths.digital_7__ttf, 64, FlxColor.WHITE, FlxTextAlign.LEFT);
		customNightButton.setFormat(AssetPaths.digital_7__ttf, 64, FlxColor.WHITE, FlxTextAlign.LEFT);
		title.setFormat(AssetPaths.digital_7__ttf, 128, FlxColor.WHITE, FlxTextAlign.LEFT);

		add(menuBg);
		add(startButton);
		add(creditsButton);
		add(versionNumber);
		add(optionsButton);
		add(title);
	}

	override public function update(elapsed:Float)
	{

		if (FlxG.mouse.overlaps(startButton) && FlxG.mouse.justPressed)
		{
			camSound.play();
			FlxG.switchState(new TransitionState());
		}
		else if (FlxG.mouse.overlaps(creditsButton) && FlxG.mouse.justPressed)
		{
			camSound.play();
			FlxG.switchState(new CreditState());
		}
		else if (FlxG.mouse.overlaps(optionsButton) && FlxG.mouse.justPressed)
		{
			camSound.play();
			FlxG.switchState(new OptionsState());
		}
		else if (FlxG.mouse.overlaps(customNightButton) && FlxG.mouse.justPressed)
		{
			camSound.play();
			FlxG.switchState(new CustomNightState());
		}

		//Options for music
		#if sys
		var dir = 'assets\\data\\optionsData.axh';
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

		//Makes the star appear in the bottom right when you leave the game
		var dir2 = 'assets\\data\\win.axh';
		if (FileSystem.exists(dir2))
		{
			var fileContents = File.getContent(dir2);
	
			if (fileContents.indexOf("WonGame") != -1)
			{
				addStar();
			}
		}
		//Makes the star appear in the bottom right when you leave the game
		var dir3 = 'assets\\data\\miniGame.axh';
		if (FileSystem.exists(dir3))
		{
			var fileContents = File.getContent(dir3);
			
			if (fileContents.indexOf("beatMiniGame") != -1)
			{
				addStar2();
			}
		}

		// Change text of new game button
		var dir4 = 'assets\\data\\gameCreated.axh';
		if (FileSystem.exists(dir4))
		{
			var fileContents = File.getContent(dir4);
			
			if (fileContents.indexOf("Game_Created") != -1)
			{
				changeButtonName();
			}
		}
		#end
	}

	function addStar() 
	{
		add(starComplete);
		add(customNightButton);
	}

	function addStar2() 
	{
		add(starMiniGame);
	}

	function changeButtonName() 
	{
		startButton.text = "Continue";
	}
}
