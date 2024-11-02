package;

import flixel.sound.FlxSound;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class EndNoteState extends FlxState
{

    var bg:FlxSprite = new FlxSprite(0, -14, AssetPaths.bgEND__png);
    var note:FlxSprite = new FlxSprite(325, 150, AssetPaths.noteEND__png);
    var light:FlxSprite = new FlxSprite(250, -10, AssetPaths.lightEND__png);

    var camSound:FlxSound;

    override function create() 
    {
        super.create();
        FlxG.sound.playMusic(AssetPaths.bgNoise__ogg);
        camSound = FlxG.sound.load(AssetPaths.cameraOpen__ogg);
        
        add(bg);
        add(note);
        add(light);
    }

    override function update(elapsed:Float) 
    {
        super.update(elapsed);
        FlxG.sound.playMusic(AssetPaths.bgNoise__ogg);

        if (FlxG.mouse.overlaps(light) && FlxG.mouse.justPressed)
        {
            camSound.play();
            openSubState(new ReadEndNoteSubstate());
        }
    }
}