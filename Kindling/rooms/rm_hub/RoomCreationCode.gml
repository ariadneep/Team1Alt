initialize_layers()
if(!obj_globals.day.started && obj_globals.day.number == 2 && obj_globals.day.time == "afternoon"){
	instance_create_depth(0, 0, -500, obj_day, {sprite_index: spr_transition_day2_afternoon, day: "day2_afternoon"})
}
if(obj_globals.show_mel){
	ds_map_delete(obj_globals.dialogue, "classroom")
	instance_create_layer(500, 335, obj_globals.instances_layer, obj_npc_mel)
}
audio_stop_sound(snd_ambience_classroom)
audio_stop_sound(snd_ambience_dorm)
audio_stop_sound(snd_ost_dorm)
audio_play_sound(snd_ambience_hub, 5, true)