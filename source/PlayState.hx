package;

import video.FlxVideo;
import pixel.PixelSubState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;
import flixel.sound.FlxSound;
import flixel.text.FlxText;
import haxe.Timer;
#if sys
import sys.FileSystem;
import sys.io.File;
#end

class PlayState extends FlxState
{
	var posNC:String = "none";
	var vent:FlxSprite = new FlxSprite(556, 42, AssetPaths.vent__png);
	var camButton:FlxSprite = new FlxSprite(484, 636, AssetPaths.camUp__png);
	var fullTime:FlxText = new FlxText(0, 0, FlxG.width, "12:AM");
	var powerFE:FlxText = new FlxText(0, 30, FlxG.width, null, 32);
	var timerBE:Int = 41000;
	var notePaper:FlxSprite = new FlxSprite(10, 646, AssetPaths.paperNOTEEE__png);

	// Sound/Music
	var camSound:FlxSound;
	var lightOFsound:FlxSound;
	var showerSound:FlxSound;
	var bonnieMoveSound:FlxSound;
	var freddyKnockSound:FlxSound;

	// shower stuff
	var showerCurPOS:String = "closed";
	var showerCurSPR:FlxSprite = new FlxSprite(0, 0);
	var showerCurtainClosed:FlxSprite = new FlxSprite(460, 42, AssetPaths.showerClosed__png);
	var showerCurtainOpen:FlxSprite = new FlxSprite(240, -14, AssetPaths.showerOpen__png);
	var leftWall:FlxSprite = new FlxSprite(-66, -14, AssetPaths.wallLeft__png);
	var waterOF:Bool = false;

	// Light Stuff
	var lighOF:Bool = false;
	var lightSwitchSPRTOP:FlxSprite = new FlxSprite(577, 186, AssetPaths.lightUP__png);
	var lighSwitchSPRDOWN:FlxSprite = new FlxSprite(577, 275, AssetPaths.lightDOWN__png);

	// click to:
	var clickToShower:FlxSprite = new FlxSprite(-20, -22, AssetPaths.officeLeft__png);
	var clickToDoor:FlxSprite = new FlxSprite(844, 4, AssetPaths.officeRight__png);
	var clickToNONE:FlxSprite = new FlxSprite(1036, 588, AssetPaths.back__png);
	var middleOffice:FlxSprite = new FlxSprite(82, -5, AssetPaths.officeMiddle__png);

	// Right door stuff
	var wallRight:FlxSprite = new FlxSprite(-4, -9, AssetPaths.wall__png);
	var doorRight1:FlxSprite = new FlxSprite(523, 154, AssetPaths.rightDoor1__png);
	var doorRight2:FlxSprite = new FlxSprite(523, 154, AssetPaths.rightDoor2__png);

	// Camera stuff
	var camBg:FlxSprite = new FlxSprite(-21, -4, AssetPaths.camBG__png);
	var ventConnections:FlxSprite = new FlxSprite(317, 104, AssetPaths.ventConnections__png);
	var you:FlxSprite = new FlxSprite(559, 455, AssetPaths.you__png);
	var otherRooms:FlxSprite = new FlxSprite(237, 453, AssetPaths.otherRooms__png);
	var findCupcake:FlxSprite = new FlxSprite(0, 0, AssetPaths.locate__png);
	var resetCupcakeLocation:FlxText = new FlxText(10, 320, FlxG.width, "Reset Cupcake location");
	var resetFreddyLocation:FlxText = new FlxText(10, 350, FlxG.width, "Reset Freddy location");

	var cam1a:FlxSprite = new FlxSprite(623, 371, AssetPaths.cam1a__png);
	var cam2a:FlxSprite = new FlxSprite(520, 371, AssetPaths.cam2a__png);
	var cam1b:FlxSprite = new FlxSprite(420, 239, AssetPaths.cam1b__png);
	var cam2b:FlxSprite = new FlxSprite(623, 239, AssetPaths.cam2b__png);
	var cam1c:FlxSprite = new FlxSprite(295, 239, AssetPaths.cam1c__png);
	var cam2c:FlxSprite = new FlxSprite(418, 52, AssetPaths.cam2c__png);

	// animatronics
	var frdy1:FlxSprite = new FlxSprite(543, 396, AssetPaths.freddynorm__png);
	var frdy2:FlxSprite = new FlxSprite(0, 0, AssetPaths.freddy__png);
	var bonbon:FlxSprite = new FlxSprite(782, 355, AssetPaths.bonnie__png);
	var foxy:FlxSprite = new FlxSprite(656, 482, AssetPaths.foxy__png);
	var cupcake:FlxSprite = new FlxSprite(42, 550, AssetPaths.cupcake__png);

	// cupcake AI vars
	var cupcakePOS:String = "leftBathroom";
	var cupcakeMO:Int;
	var pickToGo:Int;
	var picktoGoC2:Int;
	var layer2:Bool = false;
	var AHHHHHH:Bool = false;
	var layer3:Bool = false;
	var AHHHHHH2:Bool = false;
	var picktoGoC3:Int;
	var attackCUPCAKE:Int;
	var goTo1A:Int;

	// freddy AI vars
	var frdState:String = "not there";
	var frdMO:Int;
	var getRidof:Int;
	var checkForFred:Bool = false;
	var reliefTimer:Int = 5000;

	// foxy AI vars
	var foxyState:Int = 0;
	var foxyMO:Int;
	var getRidofFOX1:Int;
	var attack:Int;

	// bonnie AI vars
	var bonnieState:Bool = false;
	var bonnieMO:Int;
	var getridofBON:Int;
	var attackBONNIE:Int;

	// power vars
	var waterPower:Int = 100;
	var waterPowerUsage:Int = 1;

	var regPower:Int = 100;
	var regPowerUsage:Int = 1;

	var waterDown2SEC:Int = 1;
	var regDown2SEC:Int = 1;

	var timeTarger:Int = 2;

	//Update v1.1 new video function code
	var freddyVid:FlxVideo;
	var foxyVid:FlxVideo;
	var bonnieVid:FlxVideo;
	var cupcakeVid:FlxVideo;

	//"Jumpscare" on desktop
	var whoScaredU:Int = 0;

	//useagh
	var usage:Int = 0;
	var usagetxt:FlxText = new FlxText(0, 60, FlxG.width, null, 29);

	//Phone guy shii
	var phoneGuyEasterEgg:FlxSound;
	var phoneGuyRegular:FlxSound;
	var phoneGuyChance:Int;
	var phoneGuyBugRepeatFix:Bool = false;

	override public function create()
	{
		super.create();

		freddyVid = new video.FlxVideo({source: AssetPaths.frdJumpscare__mp4, autoplay: false});
		foxyVid = new video.FlxVideo({source: AssetPaths.foxyJumpscare__mp4, autoplay: false});
		bonnieVid = new video.FlxVideo({source: AssetPaths.bonnieJumpscare__mp4, autoplay: false});
		cupcakeVid = new video.FlxVideo({source: AssetPaths.cupcakeJumpscare__mp4, autoplay: false});

		findCupcake.x = 325;
		findCupcake.y = 554;

		FlxG.mouse.useSystemCursor = true;

		// Sound/Music
		camSound = FlxG.sound.load(AssetPaths.cameraOpen__ogg);
		lightOFsound = FlxG.sound.load(AssetPaths.lightOFsnd__ogg);
		showerSound = FlxG.sound.load(AssetPaths.showerSFX__ogg);
		bonnieMoveSound = FlxG.sound.load(AssetPaths.bonnieMove__ogg);
		freddyKnockSound = FlxG.sound.load(AssetPaths.knocking__ogg);
		phoneGuyEasterEgg = FlxG.sound.load(AssetPaths.fortniteAccent__ogg);
		phoneGuyRegular = FlxG.sound.load(AssetPaths.fortniteAccent__ogg);
		FlxG.sound.playMusic(AssetPaths.bgNoise__ogg, 1, true);

		//Text formatting
		fullTime.setFormat(AssetPaths.digital_7__ttf, 29, FlxColor.WHITE, FlxTextAlign.LEFT);
		powerFE.setFormat(AssetPaths.digital_7__ttf, 29, FlxColor.WHITE, FlxTextAlign.LEFT);
		resetCupcakeLocation.setFormat(AssetPaths.digital_7__ttf, 29, FlxColor.WHITE, FlxTextAlign.LEFT);
		usagetxt.setFormat(AssetPaths.digital_7__ttf, 29, FlxColor.WHITE, FlxTextAlign.LEFT);
		resetFreddyLocation.setFormat(AssetPaths.digital_7__ttf, 29, FlxColor.WHITE, FlxTextAlign.LEFT);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		timerBE -= 1;

		if (timerBE <= 36000)
		{
			cupcakeAI();
			freddyAI();
			foxyAI();
			bonnieAI();
		}

		if (regPower <= 0)
		{
			FlxG.switchState(new EndState());
		}

		powerFE.text = "Power: " + Std.string(regPower);
		usagetxt.text = "Usage: " + Std.string(usage);

		if (waterOF == true)
		{
			bonnieState = false;
			showerSound.play();
		}

		if (lighOF == true)
		{
			usage = 1;
		}
		else if(lighOF == true && posNC == "cam")
		{
			usage = 2;
		}

		// Go Places
		if (FlxG.mouse.overlaps(clickToShower) && posNC == "none" && FlxG.mouse.justPressed && lighOF == true)
		{
			posNC = "shower";
			removeNONE();
			lightOFsound.play();
		}
		if (FlxG.mouse.overlaps(clickToDoor) && posNC == "none" && FlxG.mouse.justPressed)
		{
			posNC = "checkDoor";
			removeNONE();
			lightOFsound.play();
		}
		if (FlxG.mouse.overlaps(camButton) && posNC == "none" && lighOF == true)
		{
			posNC = "cam";
			removeNONE();
			camSound.play();
		}

		// Shower mech
		if (posNC == "shower")
		{
			removeNONE();
			addShower();
			if (FlxG.mouse.overlaps(clickToNONE) && FlxG.mouse.justPressed)
			{
				posNC = "none";
				camSound.play();
			}

			if (FlxG.keys.justPressed.Z)
			{
				showerCurPOS = "open";
				lightOFsound.play();
			}
			else if (FlxG.keys.justPressed.X)
			{
				showerCurPOS = "closed";
				lightOFsound.play();
			}

			if (FlxG.keys.justPressed.C && showerCurPOS == "closed")
			{
				waterOF = true;
				regPower -= 1;
			}
			else if (FlxG.keys.justPressed.V && showerCurPOS == "closed")
			{
				waterOF = false;
			}
		}

		// Door Mch
		if (posNC == "checkDoor")
		{
			addRight();
			removeNONE();
			add(clickToNONE);

			if (FlxG.mouse.overlaps(clickToNONE) && FlxG.mouse.justPressed)
			{
				posNC = "none";
				camSound.play();
			}
		}

		// Office Mch
		if (posNC == "none")
		{
			// light O/F
			addNone();
			removeShower();
			removeRight();
			removeCam();
			waterOF = false;
			if (FlxG.mouse.overlaps(lightSwitchSPRTOP) && FlxG.mouse.justPressed)
			{
				lighOF = true;
				regPower -= 1;
				camSound.play();
			}
			else if (FlxG.mouse.overlaps(lighSwitchSPRDOWN) && FlxG.mouse.justPressed)
			{
				lighOF = false;
				camSound.play();
			}

			if (FlxG.mouse.overlaps(notePaper) && FlxG.mouse.justPressed)
			{
				switchSub2();
			}
		}

		if (posNC == "cam")
		{
			addCam();
			add(clickToNONE);
			removeNONE();
			if (FlxG.mouse.overlaps(clickToNONE) && FlxG.mouse.justPressed)
			{
				posNC = "none";
				camSound.play();
			}

			if (FlxG.mouse.overlaps(resetCupcakeLocation) && FlxG.mouse.justPressed)
			{
				cupcakePOS = "leftBathroom";
				layer3 = false;
				layer2 = false;
				AHHHHHH = false;
				AHHHHHH2 = false;
				findCupcake.x = 325;
				findCupcake.y = 554;
				regPower = regPower - 10;
			}

			if (FlxG.mouse.overlaps(resetFreddyLocation) && FlxG.mouse.justPressed)
			{
				frdState = "not there";
				regPower = regPower - 5;
			}

			if (FlxG.mouse.overlaps(findCupcake) && FlxG.mouse.justPressed)
			{
				switchSub();
			}
		}

		if (timerBE == 41000)
		{
			fullTime.text = "12:AM";
		}
		else if (timerBE == 36000)
		{
			fullTime.text = "1:AM";
		}
		else if (timerBE == 30000)
		{
			fullTime.text = "2:AM";
		}
		else if (timerBE == 24000)
		{
			fullTime.text = "3:AM";
		}
		else if (timerBE == 18000)
		{
			fullTime.text = "4:AM";
		}
		else if (timerBE == 12000)
		{
			fullTime.text = "5:AM";
		}
		else if (timerBE == 6000)
		{
			fullTime.text = "6:AM";
		}

		add(fullTime);
		if (fullTime.text == "6:AM")
		{
			FlxG.switchState(new WinState());
		}
		add(powerFE);
		//add(usagetxt);

		#if !deug
		if (FlxG.keys.justPressed.ESCAPE)
		{
			FlxG.switchState(new EndState());
		}
		else if (FlxG.keys.justPressed.BACKSPACE)
		{
			freddyVid.play();
		}
		#end
	}

	// Random Functions

	function addNone()
	{
		add(middleOffice);
		add(clickToDoor);
		add(clickToShower);
		add(lightSwitchSPRTOP);
		add(lighSwitchSPRDOWN);
		add(vent);
		add(camButton);
		#if sys
		var dir1 = 'assets\\data\\optionData2.txt';
		if (FileSystem.exists(dir1))
		{
			var fileContents = File.getContent(dir1);
			
			if (fileContents.indexOf("True") != -1)
			{
				addPaper();
			}
		}
		#end
	}

	function removeNONE()
	{
		remove(clickToShower);
		remove(clickToDoor);
		remove(lighSwitchSPRDOWN);
		remove(lightSwitchSPRTOP);
		remove(middleOffice);
		remove(vent);
		remove(camButton);
		remove(notePaper);
	}

	function addRight()
	{
		add(wallRight);
		if (lighOF == true)
		{
			add(doorRight2);
		}
		else if (lighOF == false)
		{
			add(doorRight1);
		}
		if (lighOF == true && frdState == "there")
		{
			add(frdy1);
		}
		else if (lighOF == false || frdState == "not there")
		{
			remove(frdy1);
		}
	}

	function addShower()
	{
		add(leftWall);

		if (showerCurPOS == "open")
		{
			remove(showerCurtainClosed);
			add(bonbon);
			add(foxy);
			add(showerCurtainOpen);
		}
		else if (showerCurPOS == "closed")
		{
			remove(showerCurtainOpen);
			add(showerCurtainClosed);
			remove(foxy);
			remove(bonbon);
		}

		add(clickToNONE);
		if (cupcakePOS == "leftBathroom")
		{
			add(cupcake);
		}
		else
		{
			remove(cupcake);
		}
	}

	function removeShower()
	{
		remove(leftWall);
		remove(showerCurtainClosed);
		remove(showerCurtainOpen);
		remove(clickToNONE);
		remove(cupcake);
		remove(foxy);
		remove(bonbon);
		showerCurPOS = "closed";
	}

	function removeRight()
	{
		remove(wallRight);
		remove(doorRight1);
		remove(doorRight2);
		remove(frdy1);
		remove(frdy2);
	}

	function addCam()
	{
		add(camBg);
		add(ventConnections);
		add(otherRooms);
		add(you);
		add(cam1a);
		add(cam2a);
		add(cam1b);
		add(cam2b);
		add(cam1c);
		add(cam2c);
		add(findCupcake);
		add(resetCupcakeLocation);
		add(resetFreddyLocation);
	}

	function removeCam()
	{
		remove(camBg);
		remove(ventConnections);
		remove(otherRooms);
		remove(you);
		remove(cam1a);
		remove(cam2a);
		remove(cam1b);
		remove(cam2b);
		remove(cam1c);
		remove(cam2c);
		remove(findCupcake);
		remove(resetCupcakeLocation);
		remove(resetFreddyLocation);
	}

	// AI stuff
	function cupcakeAI()
	{
		if (posNC == "cam" || posNC == "shower" && cupcakePOS == "leftBathroom")
		{
			// nothing bro
		}
		else
		{
			if (layer2 == false)
			{
				pickToGo = 0;
				pickToGo = Random.int(1, 2000);
			}

			if (pickToGo == 250)
			{
				pickToGo = 0;
				cupcakePOS = "cam1c";
				findCupcake.x = 349;
				findCupcake.y = 260;
				layer2 = true;
				AHHHHHH = true;
			}
			else if (pickToGo == 190)
			{
				pickToGo = 0;
				cupcakePOS = "cam2c";
				findCupcake.x = 475;
				findCupcake.y = 70;
				layer2 = true;
				AHHHHHH = true;
			}
			if (layer2 == true && layer3 == false)
			{
				if (AHHHHHH == true)
				{
					picktoGoC2 = Random.int(1, 1500);
				}
				if (picktoGoC2 == 350 && cupcakePOS == "cam1c")
				{
					cupcakePOS = "cam1b";
					findCupcake.x = 475;
					findCupcake.y = 258;
					AHHHHHH = false;
					layer3 = true;
					AHHHHHH2 = true;
				}
				else if (picktoGoC2 == 250 && cupcakePOS == "cam2c")
				{
					cupcakePOS = "cam2b";
					findCupcake.x = 680;
					findCupcake.y = 258;
					AHHHHHH = false;
					layer3 = true;
					AHHHHHH2 = true;
				}
			}

			if (layer3 == true)
			{
				if (AHHHHHH2 == true)
				{
					picktoGoC3 = Random.int(1, 900);
				}

				if (picktoGoC3 == 350 && cupcakePOS == "cam1b")
				{
					cupcakePOS = "cam2a";
					findCupcake.x = 576;
					findCupcake.y = 390;
				}
				else if (picktoGoC3 == 250 && cupcakePOS == "cam2b")
				{
					cupcakePOS = "cam2a";
					findCupcake.x = 576;
					findCupcake.y = 390;
				}
			}

			if (cupcakePOS == "cam2a")
			{
				goTo1A = Random.int(1, 900);
				if (goTo1A == 350)
				{
					cupcakePOS = "cam1a";
					findCupcake.x = 679;
					findCupcake.y = 390;
				}
			}

			if (cupcakePOS == "cam1a")
			{
				attackCUPCAKE = Random.int(1, 900);
				if (attackCUPCAKE == 299)
				{
					#if sys
					whoScaredU = 1;
					FlxG.switchState(new ScareState(whoScaredU));
					#else
					cupcakeVid.play();
					#end
				}
			}
		}
	}

	function freddyAI()
	{
		if (frdState == "not there")
		{
			frdMO = 0;
			frdMO = Random.int(1, 3000);
			if (frdMO == 320)
			{
				frdState = "there";
			}
		}

		if (frdState == "there")
		{
			if (lighOF == true && posNC == "checkDoor")
			{
				checkForFred = true;
			}
			else if (lighOF == false && posNC == "checkDoor")
			{
				killPlr();
			}

			if (posNC == "checkDoor")
			{
				//s
			}
			else if (checkForFred == false)
			{
				freddyKnockSound.play();
			}

			getRidof = 0;
			getRidof = Random.int(1, 650);
			if (lighOF == false && getRidof == 450 && checkForFred == true)
			{
				frdState = "not there";
			}
		}
	}

	function foxyAI()
	{
		switch foxyState
		{
			case 0:
				foxy.x = 656;
				foxy.y = 482;
			case 1:
				foxy.x = 656;
				foxy.y = 493;
			case 2:
				foxy.x = 656;
				foxy.y = 369;
			case 3:
				foxy.x = 656;
				foxy.y = 301;
			case 4:
				foxy.x = 656;
				foxy.y = 260;
		}

		if (posNC == "shower" && showerCurPOS == "open")
		{
			getRidofFOX1 = 0;
			getRidofFOX1 = Random.int(1, 400);

			switch getRidofFOX1
			{
				case 250:
					foxyState = 0;
				case 180:
					foxyState = 1;
			}
		}
		else if (showerCurPOS == "closed" && posNC == "cam" || posNC == "none" || posNC == "checkDoor")
		{
			foxyMO = 0;
			foxyMO = Random.int(1, 600);
	
			switch foxyMO
			{
				case 250:
						foxyState = 2;
				case 350:
					foxyState = 3;
				case 550:
					foxyState = 4;
			}
		}
		if (foxyState == 4)
		{
			attack = 0;
			attack = Random.int(1, 1000);
			if (attack == 350)
			{
				#if sys
				whoScaredU = 3;
				FlxG.switchState(new ScareState(whoScaredU));
				#else
				foxyVid.play();
				#end
			}
		}
	}

	function bonnieAI()
	{
		if (posNC == "shower")
		{
			if (bonnieState == false)
			{
				bonnieMO = Random.int(1, 950);
			}
			switch bonnieMO
			{
				case 250:
					bonnieState = true;
			}
			if (bonnieState == true && waterOF == false)
			{
				bonnieMoveSound.play();
				attackBONNIE = Random.int(1, 1000);
				switch attackBONNIE
				{
					case 560:
						#if sys
						whoScaredU = 4;
						FlxG.switchState(new ScareState(whoScaredU));
						#else
						bonnieVid.play();
						#end
				}
			}
		}
	}

	function wait(milliseconds:Int, callback:Void->Void):Void
	{
		Timer.delay(callback, milliseconds);
	}

	public function killPlr()
	{
		#if sys
		whoScaredU = 2;
		FlxG.switchState(new ScareState(whoScaredU));
		#else
		freddyVid.play();
		#end
	}

	private function switchSub() 
	{
		openSubState(new PixelSubState());
	}

	private function switchSub2() {
		openSubState(new NoteSubState());
	}

	private function addPaper() 
	{
		add(notePaper);
	}
}
