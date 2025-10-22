if(obj_Globals.dialogueMode){
	obj_Globals.rpgMode = true
	obj_Globals.dialogueMode = false
	portraitLayer = layer_get_id("Portraits_And_Dialogue")
	layer_set_visible(portraitLayer, true)
}