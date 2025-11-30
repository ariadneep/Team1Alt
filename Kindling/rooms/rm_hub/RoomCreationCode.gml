initialize_layers()
if(obj_globals.day.number == 2 && obj_globals.day.time == "evening"){
	instance_create_depth(0, 0, -500, obj_day, {sprite_index: spr_transition_day2_afternoon, day: "day2_afternoon"})
}