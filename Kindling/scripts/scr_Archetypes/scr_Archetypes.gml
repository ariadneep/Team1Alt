function draw_score(argument0) {
	// Presets for text drawing:
	draw_set_halign(fa_middle)
	draw_set_valign(fa_top)
	draw_set_colour(c_white)

	var text_x = x
	var text_y = y + 150
	var max_width = sprite_width * 0.65
	var line_sep = 20
	var text_color = c_white
	var selected_color = c_blue

	// Draw text itself:
	draw_text_ext_colour(text_x, text_y, obj_globals.archetypes[?argument0], line_sep, max_width, text_color, text_color, text_color, text_color, 1)
}

function get_archetype_score(name) {
	with(obj_globals) {
		return archetypes[?name]
	}
}

/// @function get_highest_archetype
/// @description This function yields information on the archetype with the highest score. 
/// In case of a tie, the highest one is chosen at random.
/// @returns {array} A 2-element array containing the name of the highest archetype  at index 0 and the value at index 1.
function get_highest_archetype() {
	with(obj_globals) {
		// initialize highest to low/invalid values
		var highest_archetype = ""
		var highest_value = -1
		
		//initialize the first temporary archetype
		var archetype = ds_map_find_first(archetypes);
		// optimization loop. runs while more elements exist
		while(archetype != undefined) {
			// recalc value every time current archetype is updated
			var value = archetypes[?archetype];
			
			// optimize
			if (value > highest_value) {
				 highest_value = value;
				 highest_archetype   = archetype;
			}
			
			// go to next archetype
			archetype = ds_map_find_next(archetypes, archetype);
		}
		show_debug_message($"Highest archetype queried; {highest_archetype} is highest with a score of {highest_value}.")
		return [highest_archetype, highest_value]	
	}
}