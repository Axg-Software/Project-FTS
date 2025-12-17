package eightbit; // had to scrap this, it was gonna be like the fnaf 6 beginning minigame.

import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import haxe.Timer;

class EightbitGameState extends FlxState
{
    var frdy:EightBitFreddy;

    var pizzaMAX:Bool = false;
    var pizzaAmountTXT:FlxText = new FlxText(0, 0, FlxG.width, null, 32);
    var pizzaAmount:Int = 0;
    var pizzaProp1:EightBitPizzaPROP = new EightBitPizzaPROP(15, 11);
    var pizzaProp2:EightBitPizzaPROP = new EightBitPizzaPROP(113, 11);
    var pizzaProp3:EightBitPizzaPROP = new EightBitPizzaPROP(14, 108);
    var pizzaProp4:EightBitPizzaPROP = new EightBitPizzaPROP(113, 108);
    var pizzaProp5:EightBitPizzaPROP = new EightBitPizzaPROP(14, 212);
    var pizzaProp6:EightBitPizzaPROP = new EightBitPizzaPROP(113, 212);
    var pizzaProp1TAKEN:Bool = false;
    var pizzaProp2TAKEN:Bool = false;
    var pizzaProp3TAKEN:Bool = false;
    var pizzaProp4TAKEN:Bool = false;
    var pizzaProp5TAKEN:Bool = false;
    var pizzaProp6TAKEN:Bool = false;

    override function create() 
    {
        super.create();
        pizzaAmountTXT.setFormat(AssetPaths.digital_7__ttf, 32, FlxColor.WHITE, FlxTextAlign.RIGHT);
        pizzaAmountTXT.text =  "X" + Std.string(pizzaAmount);
        // idea: each second waited a new pizza is regened so if u take all the pizzas you 1st second 1 pizza spawns 6 seconds all pizzas are spawned

        add(pizzaProp1);
        add(pizzaProp2);
        add(pizzaProp3);
        add(pizzaProp4);
        add(pizzaProp5);
        add(pizzaProp6);

        frdy =  new EightBitFreddy();
        frdy.x = -10;
        frdy.y = 505;
        add(frdy);
        add(pizzaAmountTXT);
    }    

    override function update(elapsed:Float) 
    {
        super.update(elapsed);
        pizzaAmountTXT.text = "X" + Std.string(pizzaAmount);

        if (pizzaAmount >= 6)
        {
            pizzaAmount = 6;
            pizzaMAX = true;
        }
        else if (pizzaAmount < 6)
        {
            pizzaMAX = false;
        }
        
        if (pizzaAmount <= 0)
        {
            pizzaAmount = 0;
        }

        if (FlxG.keys.justPressed.SHIFT)
        {
            pizzaAmount = pizzaAmount - 1;
            shootPizza();
        }

        if (FlxG.keys.justPressed.R)
        {
            pizzaProp1TAKEN = false;
            pizzaProp2TAKEN = false;
            pizzaProp3TAKEN = false;
            pizzaProp4TAKEN = false;
            pizzaProp5TAKEN = false;
            pizzaProp6TAKEN = false;
        }

        // im sorry for all these if statements :(
        if (frdy.overlaps(pizzaProp1) && pizzaMAX == false && pizzaProp1TAKEN == false)
        {
            pizzaProp1TAKEN = true;
            pizzaAmount = pizzaAmount + 1;
        }

        if (frdy.overlaps(pizzaProp2) && pizzaMAX == false && pizzaProp2TAKEN == false)
        {
            pizzaProp2TAKEN = true;
            pizzaAmount = pizzaAmount + 1;
        }

        if (frdy.overlaps(pizzaProp3) && pizzaMAX == false && pizzaProp3TAKEN == false)
        {
            pizzaProp3TAKEN = true;
            pizzaAmount = pizzaAmount + 1;
        }

        if (frdy.overlaps(pizzaProp4) && pizzaMAX == false && pizzaProp4TAKEN == false)
        {
            pizzaProp4TAKEN = true;
            pizzaAmount = pizzaAmount + 1;
        }

        if (frdy.overlaps(pizzaProp5) && pizzaMAX == false && pizzaProp5TAKEN == false)
        {
            pizzaProp5TAKEN = true;
            pizzaAmount = pizzaAmount + 1;
        }

        if (frdy.overlaps(pizzaProp6) && pizzaMAX == false && pizzaProp6TAKEN == false)
        {
            pizzaProp6TAKEN = true;
            pizzaAmount = pizzaAmount + 1;
        }

        if (pizzaProp1TAKEN == true)
        {
            remove(pizzaProp1);
        }
        else if (pizzaProp1TAKEN == false)
        {
            add(pizzaProp1);
        }

        if (pizzaProp2TAKEN == true)
        {
            remove(pizzaProp2);
        }
        else if (pizzaProp2TAKEN == false)
        {
            add(pizzaProp2);
        }

        if (pizzaProp3TAKEN == true)
        {
            remove(pizzaProp3);
        }
        else if (pizzaProp3TAKEN == false)
        {
            add(pizzaProp3);
        }

        if (pizzaProp4TAKEN == true)
        {
            remove(pizzaProp4);
        }
        else if (pizzaProp4TAKEN == false)
        {
            add(pizzaProp4);
        }

        if (pizzaProp5TAKEN == true)
        {
            remove(pizzaProp5);
        }
        else if (pizzaProp5TAKEN == false)
        {
            add(pizzaProp5);
        }

        if (pizzaProp6TAKEN == true)
        {
            remove(pizzaProp6);
        }
        else if (pizzaProp6TAKEN == false)
        {
            add(pizzaProp6);
        }

        wait(6000, refreshPizzas);
    }

    function wait(milliseconds:Int, callback:Void->Void):Void
    {
        Timer.delay(callback, milliseconds);
    }

    function refreshPizzas() 
    {
        pizzaProp1TAKEN = false;
        pizzaProp2TAKEN = false;
        pizzaProp3TAKEN = false;
        pizzaProp4TAKEN = false;
        pizzaProp5TAKEN = false;
        pizzaProp6TAKEN = false;
    }

    function shootPizza() 
    {
        if (FlxG.keys.justPressed.SHIFT)
        {
            var pizzaPropSHOOT:EightBitPizzaPROP = new EightBitPizzaPROP(frdy.x, frdy.y);
            add(pizzaPropSHOOT);
            pizzaPropSHOOT.x = pizzaPropSHOOT.x + 32;
        }    
    }
}