// Trigger an interaction
if(keyboard_check_pressed(obj_globals.CTRL_interact)){
	if(obj_globals.dialogueMode && !obj_globals.rpgMode) {
		step_dialogue()
		show_debug_message("space pressed at: " + object_get_name(object_index));
		exit;
	}
}