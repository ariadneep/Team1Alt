var num_choices = array_length(these_children)


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
