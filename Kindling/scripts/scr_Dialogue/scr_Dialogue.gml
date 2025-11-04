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
	var this_index;
	
	// Figure out who the speaker is
	switch(argument0.object_index) {
			case obj_dorm_bed:
				this_graph = obj_dialogue.map.bed.content
				this_index = obj_dialogue.map.bed.ptr_index
				break
			case obj_dorm_ducklamp:
				this_graph = obj_dialogue.map.duck.content
				this_index = obj_dialogue.map.duck.ptr_index
				break
			case obj_dorm_pc:
				this_graph = obj_dialogue.map.pc.content
				this_index = obj_dialogue.map.pc.ptr_index
				break
			case obj_dorm_kettle:
				//this_graph = obj_dialogue.map.kettle.content
				//this_index = obj_dialogue.map.kettle.ptr_index
				//break
			default:
				this_graph = obj_dialogue.map.wakeup.content
				this_index = obj_dialogue.map.wakeup.ptr_index
				break
	} // end switch
	obj_dialoguebox.this_graph = this_graph
	obj_dialoguebox.current_index = this_index
	layer_set_visible(obj_globals.dialogue_layer, true)
	layer_set_visible(obj_globals.portrait_effect_layer, true)
}

/// @function step_dialogue()
/// @description traverses the dialogue graph currently mapped in the dialoguebox.
/// @returns {void}
function step_dialogue() {
	with (obj_dialoguebox) {
		var children = this_graph[current_index].children
		if(array_length(children) == 0) {
			is_choice = false
			close_dialogue()
		} else if(is_choice){
			current_index = children[curr_choice_index]
		} else {
			if(array_length(children) == 1){
				is_choice = false
				current_index++
			} else { //if there's more than one child, then this is a choice
			is_choice = true
			}
		}
	}
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