Main
  Where the game starts
  Where I put the global variables
  Where I put anything that needs to be saved from one level to the next
  On click immediately goes to the menu state

MenuState
  Just have a button that goes to the first level when clicked

Playstate/levels
  Should probably extend the playstate but for now thats not implemented yet

Enemy class
  Should probably get extended but not implemented yet

Player class
  Only need the one so you probably can just edit the one there

Statemachine
  Not yet implemented
  Decides what each thing is doing at any given time by implementing a "Brain"

Csv's
  Starts at 1 not 0, I usually have a blank first square to compensate
  need a csv for every "Layer" like the map, the enemies and the items

Loading Items
  For multiple items use the csv to import them for ease of use
  best to keep them the same graphic size as the map tiles in the csv's, you can swap them later when loading them in if you need

Loading Maps
  Load layer by layer from the csv

Image Assets
  Single Images
  Sprite Sheets
    Should be one row

Sound Assets

Physics and other

Saving?

When to use the float?
