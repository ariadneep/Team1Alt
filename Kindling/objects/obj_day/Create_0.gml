visible = true
if(!variable_instance_exists(id, "day")) {
	day = "none"
}
if(sprite_index != spr_transition_fade_fromblack) {
	audio_play_sound(snd_sfx_newday, 1, false)
}

show_debug_message("day object created with day " + string(day))
image_speed = 0
alarm[0] = 2 * 60

// Block the day off from starting again
obj_globals.day.started = true