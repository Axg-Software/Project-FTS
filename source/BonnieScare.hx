package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.util.FlxColor;

class BonnieScare extends FlxState
{
	var bonnieVid:FlxVideoCupcake;

	override public function create()
	{
		super.create();
		bonnieVid = new FlxVideoCupcake({source: 'assets/images/videos/bonnieJumpscare.mp4'});
		bonnieVid.finishCallback = () -> onFinish();
		FlxG.camera.fade(FlxColor.BLACK, 0.1, false, autoPlay);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.ONE)
		{
			FlxG.switchState(new EndState());
		}
	}

	function onFinish()
	{
		FlxG.switchState(new EndState());
	}

	function autoPlay()
	{
		bonnieVid.playBonnie();
	}
}
