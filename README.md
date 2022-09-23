![image](https://user-images.githubusercontent.com/82112471/191800203-0563a725-4b6a-4caf-9d3b-29239960b0d6.png)

# ps-microphone
Script to enhance as a microphone/loudspeaker when an user enters a define zoned. 

# Installation

* Download file and make sure it's named ps-microphone
* Ensure ps-microphone 
* Add this to dp-emotes or your emotes menu/resource.

```
 ["megaphone"] = {"amb@world_human_mobile_film_shocking@female@base", "base", "Megaphone", AnimationOptions =
    {
        Prop = 'prop_megaphone_01',
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 80.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
```
* Add image to your inventory folder for the megaphone.
* Add to qb-core > shared > items.lua
```
	["megaphone"]						= {["name"] = "megaphone",			["label"] = "Megaphone",		["weight"] = 20000,	["type"] = "item",	["image"] = "magaphone.png",	["unique"] = true,	["useable"] = true,	["shouldClose"] = false,	["combinable"] = nil,	   ["description"] = "A loudspeaker to yell at civilians."},
```

# Dependecies
* Latest [pma-voice](https://github.com/AvarianKnight/pma-voice) 

# Credits 
* [Snipe](https://github.com/pushkart2)
* [Devyn](https://github.com/darktrovx)
* [not jay](https://github.com/jay-fivem)
