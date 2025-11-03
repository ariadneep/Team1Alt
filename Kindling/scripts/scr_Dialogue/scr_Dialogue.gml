enum Speaker {
	Player,
	Narrator,
	Yearner,
	Sanctum,
	Executive,
	Hit
}

function open_dialogue(argument0){
	obj_globals.rpgMode = false
	obj_globals.dialogueMode = true
	var this_graph;
	
	// Figure out who the speaker is
	switch(argument0.object_index) {
			case obj_dorm_bed:
				this_graph = obj_dialogue.map.bed
				break
			case obj_dorm_ducklamp:
				this_graph = obj_dialogue.map.duck
				break
			case obj_dorm_pc:
				this_graph = obj_dialogue.map.pc
				break
			case obj_dorm_kettle:
				//this_graph = obj_dialogue.map.kettle
				//break
			default:
				this_graph = obj_dialogue.map.wakeup
				break
	} // end switch
	obj_dialoguebox.this_graph = this_graph
	layer_set_visible(obj_globals.dialogue_layer, true)
	layer_set_visible(obj_globals.portrait_effect_layer, true)
}

function close_dialogue(){
	obj_globals.rpgMode = true
	obj_globals.dialogueMode = false
	layer_set_visible(obj_globals.dialogue_layer, false)
	layer_set_visible(obj_globals.portrait_effect_layer, false)
}

///@function load_dialogue(filepath)
///@param {string} filepath: the name of the json dialogue file, .txt extension included. 
///@return {array}: an array of structs with dialogue.
function load_dialogue(argument0) {
	var dialogue = []
	// read the data
	var file_id = file_text_open_read(argument0);
	var json_string = "";
	while (!file_text_eof(file_id))
    json_string += file_text_readln(file_id);
	file_text_close(file_id);
	
	var array = json_parse(json_string)
	
	//ensure consistency with dialogue index and array index
	for(var i = 0; i < array_length(array); i++){
		array_insert(dialogue, array[i].index, array[i])
	}
	
	return dialogue
	
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