package eightbit;

import flixel.FlxSprite;

class EightBitPizza extends FlxSprite
{
    public function new() 
    {
        super();
        this.loadGraphic(AssetPaths.eightbit_pizza__png, true, 86, 88);
        this.animation.add("Idle", [0], 1, true);
        this.animation.add("ThrowingPU", [0, 1], 2, true);    
    }    

    override function update(elapsed:Float) 
    {
        super.update(elapsed);
    }
}