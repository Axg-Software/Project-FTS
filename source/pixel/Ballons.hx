package pixel;

import flixel.FlxSprite;

class Ballons extends FlxSprite
{
    public function new(x, y) 
    {
        super(x, y);
        this.loadGraphic(AssetPaths.ballons__png, true, 64, 64);
        this.animation.add("pos1", [0, 1], 1, true);
    }

    override public function update(elapsed:Float) 
    {
        super.update(elapsed);
        this.animation.play("pos1", true, false);
    }
}