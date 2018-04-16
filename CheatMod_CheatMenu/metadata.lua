return PlaceObj("ModDef", {
	"title", "Cheat Menu Expanded",
	"description", "Enables the game's built-in cheat tools, as well as adding a crapload of custom menu settings. "
    .. "There's a cheats section in most info panels on the right side of the screen."
    .. "\n\nF2: Toggle the cheats menu.."
    .. "\nF4: Open object examiner for selected object (use ex(Object) in console)."
    .. "\nCtrl+F: Fill resource of object"
    .. "\nEnter or Tilde: Show the console"
    .. "\nF9: Clear the console log"
    .. "\nCtrl-Alt-Shift-R: Opens console and places \"restart\" in it"
    .. "\nCtrl-Space: Opens placement mode with the last placed object"
    .. "\nCtrl-Shift-Space: Opens placement mode with selected object (works with deposits)"
    .. "\nCtrl-Shift-F: Follow Camera (follow an object around)"
    .. "\nCtrl-Alt-F: Toggle mouse cursor (useful in follow mode to select stuff)"
    .. "\nCtrl-Shift-E: Toggle editor mode"
    .. "\nCtrl-Alt-Shift-D: Delete object"
    .. "\nCtrl-Shift-C: Clone selected object to mouse position"
    .. "\n\nobject = either the selected object or the object under the mouse cursor"
    .. "\n\nFor more info see: https://github.com/ChoGGi/SurvivingMars_CheatMods (or browse the lua files)",
  "tags", "Cheats",
  "image","CheatMenu.png",
  "id", "ChoGGi_CheatMenu",
  --"steam_id","",
	"author", "ChoGGi (thanks to chippydip, therealshibe, BoehserOnkel, Fling)",
	"version", 2.7,
  --"lua_revision","",
	"code", {
		"Init.lua",
	},
  --"loctables","",
  --"saved","",
})