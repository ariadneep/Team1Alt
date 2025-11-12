if(is_closest){
	hover_icon.visible = true
	
	// Trigger an interaction
	if(keyboard_check_pressed(obj_globals.CTRL_interact)){
		if(obj_globals.rpgMode){
			open_dialogue(id) //send off the type key
			obj_player.image_index = 0
			obj_player.image_speed = 0
		} else if(obj_globals.dialogueMode) {
			step_dialogue()
		}
	}
} 
else {
	hover_icon.visible = false
}