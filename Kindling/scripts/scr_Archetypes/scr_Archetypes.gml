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

function get_archetype_score(argument0) {
	with(obj_globals) {
		
	}
}