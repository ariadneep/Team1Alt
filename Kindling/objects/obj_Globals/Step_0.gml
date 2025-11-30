// Trigger an interaction
if(keyboard_check_pressed(CTRL_interact)){
	if(rpgMode) {
		// If there is an interactible within range, open its dialogue
		if(obj_player.nearest_interactible != noone) {
			open_dialogue(obj_player.nearest_interactible.name) //send off the type key
			obj_player.image_index = 0
			obj_player.image_speed = 0
			exit;
		} //end if
	} //end if
	else if(dialogueMode){
		step_dialogue()
		exit;
	} //end elif
} //end keyboard check