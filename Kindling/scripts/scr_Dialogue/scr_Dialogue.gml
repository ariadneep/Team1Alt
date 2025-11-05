enum Speaker {
	Player,
	Narrator,
	Yearner,
	Sanctum,
	Executive,
	Hit
}

///@function open_dialogue(object)
///@param {asset} object: the object whose dialogue we plan to open.
///@descripton triggers dialogue sequence for a certain object.
function open_dialogue(argument0){
	show_debug_message("open dialogue called! index " + string(obj_dialoguebox.current_index))
	
	obj_globals.rpgMode = false
	obj_globals.dialogueMode = true
	obj_dialoguebox.curr_choice_index = 0
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
		//key = obj_dialoguebox.this_graph[current_index].speaker + obj_dialoguebox.this_graph[current_index].mood
		//save the children of this line for easy access
		var children = this_graph[current_index].children
		show_debug_message(this_graph[current_index])
		
		//If there are no children, just close the dialogue.
		if(array_length(children) == 0) {
			is_choice = false
			close_dialogue()
			return
		}
		if(is_choice){
			//navigate to the chosen child at method call time
			current_index = children[curr_choice_index]
			is_choice = false //dealt with the choice; no longer a choice
		} else {
			if(array_length(children) == 1){
				//if there's just one child, go to it.
				is_choice = false
				current_index = children[0]
			} else { //if there's more than one child, then this is a choice
				is_choice = true
			}
		}//end else
		curr_choice_index = 0
	}//end with
	
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