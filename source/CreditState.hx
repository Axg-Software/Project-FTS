package;

import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.sound.FlxSound;
import flixel.util.FlxColor;

class CreditState extends FlxState
{
	//var menuBG:FlxSprite = new FlxSprite(0, 0, AssetPaths.creditsMenu__png);
	var backToMenu:FlxText = new FlxText(0, 632,FlxG.width, "Back to menu", 64);
	var cursor:FlxSprite;

	var cursorX:Float = FlxG.mouse.x;
	var cursorY:Float = FlxG.mouse.y;

	var camSound:FlxSound;

	var credits:FlxText = new FlxText(0,0,FlxG.width, "Deep_Fried_Bread: Coding, Art, Ideas\nExtend: Ideas\nSamiCLN: playtesting, music\nKaanCLN: playtesting", 32);

	var background:FlxSprite = new FlxSprite(0,0,AssetPaths.blackStatic__png);

	override public function create()
	{
		super.create();

		FlxG.camera.fade(FlxColor.BLACK, 1, true, null, false);

		//Cam sound
		camSound = FlxG.sound.load(AssetPaths.cameraOpen__ogg);
		
		//cursor
		cursor = new FlxSprite(cursorX, cursorY);
		cursor.origin.x = cursor.width / 2;
		cursor.origin.y = cursor.height / 2;
		cursor.makeGraphic(1, 1, FlxColor.BLACK);
		cursor.alpha = 1;
		FlxG.mouse.useSystemCursor = true;

		//Flx Text shit
		credits.setFormat(AssetPaths.digital_7__ttf, 64, FlxColor.WHITE, FlxTextAlign.CENTER);
		backToMenu.setFormat(AssetPaths.digital_7__ttf, 64, FlxColor.WHITE, FlxTextAlign.LEFT);

		//add(menuBG);
		add(background);
		add(backToMenu);
		add(credits);
		add(cursor);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.mouse.overlaps(backToMenu) && FlxG.mouse.justPressed)
		{
			camSound.play();
			FlxG.switchState(new MainMenu());
		}
	}
}
