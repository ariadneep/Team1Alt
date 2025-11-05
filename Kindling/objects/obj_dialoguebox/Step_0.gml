var num_choices = array_length(this_graph[current_index].children)

// Handle dialogue-dependent portraits
var portrait_key = this_graph[current_index].speaker + this_graph[current_index].mood
var portrait = spr_portrait
try {
	portrait = obj_globals.portraits[?portrait_key]
} catch(_exception){}
obj_PortraitPopup.sprite_index = portrait

// Handle dialogue-dependent textboxes.
var dibox_key = this_graph[current_index].speaker
var box = spr_dialoguebox
try {
	box = obj_globals.diboxes[?dibox_key]
} catch(_exception){}
sprite_index = box


// Navigate through choices
if(num_choices != 0){
	// move down the elements
	if(keyboard_check_pressed(obj_globals.CTRL_right[0]) 
	or keyboard_check_pressed(obj_globals.CTRL_right[1]) 
	or keyboard_check_pressed(obj_globals.CTRL_down[0]) 
	or keyboard_check_pressed(obj_globals.CTRL_down[1])){
		curr_choice_index = (curr_choice_index + 1) % num_choices
	}
	// move up the elements
	if(keyboard_check_pressed(obj_globals.CTRL_left[0]) 
	or keyboard_check_pressed(obj_globals.CTRL_left[1]) 
	or keyboard_check_pressed(obj_globals.CTRL_up[0]) 
	or keyboard_check_pressed(obj_globals.CTRL_up[1])){
		curr_choice_index = (curr_choice_index + num_choices - 1) % num_choices
	}

}
