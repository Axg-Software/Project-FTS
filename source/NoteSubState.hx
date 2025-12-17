package;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.FlxSubState;

class NoteSubState extends FlxSubState
{

    var textPart:Int = 1;
    var text:FlxText = new FlxText(0, 0, FlxG.width, "Hello? Hello?! Hey umm, welcome to your first job as the night guard for the Shitty ass bathroom next to your room.\n
    Now theres a few 'Animatronics' you need to look out for. So I'm going to show you the ropes, and how to make them not attack you!\n
    First is Cupcake, you will find him in the bathroom to your left. and to make him Not go towards you at night.\n
    You will need to either: look at him while hes still in the bathroom, or to look at cameras. Simple!\n
    Next is Foxy. To stop him from going towards you at night you need to: Open the shower curtain and make him go all the way down.\n
    Next is Bonnie, you need to turn the water on when you hear a noise in the bathroom! Then turn it off after.");
    var text2:FlxText =  new FlxText(0, 0, FlxG.width, "And finally is Freddy. When you hear a knocking sound in your left ear you need to turn off the lights.\n
    And when you feel its safe, you need to turn on the lights again and check to see if hes there. And if he isnt you're chillin'!\n
    And if he is, just repeat until he isn't anymore!\n
    Also another way you could get rid of him is to press the 'Reset Freddy Position' button in the cameras but that takes away 5 power.\n
    So you are now all caught up on how not to have the ki-, 'Animatronics' to not get into your bathroom!\n
    Umm Bye!");

    public function new()
    {
        super(0xFFFFFFFF);
    }
    
    override function create() 
    {
        super.create();
        text.setFormat(AssetPaths.digital_7__ttf, 32, FlxColor.BLACK, FlxTextAlign.CENTER);
        text2.setFormat(AssetPaths.digital_7__ttf, 32, FlxColor.BLACK, FlxTextAlign.CENTER);
    }

    override function update(elapsed:Float) 
    {
        super.update(elapsed);
        if (FlxG.mouse.justPressed || FlxG.keys.justPressed.BACKSPACE)
        {
            close();
        }

        if (FlxG.keys.justPressed.D || FlxG.keys.justPressed.RIGHT)
        {
            textPart = textPart + 1;
        }
        else if (FlxG.keys.justPressed.A || FlxG.keys.justPressed.LEFT)
        {
            textPart = textPart - 1;
        }

        if (textPart < 1)
        {
            textPart = 1;
        }
        else if (textPart > 2)
        {
            textPart = 2;
        }

        switch textPart
        {
            case 1:
                remove(text2);
                add(text);
            case 2:
                remove(text);
                add(text2);
        }
    }
}