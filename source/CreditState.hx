package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.FlxSound;
import flixel.util.FlxColor;

class CreditState extends FlxState
{
	var menuBG:FlxSprite = new FlxSprite(0, 0, AssetPaths.creditsMenu__png);
	var backToMenu:FlxSprite = new FlxSprite(0, 632, AssetPaths.backToMenu__png);
	var cursor:FlxSprite;

	var cursorX:Float = FlxG.mouse.x;
	var cursorY:Float = FlxG.mouse.y;
	var camSound:FlxSound;

	override public function create()
	{
		super.create();
		camSound = FlxG.sound.load(AssetPaths.cameraOpen__ogg);
		cursor = new FlxSprite(cursorX, cursorY);
		cursor.origin.x = cursor.width / 2;
		cursor.origin.y = cursor.height / 2;
		cursor.makeGraphic(1, 1, FlxColor.BLACK);
		cursor.alpha = 1;
		FlxG.mouse.useSystemCursor = true;
		add(menuBG);
		add(backToMenu);
		add(cursor);
		FlxG.sound.playMusic(AssetPaths.bgNoise__ogg, 1, true);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.mouse.justPressed)
		{
			camSound.play();
			FlxG.switchState(new MainMenu());
		}
	}
}
