package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.FlxSound;
import flixel.util.FlxColor;

class MainMenu extends FlxState
{
	var selected:String = "start";

	var menuBg:FlxSprite = new FlxSprite(0, 0, AssetPaths.menuBg__png);
	var startButton:FlxSprite = new FlxSprite(0, 393, AssetPaths.newGame__png);
	var creditsButton:FlxSprite = new FlxSprite(47, 533, AssetPaths.credits__png);
	var cursor:FlxSprite;

	var cursorX:Float = FlxG.mouse.x;
	var cursorY:Float = FlxG.mouse.y;
	var camSound:FlxSound;
	var going:Bool = true;

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
		add(menuBg);
		add(startButton);
		add(creditsButton);
		add(cursor);
		FlxG.sound.playMusic(AssetPaths.bgNoise__ogg, 1, true);
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
	}
}
