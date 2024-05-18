# ChangeLog
This is inspired by the [FNF changelog](https://github.com/FunkinCrew/Funkin/blob/main/CHANGELOG.md?plain=1)
Written by [Axuko](https://github.com/Ethan-makes-music?tab=repositories)

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
