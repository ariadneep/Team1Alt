// Trigger an interaction
if(keyboard_check_pressed(obj_globals.CTRL_interact)){
	if(!obj_globals.rpgMode and obj_globals.dialogueMode) {
		step_dialogue()
	}
}