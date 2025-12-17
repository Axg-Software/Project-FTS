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
	
	override public function create()
	{
		super.create();

		add(endImage);
		add(retryButton);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (going)
		{
			FlxG.camera.fade(FlxColor.BLACK, 4, true, onComplete, false);
		}

		if (FlxG.mouse.overlaps(retryButton))
		{
			retryButton.color = FlxColor.GRAY;
			if (FlxG.mouse.justPressed)
			{
				FlxG.switchState(new MainMenu());
			}
		}
		else
		{
			retryButton.color = FlxColor.WHITE;
		}
	}

	function onComplete()
	{
		going = false;
	}
}
