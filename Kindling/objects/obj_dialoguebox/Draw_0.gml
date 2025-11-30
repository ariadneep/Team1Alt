var current_index = 0
try {
	current_index = get_pointer_index(current_object)
} catch(e){}

// Draw dialogue-dependent portraits
var speaker = this_graph[current_index].speaker
var portrait_key = speaker + this_graph[current_index].mood
var portrait = spr_portrait
try {
	portrait = obj_globals.portraits[?portrait_key]
} catch(_exception){}
draw_sprite(portrait, 0, -75, room_height)

// Draw dialogue-dependent textboxes.
var dibox_key = this_graph[current_index].speaker
var box = spr_dialoguebox
try {
	box = obj_globals.diboxes[?dibox_key]
} catch(_exception){}
sprite_index = box

// Handle effect layers. 
if(ds_map_exists(obj_globals.effects, speaker)) {
	var effect = obj_globals.effects[?speaker]
	layer_set_fx(obj_globals.dialogue_effects, effect)
	if(obj_globals.dialogueMode){
		layer_set_visible(obj_globals.dialogue_effects, true)
	}
} else {
	layer_set_visible(obj_globals.dialogue_effects, false)
}

draw_self()

// Presets for text drawing:
draw_set_halign(fa_middle)
draw_set_valign(fa_top)
draw_set_colour(c_black)

var text_x = x
var text_y = y
var max_width = sprite_width * 0.65
var line_sep = 20
var text_color = c_black
var selected_color = c_blue

// Draw text itself:
if(!is_choice){
	draw_text_ext_colour(text_x, text_y, this_graph[current_index].text, line_sep, max_width, text_color, text_color, text_color, text_color, 1)
	these_children = []
} else {
	var option_sep = 0
	if(array_length(these_children) == 0) { //if these children are empty then populate
		var temp_children = this_graph[current_index].children
		var index = 0
		//only add allow access to active children
		for (var i = 0; i < array_length(temp_children); i++) {
			if(this_graph[temp_children[i]].is_active){
				these_children[index] = temp_children[i]
				index++
			}
		}
	}
	
	//for each child
	for(var i = 0; i < array_length(these_children); i++) {
		if(i = curr_choice_index)
			draw_text_ext_colour(text_x, text_y + option_sep, (">" + this_graph[these_children[i]].text + "< \n"), line_sep, max_width, selected_color, selected_color, selected_color, selected_color, 1)
		else	//draw each child's text, preceeded with a number/instruction, in a respective region
			draw_text_ext_colour(text_x, text_y + option_sep, (this_graph[these_children[i]].text + "\n"), line_sep, max_width, text_color, text_color, text_color, text_color, 1)
		option_sep += 30
	}
}