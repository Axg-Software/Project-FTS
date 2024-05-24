package pixel;

import flixel.FlxG;
import flixel.FlxSprite;

class PixelFrd extends FlxSprite
{
    public function new()
    {
        super();
        this.loadGraphic(AssetPaths.frdSheet__png, true, 64, 64);
        this.animation.add("down", [0, 1], 1, true);
        this.animation.add("up", [2, 3], 1, true);
    }    

    override public function update(elapsed:Float) 
    {
        super.update(elapsed);

        if (FlxG.keys.pressed.W || FlxG.keys.pressed.UP)
        {
            this.y = this.y - 4;
            this.animation.play("up", true, false);
            
        }
        if (FlxG.keys.pressed.S || FlxG.keys.pressed.DOWN)
        {
            this.y = this.y + 4;
            this.animation.play("down", true, false);
        }
        if (FlxG.keys.pressed.A || FlxG.keys.pressed.LEFT)
        {
            this.x = this.x - 4;
        }
        if (FlxG.keys.pressed.D || FlxG.keys.pressed.RIGHT)
        {
            this.x = this.x + 4;
        }
    }
}