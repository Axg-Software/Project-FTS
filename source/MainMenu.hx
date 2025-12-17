package;

import eightbit.EightbitGameState;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.sound.FlxSound;
import flixel.util.FlxColor;
import handlers.DiscordHandler;

class MainMenu extends FlxState
{
	var selected:String = "start";

	var menuBg:FlxSprite = new FlxSprite(0, 0, AssetPaths.blackStatic__png);
	var menuAnimatronics:FlxSprite = new FlxSprite(7, 556, AssetPaths.menuAnimatronics__png);
	var fade:FlxSprite = new FlxSprite(0, 0, AssetPaths.fade2__png);

	var startButton:FlxText = new FlxText(0, 193, FlxG.width, "New game", 64);  // 75 is the difference between all of them
	var creditsButton:FlxText = new FlxText(0, 260, FlxG.width, "Credits", 64); // THANK U PAST ETHAN ^^^^
	var optionsButton:FlxText = new FlxText(0, 335, FlxG.width, "Options", 64);
	var customNightButton:FlxText = new FlxText(0, 405, FlxG.width, "Custom Night");
	var title:FlxText = new FlxText(0, 0, FlxG.width, "Project: FTS", 72);

	var camSound:FlxSound;

	var versionNumber:FlxText = new FlxText(0,0,FlxG.width, "v1.6", 32);

	var musicSelect:Int = 0;

	var starComplete:FlxSprite = new FlxSprite(1216, 656, AssetPaths.starComplete__png);
	var starMiniGame:FlxSprite = new FlxSprite(1152, 656, AssetPaths.starComplete__png);

	override public function create()
	{
		super.create();

		if (FlxG.save.data.musicOptionDsc == null)
		{
			if (FlxG.sound.music == null)
			{
				FlxG.sound.playMusic(AssetPaths.five_times_shitting__ogg);
			}
		}

		if (FlxG.save.data.wonGame == null)
		{
			FlxG.save.data.wonGame = "False";
		}

		if (FlxG.save.data.beatMiniGame == null) // remove all of the flushes and only have one at the end of these if statements __TODO__
		{
			FlxG.save.data.beatMiniGame = "False";
		}

		if (FlxG.save.data.gameCreated == null)
		{
			FlxG.save.data.gameCreated = "False";
		}
		FlxG.save.flush();

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
		//add(menuAnimatronics);
		add(fade);
		add(startButton);
		add(creditsButton);
		add(versionNumber);
		add(optionsButton);
		add(title);
	}

	override public function update(elapsed:Float)
	{
		if (FlxG.mouse.overlaps(startButton))
		{
			startButton.color = FlxColor.GRAY;
			if (FlxG.mouse.justPressed)
			{
				camSound.play();
				FlxG.switchState(new TransitionState());
			}
		}
		else
		{
			startButton.color = FlxColor.WHITE;
		}

		if (FlxG.mouse.overlaps(creditsButton))
		{
			creditsButton.color = FlxColor.GRAY;
			if (FlxG.mouse.justPressed)
			{
				camSound.play();
				FlxG.switchState(new CreditState());
			}
		}
		else
		{
			creditsButton.color = FlxColor.WHITE;
		}

		if (FlxG.mouse.overlaps(optionsButton))
		{
			optionsButton.color = FlxColor.GRAY;
			if (FlxG.mouse.justPressed)
			{
				camSound.play();
				FlxG.switchState(new OptionsState());
			}
		}
		else
		{
			optionsButton.color = FlxColor.WHITE;
		}

		if (FlxG.mouse.overlaps(customNightButton) && FlxG.save.data.wonGame == "WonGame")
		{
			customNightButton.color = FlxColor.GRAY;
			if (FlxG.mouse.justPressed)
			{
				camSound.play();
				FlxG.switchState(new CustomNightState());
			}
		}
		else
		{
			customNightButton.color = FlxColor.WHITE;
		}

		// -------------------------------------------------------------------------

		if (FlxG.save.data.musicOptionDsc == "Music 1")
		{
			if (FlxG.sound.music == null)
			{
				FlxG.sound.playMusic(AssetPaths.five_times_shitting__ogg);
			}
		}
		else if (FlxG.save.data.musicOptionDsc == "Music 2")
		{
			if (FlxG.sound.music == null)
			{
				FlxG.sound.playMusic(AssetPaths.five_times_shitting2__ogg);
			}
		}
		else if (FlxG.save.data.musicOptionDsc == "Static")
		{
			if (FlxG.sound.music == null)
			{
				FlxG.sound.playMusic(AssetPaths.bgNoise__ogg);
			}
		}

		// -------------------------------------------------------------------------

		if (FlxG.save.data.wonGame == "WonGame")
		{
			add(starComplete);
			add(customNightButton);
		}

		// -------------------------------------------------------------------------

		if (FlxG.save.data.beatMiniGame == "beatMiniGame")
		{
			add(starMiniGame);
		}

		// -------------------------------------------------------------------------

		if (FlxG.save.data.gameCreated == "Game_Created")
		{
			startButton.text = "Continue";
		}
	}
}
