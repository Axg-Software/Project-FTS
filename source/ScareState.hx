// lowkey hxCodec and hxvlc are hard as shit to import into this project so fuck that
package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import haxe.Timer;
import flixel.sound.FlxSound;


class ScareState extends FlxState
{
    private var whosScared:Int;

    var office:FlxSprite = new FlxSprite(0, 0, AssetPaths.officeFull__png);

    var scarePNG1:FlxSprite = new FlxSprite(460, 200, AssetPaths.cupcake__png);
    var scarePNG2:FlxSprite = new FlxSprite(480, 190, AssetPaths.freddy__png);
    var scarePNG3:FlxSprite = new FlxSprite(480, 190, AssetPaths.foxy__png);
    var scarePNG4:FlxSprite = new FlxSprite(480, 190, AssetPaths.bonnie__png);

    var jumpscareSound:FlxSound;

    public function new(scared:Int)
    {
        super();
        whosScared = scared;
    }

    override function create() 
    {
        super.create();

        jumpscareSound = FlxG.sound.load(AssetPaths.jumpScare__ogg);
        jumpscareSound.play();

        add(office);
    }

    override function update(elapsed:Float) 
    {
        super.update(elapsed);

        switch whosScared
        {
            case 1:
                add(scarePNG1);
            case 2:
                add(scarePNG2);
            case 3:
                add(scarePNG3);
            case 4:
                add(scarePNG4);     
        }

        wait(4000, goToEndState);
    }

    function wait(milliseconds:Int, callback:Void->Void):Void
    {
        Timer.delay(callback, milliseconds);
    }

    function goToEndState() 
    {
        FlxG.switchState(new EndState());
    }
}