package eightbit;

import flixel.FlxG;
import flixel.FlxSprite;

class EightBitFreddy extends FlxSprite
{
    public var dir:Bool = false;

    public function new() 
    {
        super();
        this.loadGraphic(AssetPaths.eightbit_freddy__png, true, 240, 208);
        this.animation.add("Idle", [0], 1, true, false);
        this.animation.add("Walk", [0, 1], 2, true, false);
    }

    override function update(elapsed:Float)
    {
        super.update(elapsed);

        var moving = false;

        if (FlxG.keys.pressed.W || FlxG.keys.pressed.UP)
        {
            this.y -= 4;
            moving = true;
        }
        if (FlxG.keys.pressed.S || FlxG.keys.pressed.DOWN)
        {
            this.y += 4;
            moving = true;
        }
        if (FlxG.keys.pressed.A || FlxG.keys.pressed.LEFT)
        {
            dir = true;
            this.x -= 4;
            this.flipX = true;
            moving = true;
        }
        if (FlxG.keys.pressed.D || FlxG.keys.pressed.RIGHT)
        {
            dir = false;
            this.x += 4;
            this.flipX = false;
            moving = true;
        }

        if (moving)
            this.animation.play("Walk");
        else
            this.animation.play("Idle");
    }
}