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

// Draw text itself:
if(!is_choice){
	draw_text_ext(text_x, text_y, this_graph[current_index].text, line_sep, max_width)
} else {
	var options = ""
	var these_children = this_graph[current_index].children
	//for each child
	for(var i = 0; i < array_length(these_children); i++) {
		options += "[PRESS " + string(i+1) + "] " + this_graph[these_children[i]].text + "\n"
	}
	//draw each child's text, preceeded with a number/instruction, in a respective region
	draw_text_ext(text_x, text_y, options, line_sep, max_width)
}