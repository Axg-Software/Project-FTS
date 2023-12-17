package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;

class EndState extends FlxState
{
	var endImage:FlxSprite = new FlxSprite(0, 0, AssetPaths.lose__png);
	var retryButton:FlxSprite = new FlxSprite(410, 358, AssetPaths.retryButton__png);
	var going:Bool = true;
	var cursor:FlxSprite;

	var cursorX:Float = FlxG.mouse.x;
	var cursorY:Float = FlxG.mouse.y;

	override public function create()
	{
		super.create();
		cursor = new FlxSprite(cursorX, cursorY);
		cursor.origin.x = cursor.width / 2;
		cursor.origin.y = cursor.height / 2;
		cursor.makeGraphic(1, 1, FlxColor.BLACK);
		cursor.alpha = 1;
		FlxG.mouse.useSystemCursor = true;
		add(endImage);
		add(retryButton);
		add(cursor);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (going)
		{
			FlxG.camera.fade(FlxColor.BLACK, 4, true, onComplete, false);
		}

		if (FlxG.mouse.justPressed)
		{
			FlxG.switchState(new MainMenu());
		}
	}

	function onComplete()
	{
		going = false;
	}
}
