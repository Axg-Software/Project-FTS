package;

import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.sound.FlxSound;

class CustomNightState extends FlxState
{

    var bg:FlxSprite = new FlxSprite(0,0,AssetPaths.bg__png);

    var fLeft:FlxSprite = new FlxSprite(77,409, AssetPaths.left__png);
    var fRight:FlxSprite = new FlxSprite(256,409, AssetPaths.right__png);

    var bLeft:FlxSprite = new FlxSprite(385, 409, AssetPaths.left__png);
    var bRight:FlxSprite = new FlxSprite(553, 409, AssetPaths.right__png);

    var f2Left:FlxSprite = new FlxSprite(687, 409, AssetPaths.left__png);
    var f2Right:FlxSprite = new FlxSprite(855, 409, AssetPaths.right__png);

    var cLeft:FlxSprite = new FlxSprite(990, 409, AssetPaths.left__png);
    var cRight:FlxSprite = new FlxSprite(1159, 409, AssetPaths.right__png);

    var fNum:Int = 0;
    var bNum:Int = 0;
    var f2Num:Int = 0;
    var cNum:Int = 0;

    var fNumText:FlxText = new FlxText(140, 391, FlxG.width);
    var bNumText:FlxText = new FlxText(447, 391, FlxG.width);
    var f2NumText:FlxText = new FlxText(749, 391, FlxG.width);
    var cNumText:FlxText = new FlxText(1053, 391, FlxG.width);

    var doneText:FlxText = new FlxText(0, 0, FlxG.width, "Start", 72);

    var fade:FlxSprite = new FlxSprite(0, 0, AssetPaths.fade2__png);

    var camSound:FlxSound;

    override function create() 
    {
        super.create();

        FlxG.camera.fade(FlxColor.BLACK, 1, true, null, false);

        add(bg);
        add(fade);

        fNumText.text = Std.string(fNum);
        bNumText.text = Std.string(bNum);
        f2NumText.text = Std.string(f2Num);
        cNumText.text = Std.string(cNum);

        camSound = FlxG.sound.load(AssetPaths.cameraOpen__ogg);

        fNumText.setFormat(AssetPaths.digital_7__ttf, 77, FlxColor.WHITE);
        bNumText.setFormat(AssetPaths.digital_7__ttf, 77, FlxColor.WHITE);
        f2NumText.setFormat(AssetPaths.digital_7__ttf, 77, FlxColor.WHITE);
        cNumText.setFormat(AssetPaths.digital_7__ttf, 77, FlxColor.WHITE);

        doneText.setFormat(AssetPaths.digital_7__ttf, 77, FlxColor.WHITE, FlxTextAlign.LEFT);

        //Add arrows
        add(fLeft);
        add(fRight);
        add(bLeft);
        add(bRight);
        add(f2Left);
        add(f2Right);
        add(cLeft);
        add(cRight);
        
        //Add text
        add(fNumText);
        add(bNumText);
        add(f2NumText);
        add(cNumText);
        add(doneText);
    }
    
    override function update(elapsed:Float) 
    {
        super.update(elapsed);

        fNumText.text = Std.string(fNum);
        bNumText.text = Std.string(bNum);
        f2NumText.text = Std.string(f2Num);
        cNumText.text = Std.string(cNum);

        if (FlxG.keys.justPressed.BACKSPACE)
        {
            FlxG.switchState(new MainMenu());
        }

        if (FlxG.mouse.overlaps(fLeft) && FlxG.mouse.justPressed)
        {
            fNum = fNum - 1;
            camSound.play();
        }
        else if (FlxG.mouse.overlaps(fRight) && FlxG.mouse.justPressed)
        {
            fNum = fNum + 1;
            camSound.play();
        }

        if (fNum >= 20)
        {
            fNum = 20;
        }
        else if (fNum <= 0)
        {
            fNum = 0;
        }

        // Bonnie select
        if (FlxG.mouse.overlaps(bLeft) && FlxG.mouse.justPressed)
        {
            bNum = bNum - 1;
            camSound.play();
        }
        else if (FlxG.mouse.overlaps(bRight) && FlxG.mouse.justPressed)
        {
            bNum = bNum + 1;
            camSound.play();
        }
    
        if (bNum >= 20)
        {
            bNum = 20;
        }
        else if (bNum <= 0)
        {
            bNum = 0;
        }

        // Foxy Select
        if (FlxG.mouse.overlaps(f2Left) && FlxG.mouse.justPressed)
        {
            f2Num = f2Num - 1;
            camSound.play();
        }
        else if (FlxG.mouse.overlaps(f2Right) && FlxG.mouse.justPressed)
        {
            f2Num = f2Num + 1;
            camSound.play();
        }
                
        if (f2Num >= 20)
        {
            f2Num = 20;
        }
        else if (f2Num <= 0)
        {
            f2Num = 0;
        }

        // Cupcake Select
        if (FlxG.mouse.overlaps(cLeft) && FlxG.mouse.justPressed)
        {
            cNum = cNum - 1;
            camSound.play();
        }
        else if (FlxG.mouse.overlaps(cRight) && FlxG.mouse.justPressed)
        {
            cNum = cNum + 1;
            camSound.play();
        }
                            
        if (cNum >= 20)
        {
            cNum = 20;
        }
        else if (cNum <= 0)
        {
            cNum = 0;
        }

        // Start the game
        if (FlxG.mouse.overlaps(doneText))
        {
            doneText.color = FlxColor.GRAY;
            if (FlxG.mouse.justPressed)
            {
                FlxG.switchState(new PlayState());
            }
        }
        else
        {
            doneText.color = FlxColor.WHITE;
        }
    }
}