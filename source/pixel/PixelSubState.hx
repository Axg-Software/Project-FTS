package pixel;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
#if sys
import sys.FileSystem;
import sys.io.File;
#end

class PixelSubState extends FlxSubState
{
    var plrFrd:FlxSprite;
    var chest:FlxSprite;
    var ghost:FlxSprite = new FlxSprite(600, 100, AssetPaths.ghost__png);
    var bg:FlxSprite = new FlxSprite(0, 0, AssetPaths.bgwoodPXL__png);

    //balloons
    var balloons:FlxSprite;
    var balloons2:FlxSprite;
    var balloons3:FlxSprite;
    var balloons4:FlxSprite;
    var balloons5:FlxSprite;
    var balloons6:FlxSprite;
    var balloons7:FlxSprite;
    var balloons8:FlxSprite;
    var balloons9:FlxSprite;
    var balloons10:FlxSprite;
    var balloons11:FlxSprite;
    var balloons12:FlxSprite;

    var ghostMove:Bool = false;

    public function new()
    {
        super(0x33000000);
    }
    
    override function create() 
    {
        super.create();
        add(bg);

        chest = new Chest();
        chest.x = 600;
        chest.y = 100;
        add(chest);

        plrFrd = new PixelFrd();
        plrFrd.x = 600;
        plrFrd.y = 350;

        balloons = new Ballons(0 ,0);
        balloons2 = new Ballons(128, 256);
        balloons3 = new Ballons(300, 64);
        balloons4 = new Ballons(64, 300);
        balloons5 = new Ballons(100, 64);
        balloons6 = new Ballons(400, 80);
        balloons7 = new Ballons(600 ,0);
        balloons8 = new Ballons(700, 300);
        balloons9 = new Ballons(740, 160);
        balloons10 = new Ballons(840, 250);
        balloons11 = new Ballons(640, 45);
        balloons12 = new Ballons(100, 80);
        add(balloons);
        add(balloons2);
        add(balloons3);
        add(balloons4);
        add(balloons5);
        add(balloons6);
        add(balloons7);
        add(balloons8);
        add(balloons9);
        add(balloons10);
        add(balloons11);
        add(balloons12);
        add(plrFrd);
    }

    override function update(elapsed:Float) 
    {
        super.update(elapsed);

        if (FlxG.mouse.overlaps(chest) && FlxG.mouse.justPressed)
        {
            chest.animation.play("pos2", true, false, 2);
            ghostMoveF();
            #if sys
		    var dir = 'assets\\data\\miniGame.axh';
		    File.write(dir, false);

		    var options:haxe.ds.List<String> = new List<String>();
		    options.add("beatMiniGame");

		    var output;

		    for (i in options)
		    {
		    	output = File.append(dir, false);
		    	output.writeString(i + "\n");
	    		output.close();
		    }

		    if (FileSystem.exists(dir))
		    {
		    	var fileContents = File.getContent(dir);

		    	if (fileContents.indexOf("beatMiniGame") != -1)
		    	{
		    		trace("The file contains 'Example'.");
		    	}
		    }
		    #end
        }

        if (ghostMove == true)
        {
            if (ghost.y >= 0)
            {
               ghost.y = ghost.y - 1;
            }
            if (ghost.y <= 0)
            {
                close();
            }
        }
    }

    public function ghostMoveF() 
    {
        add(ghost);
        ghostMove = true;
    }
}