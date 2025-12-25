# ChangeLog
This is inspired by the [FNF changelog](https://github.com/FunkinCrew/Funkin/blob/main/CHANGELOG.md?plain=1)

Written by [Axuko](https://github.com/Ethan-makes-music?tab=repositories)

## V1.6 - 12-17-25
### Added
- Made the buttons change color when u hover over them
- Added a fade to all the menus to make it look a little better
- Added back the html5 port!
- When you're in the tutorial note state you can now press backspace to leave too
### Changed
- Overhauled the way saving stuff works in the game
- Overhauled the way the options menu works in the backend
- Made foxy AI a little less agressive
- Made refresh rate 60fps again so the AI doesnt move as fast
- Remade tutorial note to fit in to the game a little more
- Changed SamiCLN credits to Jenfkejl
- Changed ExtendX credits to Pebble
- Instead of pressing a arrow in the Note state you just press A, D, or Left and Right arrow keys (so now to leave it just press the mouse button anywhere)
### Fixed
- If the power is already on and you press the green button again the power will not go down
- Being able to click on the custom night button without it actually being there
### Removed
- .Flas being in the assets folder (you now have to check the github to get them)
- The "Restart game to see changes" text in the options menu
- Since of the new saving system we have removed all of the `.axh` files in the game

## V1.5.1 - 11-2-24
### Fixed
- EasterEgg Note not disappearing

## V1.5 - 11-2-24
### Added
- A note hidden somewhere in the game you can click and it will give you some lore
    - (you can also see this note by just winning the game)

## V1.4 - 9-13-24
### Added
- Custom Night
- Added button in menu that lead you to custom night
- When you have a pre-existing save game it will say "Continue" Instead of "New Game"
### Changed
- Switched all .txt files that contain data to .axh files
- Included EyeDaleHim in the credits state in the menu 
- Changed my name from "Deep_Fried_Bread" in credits to "Axuko"

## V1.3.1 - 5-23-24
### Added
- Discord RPC!!
### Changed
- Organized the files for Handlers (FlxVideo, Hxvlc, Discord) 

## V1.3 - 5-17-24
### Added
- A Changelog
- A Compile Guide
- Another easterEgg in the easterEgg Folder
- A note you can click in game to show you how to play the game
- Another option in the options menu to see the note in game
- A pixel miniGame you can play to get another star in the menu
- A rough framework for [Hxvlc](https://github.com/MAJigsaw77/hxvlc) to be added in later updates
### Changed
- Made animatronics start moving at 1am so you have time to read the note.
- Changed FPS to 128
- Changed if satement to switch statement in source
### Fixed
- AI for animatronics a little bit (eg, made it more easy)
- Fixed power glitch where you could get negative power
### Removed
- All cursor vars in the source since I didnt know you can just do FlxG.mouse 
- Removed HaxeFlixel splashscreen when you load the game.

## V1.2 - 5-6-24
### Added
- Offically added the options menu into the game with only one setting being in there so far..
- Added a star that you see in the bottom right corner in the main menu if you beat the game!
- Added a icon you see when you compile instead of it being the default HaxeFlixel logo.
- Added two more peices of music you can chose from in the options menu those being a old peice of music before even v1.1 and just some static.
- Added a jumpscare "menu" that plays when you get killed on Desktop since idk how to play videos on desktop rn.
### Changed
- Made it fade between all menu states (Main menu, options menu etc).
- Made it so when you leave the Bathroom it closes the shower instead of keeping it open
- Made it so Cupcake can not move if you are observing them in the bathroom
### Fixed
- fixed a bug where you could see Freddy in the bathroom and cameras if he was still at your right door
### Removed
- html5 port :<

## V1.1 - 4-24-24
### Added
- Added some `.txt` files that are going to be used in V1.2 for the options menu.
- Added a rough framework of a options menu that is going to be fully added in V1.2.
- Added art that is going to be used for `Discord RPC` eventually.
- A version number in the top right of the main menu.
- Added a desktop port just with the lack of jumpscares. 
### Changed
- Maded the title say `Project: FTS` instead of `Project FTS` (VERY minor change lol).
- Overhauled the way the Credits works in the source.
    - (So instead of the credits being stored in a `.png` file it can now be dynamically changed in the source instead of the png always having to be changed)
- Made all buttons that were `.pngs` now a dynamic string so I can change what it says whenever in the source.
- Overhauled the looks of the main menu to be more clean instead of super cramped like in [V1.0](https://github.com/Ethan-makes-music/Project-FTS/releases/tag/V1.0).
- Instead of having four different files for all of the jumpscares I got rid of those and added a single FlxVideo class that can handle all videos at once.
- Made the music continue through all different menus instead of restarting everytime.
- Made cupcake AI a little less agressive.
### Removed
- All of the four files used for the [old jumpscare system](https://github.com/Ethan-makes-music/Project-FTS/commit/722434fe766dd92cb87fffb8bcb86f2a215c2fdf#diff-c5218dc973bdf4f6f12992255a227ccea05b245771ad552c82ef14ce95ef77ae).

## V1.0 - 12-17-23
### Added
- The first release of the game!

