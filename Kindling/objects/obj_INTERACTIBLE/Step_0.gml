if(is_closest){
	hover_icon.visible = true
	// Trigger an interaction
	if(keyboard_check_pressed(obj_globals.CTRL_interact)){
		if(obj_globals.rpgMode){
			open_dialogue(id) //send off the type key
		} else if(obj_globals.dialogueMode) {
			close_dialogue()
		}
	}
	
} else {
	hover_icon.visible = false
}