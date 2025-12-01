initialize_layers()
obj_globals.show_mel = true
obj_globals.dialogue[?"mel"] = {"ptr_index": 0, "content": load_dialogue("json_dialogue_mel_outsideschool.txt")}
if(obj_globals.day.number == 2 && obj_globals.day.time == "afternoon"){
	open_dialogue("classroom")
}
audio_stop_sound(snd_ambience_classroom)
audio_stop_sound(snd_ambience_dorm)
audio_stop_sound(snd_ost_dorm)

audio_play_sound(snd_ambience_classroom, 5, true)