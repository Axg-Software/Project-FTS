package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.util.FlxColor;

class FoxyScare extends FlxState
{
	var foxyVid:FlxVideoCupcake;

	override public function create()
	{
		super.create();
		foxyVid = new FlxVideoCupcake({source: 'assets/images/videos/foxyJumpscare.mp4'});
		foxyVid.finishCallback = () -> onFinish();
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
		foxyVid.playFoxy();
	}
}
