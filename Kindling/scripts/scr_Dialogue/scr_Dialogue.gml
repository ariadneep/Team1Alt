enum Speaker {
	Player,
	Narrator,
	Choice,
	Yearner,
	Sanctum,
	Executive,
	Hit
}

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

/// @function create_dialogue_line(text, speaker, is_active)
/// @param text: the string of text associated with this line
/// @param speaker: the enum speaker that says the line
function create_dialogue_line(argument0, argument1, argument2) {
	line = {
		text : argument0,
		speaker: argument1,
		is_active: argument2,
		children : []
	}
	return line
}

function load_dialogue_bed(argument0) {
	dialogue_0 = "Your bed. It's rumpled and the mattress is lumpy, but exudes a unique kind of comfort."
	dialogue_1 = "You've extracted just enough comfort already."
	dialogue_2 = "You've extracted just a bit too much comfort already."
	dialogue_3 = "You've extracted way too much comfort already."
	array_insert(argument0, 0, create_dialogue_line(dialogue_0, Speaker.Narrator, true))
	array_push(argument0[0].children, 1)
	array_push(argument0[0].children, 2)
	array_push(argument0[0].children, 3)
	
	array_insert(argument0, 1, create_dialogue_line(dialogue_1, Speaker.Narrator, false))
	array_insert(argument0, 2, create_dialogue_line(dialogue_2, Speaker.Narrator, false))
	array_insert(argument0, 3, create_dialogue_line(dialogue_3, Speaker.Narrator, true))

}