package;

import flixel.sound.FlxSound;
import lime.system.System;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.FlxSprite;
import flixel.FlxSubState;

class ReadEndNoteSubstate extends FlxSubState
{

    var bg:FlxSprite = new FlxSprite(0, -14, AssetPaths.bgEND__png);
    var note:FlxSprite = new FlxSprite(82, 50, AssetPaths.noteENDN__png);
    var light:FlxSprite = new FlxSprite(465, -20, AssetPaths.lightENDN__png);

    var doneButton:FlxText = new FlxText(0, 0, FlxG.width, "DONE", 32);

    var camSound:FlxSound;

    public function new() 
    {
        super(0xFFFFFFFF);
    }
    
    override function create() 
    {
        super.create();
        camSound = FlxG.sound.load(AssetPaths.cameraOpen__ogg);
        doneButton.setFormat(AssetPaths.digital_7__ttf, 32, FlxColor.WHITE, FlxTextAlign.LEFT);

        add(bg);
        add(note);
        add(light);
        add(doneButton);
    }

    override function update(elapsed:Float) 
    {
        super.update(elapsed);
        FlxG.sound.playMusic(AssetPaths.bgNoise__ogg);

        if (FlxG.mouse.overlaps(doneButton) && FlxG.mouse.justPressed)
        {
            camSound.play();
            System.exit(1551918);
            // 2? ^^
        }
    }
}