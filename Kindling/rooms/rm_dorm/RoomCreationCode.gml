initialize_layers()
if(!obj_globals.day.started) {
	if(obj_globals.day.number == 1 && obj_globals.day.time == "morning"){
		instance_create_depth(0, 0, -500, obj_day, {sprite_index: spr_transition_day1_morning, day: "day1_morning"})
	}
	if(obj_globals.day.number == 2 && obj_globals.day.time == "evening"){
		instance_create_depth(0, 0, -500, obj_day, {sprite_index: spr_transition_day2_evening, day: "day2_evening"})
		obj_player.x = 520
		obj_player.y = 600
	}
}
audio_stop_all()
audio_play_sound(snd_ambience_dorm, 5, true)
audio_play_sound(snd_ost_dorm, 5, true, .25)