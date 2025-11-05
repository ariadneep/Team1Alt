draw_self()
//get dialogue for the current index

// Presets for text drawing:
draw_set_halign(fa_middle)
draw_set_valign(fa_top)
draw_set_colour(c_white)

var text_x = x
var text_y = y
var max_width = sprite_width * 0.8
var line_sep = 20
var text_color = c_white
var selected_color = c_aqua

// Draw text itself:
if(!is_choice){
	draw_text_ext_colour(text_x, text_y, this_graph[current_index].text, line_sep, max_width, text_color, text_color, text_color, text_color, 1)
} else {
	var these_children = this_graph[current_index].children
	var option_sep = 0
	
	//for each child
	for(var i = 0; i < array_length(these_children); i++) {
		if(i = curr_choice_index)
			draw_text_ext_colour(text_x, text_y + option_sep, (">" + this_graph[these_children[i]].text + "< \n"), line_sep, max_width, selected_color, selected_color, selected_color, selected_color, 1)
		else	//draw each child's text, preceeded with a number/instruction, in a respective region
			draw_text_ext_colour(text_x, text_y + option_sep, (this_graph[these_children[i]].text + "\n"), line_sep, max_width, text_color, text_color, text_color, text_color, 1)
		option_sep += 30
	}
}