///@function open_dialogue(object)
///@param {string} object name: the name of the object whose dialogue we plan to open.
///@descripton triggers dialogue sequence for a certain object.
///@returns {bool} true on success, false on failure
function open_dialogue(argument0){
	show_debug_message("opened dialogue for object " + string(argument0))
	obj_globals.rpgMode = false
	obj_globals.dialogueMode = true
	obj_dialoguebox.curr_choice_index = 0
	obj_dialoguebox.current_object = argument0
	var target_name = argument0
	var this_object;
	
	// Try to load this object
	show_debug_message(target_name)
	if(obj_globals.dialogue[?target_name])
		this_object = obj_globals.dialogue[?target_name]
	else {
		show_debug_message("Loading failed in open_dialogue. This may be a mistake! Closing now.")
		close_dialogue()
		return false
	}
	
	//update dialoguebox based on this object.
	obj_dialoguebox.this_graph = this_object.content
	obj_dialoguebox.current_index = get_pointer_index(target_name) //TODO outdated infrastructure..????????

	//Show layers
	layer_set_visible(obj_globals.dialogue_layer, true)
	layer_set_visible(obj_globals.dialogue_effects, true)
	layer_set_visible(obj_globals.dialogue_effects_2, true)
	
	// Success!
	return true
}

/// @function step_dialogue()
/// @description traverses the dialogue graph currently mapped in the dialoguebox.
/// @returns {void}
function step_dialogue() {
	with (obj_dialoguebox) {
		// check & parse any commands associated with this piece of dialogue before moving on to the next.
		parse_commands(this_graph[current_index].command)
		//save the children of this line for easy access
		var all_children = this_graph[current_index].children
		var children = []
		for(var i = 0; i < array_length(all_children); i++){
			if(this_graph[all_children[i]].is_active)
				array_push(children, all_children[i])
		}
		//If there are no children, just close the dialogue.
		if(array_length(children) == 0) {
			is_choice = false
			close_dialogue()
			return
		}
		//play sound now that we know it is valid
		audio_play_sound(snd_sfx_stepdialogue, 1, false)
		show_debug_message("current index is " + string(current_index) + " and pointer index is " + string(get_pointer_index(current_object)))
		
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
	try{
	if(obj_dialoguebox.current_object.object_index == obj_dorm_exit) {
		set_pointer_index(obj_dorm_exit, 0)
	}
	}catch(e){}
	layer_set_visible(obj_globals.dialogue_layer, false)
	layer_set_visible(obj_globals.dialogue_effects, false)
	layer_set_visible(obj_globals.dialogue_effects_2, false)
	show_debug_message("closed successfully?????")
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
/// @param {string} object: the object key whose pointer we want to modify
/// @param {real} new_index: an integer for the new index of the dialogue pointer
/// @desc Set the pointer
function set_pointer_index(argument0, argument1) {
	var name = argument0
	if(!is_real(argument1) || !obj_globals.dialogue[?name])
		return false
	var index = argument1
	
	obj_globals.dialogue[?name].ptr_index = index
}

/// @function get_pointer_index(object)
/// @param {asset} object: the object whose pointer we want to retrieve
/// @return {real} index: the index of dialogue we should be at.
/// @description: Get the pointer index
function get_pointer_index(argument0) {
	var name = argument0
	if(!obj_globals.dialogue[?name]) {
		show_debug_message("No speaker found for " + name + "! Caller: get_pointer_index")
		return -1 //index not found
	}
	return obj_globals.dialogue[?name].ptr_index
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
		case "LEAVEROOM":
			//Ensure there are at least 2 elements
			if(array_length(command) < 2)
				return false
			var destination = command[1]
			if(destination == "hub")
				room_goto(rm_hub)
			else if(destination == "dorm")
				room_goto(rm_dorm)
			return true
		case "ENDGAME":
			close_dialogue()
			room_goto(rm_scorescreen)
			return true
		case "CLOSE":
			if(array_length(command) == 1) {
				close_dialogue()
				return true
			}
			if(array_length(command) >= 3) {
				var index_to_close = command[1]
				var object_to_close = command[2]
				
				if(object_to_close == "this")
					object_to_close = obj_dialoguebox.current_object
				if(index_to_close == "this")
					index_to_close = get_pointer_index(object_to_close)
				else 
					index_to_close = int64(index_to_close)
				obj_globals.dialogue[?object_to_close].content[index_to_close].is_active = false
				show_debug_message($"disabled index {index_to_close} for object {object_to_close}")
				return true
			}
			return false
		case "NEXTDAY":
			with(obj_globals) {
				// Make sure there IS a next day
				if(!(day_index < array_length(all_days) - 1)){
					show_debug_message("Parsed command for next day, but no next day found.")
					return false
				}
				//update the current day
				day_index++
				day = all_days[day_index]
				load_day(day.number, day.time)
				return true
			}
		default:
			return false
	} 
}