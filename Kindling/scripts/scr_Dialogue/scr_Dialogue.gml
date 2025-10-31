function open_dialogue(){
	obj_Globals.rpgMode = false
	obj_Globals.dialogueMode = true
	layer_set_visible(obj_Globals.dialogue_layer, true)
}

function close_dialogue(){
	obj_Globals.rpgMode = true
	obj_Globals.dialogueMode = false
	layer_set_visible(obj_Globals.dialogue_layer, false)
}