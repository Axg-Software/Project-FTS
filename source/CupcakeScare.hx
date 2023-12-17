package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.util.FlxColor;

class CupcakeScare extends FlxState
{
	var cupcakeVid:FlxVideoCupcake;

	override public function create()
	{
		super.create();
		cupcakeVid = new FlxVideoCupcake({source: 'assets/images/videos/cupcakeJumpscare.mp4'});
		cupcakeVid.finishCallback = () -> onFinish();
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
		cupcakeVid.play();
	}
}
