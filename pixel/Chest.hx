package pixel;

import flixel.FlxSprite;

class Chest extends FlxSprite
{
    public function new() 
    {
        super(x, y);
        this.loadGraphic(AssetPaths.chest__png, true, 64, 64);
        this.animation.add("pos1", [0], 1, false);
        this.animation.add("pos2", [1], 1, false);
    }

}