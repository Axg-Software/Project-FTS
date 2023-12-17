package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.util.FlxColor;

class FreddyScare extends FlxState
{
	var freddyVid:FlxVideoCupcake;

	override public function create()
	{
		super.create();
		freddyVid = new FlxVideoCupcake({source: 'assets/images/videos/frdJumpscare.mp4'});
		freddyVid.finishCallback = () -> onFinish();
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
		freddyVid.playFreddy();
	}
}
