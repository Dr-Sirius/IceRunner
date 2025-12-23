# Ice Runner

## About

Ice Runner is a game initially developed for the [Godot Wild Jam #88](https://itch.io/jam/godot-wild-jam-88). The game was however unable to be submitted in time. As such I thought it would be a great idea to  open source the project, both as a gift to the community and a sort of portfolio piece.

## What Kind of Game is Ice Runner?

Ice Runner is a classic arcade style racer where you play as a penguin (currently no such model in the game) racing other penguins. The goal? Get the best time and get first place. You race on icy ponds and lakes, as well as mountains and tundras!

!["Shot"](https://github.com/Dr-Sirius/IceRunner/blob/main/assets/screenshots/in_game1.png)

<sup>Screen Shot from an in game level</sup>

## Getting Started

The game uses Godot version 4.5.1 which you can get from [here](https://godotengine.org/download/). It does not use the .NET version of Godot, however it should still work.

The game has only been tested on Linux running kernel version 6.18.2.

The game will run if you decide to run a specific level, however it will crash when reaching the end of the level. To see what is intended, play either from the main_menu or boot scenes.

## Creating a level
When creating a level the following will be required in the scene

- a node with the rings.gd script attached
- a path3D node with the create_rings.gd script attached
- a player node
- racers are optional

To create rings, build a new path/curve with the path3d node and when ready hit the **gen rings** button

Once generated make the generated rings new parent the node with the rings.gd script attached

If racers have been added to the scene, make sure to select the node with the rings.gd script attached in their Race Path Node export var

When creating any sort of collision shape, whether its a csg shape or a area3D or just a collision shape, make sure to change its layer and mask to include the racers mask and layers

However not required, to prevent collision between racers, assign different collision and mask layers to each racer. See examples in level 1 - 5

To add the level to be played with all the other levels, you will need to create a level_info resource. The level info will need 
- a name
- a reference to the actual level which is exported as a PackedScene
- a reference to the next level
    - if a next level does not exist the game will crash, just select the End.tres level info as a temp solution

see the screenshot below as an example

![](https://github.com/Dr-Sirius/IceRunner/blob/main/assets/screenshots/level_info.png)

## Warning

The game is incomplete and does not have

- Sound fx or Music
- Controls aren't finalized
- UI is rushed and buggy
- Code is very, very spaghetti and undocumented

## Will it ever be finished?

Most likely not, I may comeback to it ever so often just to mess around and test ideas.

As stated this was simply only for a game jam and really had no purpose except only to further hone my skills and to be a learning experience.


## Credits

Thank you to Pizza Doggy for the Trees!

- [Retro Tree Pack](https://pizzadoggy.itch.io/retro-tree-pack) by Pizza Doggy

Thank you to Szymon Furjan for the amazing font!

- [Morning Breezee](https://github.com/Dr-Sirius/IceRunner/blob/main/assets/fonts/readme.txt) by Szymon Furjan

Thank you ambientcg for the ice and grass textures!
- [ice 003](https://ambientcg.com/a/Ice003) by ambientcg
- [grass 002](https://ambientcg.com/a/Ice003) by ambientcg

Thank you for the amazing addons!
- [copper dc](https://github.com/Ratamacue9112/CopperDC) by Ratamacue9112
- [godot debug menu](https://github.com/godot-extended-libraries/godot-debug-menu) by godot-extended-libraries
- [gwj countdown](https://github.com/Maaack/gwj-countdown-plugin) by Maaack
- [psx camera](https://github.com/immaculate-lift-studio/PSX-Style-Camera-Shader) by immaculate-lift-studio
- [scene object brush](https://github.com/Sacristan/godot_scene_object_brush) by Sacristan