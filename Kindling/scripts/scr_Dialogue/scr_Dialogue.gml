enum Speaker {
	Player,
	Narrator,
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

///@function load_dialogue(filepath)
///@param {string} filepath: the name of the json dialogue file, .txt extension included. 
///@return {array}: an array of structs with dialogue.
function load_dialogue(argument0) {
	// read the data
	var file_id = file_text_open_read(argument0);
	var json_string = "";
	while (!file_text_eof(file_id))
    json_string += file_text_readln(file_id);
	file_text_close(file_id);
	
	return json_parse(json_string)
	
	//dialogue format:
	/*
	line = {
		index : int
		text : string
		speaker: enum,
		mood: mood,
		is_active: boolean,
		children : int array
	}
	*/
}