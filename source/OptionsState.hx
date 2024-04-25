//THIS WAS SCRAPED FOR V1.1!!! THIS WILL MOST LIKELY BE  IN V1.2!!!

package;

import flixel.util.FlxSave;
import flixel.sound.FlxSound;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.FlxState;

class OptionsState extends FlxState{

    var musicOption:FlxText = new FlxText(0,0,FlxG.width, "What type of music?");
    var musicOptionDsc:FlxText = new FlxText(0,64, FlxG.width, "Music 1");
    var backToMenu:FlxText = new FlxText(0, 632,FlxG.width, "Back to menu", 64);
    var applyButton:FlxText = new FlxText(0, 504, FlxG.width, "Apply", 64);
    
    var camSound:FlxSound;

    public var musicOptionDscSLC:Int = 0;

    override function create() {
        super.create();

        musicOption.setFormat(AssetPaths.digital_7__ttf, 64, FlxColor.WHITE, FlxTextAlign.LEFT);
        musicOptionDsc.setFormat(AssetPaths.digital_7__ttf, 32, FlxColor.WHITE, FlxTextAlign.LEFT);
        add(musicOption);
        add(musicOptionDsc);

        backToMenu.setFormat(AssetPaths.digital_7__ttf, 64, FlxColor.WHITE, FlxTextAlign.LEFT);
        applyButton.setFormat(AssetPaths.digital_7__ttf, 64, FlxColor.WHITE, FlxTextAlign.LEFT);

        add(backToMenu);
        add(applyButton);

        camSound = FlxG.sound.load(AssetPaths.cameraOpen__ogg);
    }

    override function update(elapsed:Float) {
        super.update(elapsed);
        if (FlxG.mouse.overlaps(backToMenu) && FlxG.mouse.justPressed)
        {
            camSound.play();
            FlxG.switchState(new MainMenu());
            
        }

        if (FlxG.mouse.overlaps(musicOptionDsc) && FlxG.mouse.justPressed)
        {
            camSound.play();
            musicOptionDscSLC = musicOptionDscSLC + 1;
        }

        if (FlxG.mouse.overlaps(applyButton) && FlxG.mouse.justPressed)
        {
            applySettings();
        }

        switch musicOptionDscSLC
        {
            case 0:
                musicOptionDsc.text = "Music 1";
            case 1:
                musicOptionDsc.text = "Music 2";
            case 2:
                musicOptionDsc.text = "Static";
        }

        if (musicOptionDscSLC > 2)
        {
            musicOptionDscSLC = 0;
        }
    }

    public function applySettings() 
    {
        var optionSetting = new FlxSave();
        if (optionSetting.bind("optionSaveData") && musicOptionDsc.text == "Music 1")
        {
            optionSetting.bind("Music1");
        }
    }
}