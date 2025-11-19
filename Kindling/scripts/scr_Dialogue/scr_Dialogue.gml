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
	obj_globals.rpgMode = false
	obj_globals.dialogueMode = true
	obj_dialoguebox.curr_choice_index = 0
	obj_dialoguebox.current_object = argument0
	var this_object;
	
	// Figure out who the speaker is
	switch(argument0.object_index) {
			case obj_dorm_bed:
				this_object = obj_dialogue.map.bed
				break
			case obj_dorm_ducklamp:
				this_object = obj_dialogue.map.duck
				break
			case obj_dorm_pc:
				this_object = obj_dialogue.map.pc
				break
			case obj_dorm_kettle:
				this_object = obj_dialogue.map.kettle
				break
			case obj_dorm_toilet:
				this_object = obj_dialogue.map.toilet
				break
			case obj_dorm_sink:
				this_object = obj_dialogue.map.mirrorsink
				break
			case obj_day:
				this_object = obj_dialogue.map.wakeup
				show_debug_message("day object...")
				break
			default:
				show_debug_message("Loading default dialogue... this may be a mistake...")
				this_object = obj_dialogue.map.wakeup
				break
	} // end switch
	obj_dialoguebox.this_graph = this_object.content
	obj_dialoguebox.current_index = this_object.ptr_index
	
	//Show layers
	layer_set_visible(obj_globals.dialogue_layer, true)
	layer_set_visible(obj_globals.dialogue_effects, true)
	layer_set_visible(obj_globals.dialogue_effects_2, true)
}

/// @function step_dialogue()
/// @description traverses the dialogue graph currently mapped in the dialoguebox.
/// @returns {void}
function step_dialogue() {
	with (obj_dialoguebox) {
		// check & parse any commands associated with this piece of dialogue before moving on to the next.
		parse_commands(this_graph[current_index].command)
		//save the children of this line for easy access
		var children = this_graph[current_index].children
		show_debug_message("current index is " + string(current_index) + "and pointer index is " + string(get_pointer_index(current_object)))
		
		//If there are no children, just close the dialogue.
		if(array_length(children) == 0) {
			is_choice = false
			close_dialogue()
			return
		}
		if(is_choice){
			//navigate to the chosen child at method call time
			current_index = children[curr_choice_index]
			set_pointer_index(current_object, current_index)
			is_choice = false //dealt with the choice; no longer a choice
		} else {
			if(array_length(children) == 1){
				//if there's just one child, go to it.
				is_choice = false
				current_index = children[0]
				set_pointer_index(current_object, current_index)
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
	layer_set_visible(obj_globals.dialogue_effects, false)
	layer_set_visible(obj_globals.dialogue_effects_2, false)
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
}

/// @function set_pointer_index(object, new_index)
/// @param {asset} object: the object whose pointer we want to modify
/// @param {real} new_index: an integer for the new index of the dialogue pointer
/// @desc Set the pointer
function set_pointer_index(argument0, argument1) {
	if(!is_real(argument1) || !is_real(argument1))
		return false
	var index = argument1
		
	switch(argument0.object_index) {
		case obj_dorm_bed:
			obj_dialogue.map.bed.ptr_index = index
			return true
		case obj_dorm_ducklamp:
			obj_dialogue.map.duck.ptr_index = index
			return true
		case obj_dorm_pc:
			obj_dialogue.map.pc.ptr_index = index
			return true
		case obj_dorm_kettle:
			obj_dialogue.map.kettle.ptr_index = index
			return true
		case obj_dorm_toilet:
			obj_dialogue.map.toilet.ptr_index = index
			return true
		case obj_dorm_sink:
			obj_dialogue.map.mirrorsink.ptr_index = index
			return true
		case obj_day:
			obj_dialogue.map.wakeup.ptr_index = index
		default:
			return false
	}
}

/// @function get_pointer_index(object)
/// @param {asset} object: the object whose pointer we want to retrieve
/// @return {real} index: the index of dialogue we should be at.
/// @description: Get the pointer index
function get_pointer_index(argument0) {
	switch(argument0.object_index) {
		case obj_dorm_bed:
			return obj_dialogue.map.bed.ptr_index
		case obj_dorm_ducklamp:
			return obj_dialogue.map.duck.ptr_index
		case obj_dorm_pc:
			return obj_dialogue.map.pc.ptr_index
		case obj_dorm_kettle:
			return obj_dialogue.map.kettle.ptr_index
		case obj_dorm_toilet:
			return obj_dialogue.map.toilet.ptr_index
		case obj_dorm_sink:
			return obj_dialogue.map.mirrorsink.ptr_index
		case obj_day:
			return obj_dialogue.map.wakeup.ptr_index
		default:
			show_debug_message("No speaker found! Did you implement it in get_pointer_index?")
			return -1 //index not found
	}
}

/// @function parse_commands(commands)
/// @param {array} commands: the commands to be parsed, as a 
/// jagged array of command arrays taken straight from dialogue JSONs.
/// @return true if the parse was a success and false if it was not. 
/// @description: reads the array of commands passed in as an argument and executes the
/// associated code.
function parse_commands(argument0) {
	var commands = argument0
	//check for argument validity & return early.
	if(!is_array(commands) || array_length(commands) == 0){
		show_debug_message("Parse failed: commands not array (bad) or length 0 (fine).")
		return false
	}
	var returnbool = true
	
	// Parse each command in the array 
	for(var i = 0; i < array_length(commands); i++) {
		var cmdbool = HELPER_parse_command(commands[i])
		//if the command was parsed successfully, clear it.
		if(cmdbool)
			obj_dialoguebox.this_graph[current_index].command[i] = []
		returnbool = returnbool && cmdbool
	}
	
	show_debug_message("Parse success??: " + string(returnbool))
	
	return returnbool
}

/// @function HELPER_parse_command(command)
/// @param {array} command: a SINGLE command to be parsed.
/// @return true if the parse was a success and false if it was not. 
/// @description: reads the command passed in as an argument and executes the
/// associated code.
function HELPER_parse_command(argument0) {
	var command = argument0
	//check for argument validity & return early.
	if(!is_array(command) || array_length(command) == 0){
		return false
	}
	
	// assuming all arguments are valid, we now have ONE command with at least one element!
	var command_string = command[0]
	switch(command_string) {
		case "UPGRADE": // level up an archetype
			// We need to look at the first 3 elements, so if length is less than 3 then this fails
			if(array_length(command) < 3)
				return false
			// Upgrade selected archetype!
			var archetype = command[1]
			var qty =  command[2]
			obj_globals.archetypes[?archetype] += qty
			show_debug_message(string(archetype) + " updated to " + string(obj_globals.archetypes[?archetype]))
			return true 
		default:
			return false
	} 
}