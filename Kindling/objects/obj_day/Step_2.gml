//ensure player cannot move while transition is up
if(visible) {
	if(obj_globals.rpgMode or !obj_globals.dialogueMode){
		obj_globals.rpgMode = false
		obj_globals.dialogueMode = true
	}
}