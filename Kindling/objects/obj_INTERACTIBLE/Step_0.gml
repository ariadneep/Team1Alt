
if(is_closest){
	hover_icon.visible = true
	
	// Trigger an interaction
	if(keyboard_check_pressed(obj_globals.CTRL_interact)){
		show_debug_message("Space registered.")
		if(obj_globals.rpgMode){
			open_dialogue(name) //send off the type key
			obj_player.image_index = 0
			obj_player.image_speed = 0
		} 
	}
} 
else {
	hover_icon.visible = false
}