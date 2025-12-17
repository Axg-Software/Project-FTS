package eightbit;

import flixel.FlxSprite;

class EightBitPizzaPROP extends FlxSprite
{
    public function new(x, y) 
    {
        super(x, y);

        this.loadGraphic(AssetPaths.eightbit_pizza__png, true, 86, 88);
        this.animation.add("Idle", [0], 1, true);
        this.animation.add("ThrowingPU", [0, 1], 2, true);
    }

    override function update(elapsed:Float) 
    {
        super.update(elapsed);

        this.animation.play("ThrowingPU");
    }
}