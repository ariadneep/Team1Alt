/// @function load_day
/// @description A function to load code, dialogue, and interactions at a specified day at a specified time.
/// @param {real} day: The integer index of a day, i.e. 1 for day 1, 2 for day 2, etc.
/// @param {string} time: "morning", "afternoon", or "evening".
function load_day(argument0, argument1){
	var time = "day" + string(argument0) + "_" + string(argument1)
	show_debug_message("Loading day with key \"" + time + "\"")
	switch(time) {
		case "day1_morning":
			load_dialogue_day1_morning()
			// load day 1 screen. 
			// load all defaults; move code here.
			break;
		case "day2_afternoon":
			load_dialogue_day2_afternoon()
			// load day 2 afternoon screen. 
			// load hub and classroom. 
			break;
		case "day2_evening":
			// load day 2 evening screen. 
			// load dorm stuff. 
			break;
		case "day3_morning": 
			// load day 3 morning screen. 
			// load dorm stuff. 
			show_debug_message("Day 3 morning not yet implemented. Doing: nothing at all. Change this in scr_Transitions, caller load_day(day, time)")
			break;
		default:
			break;
	}
}

/// @function load_dialogue_day1_morning
/// @description A function to dialogue for day 1 morning.
function load_dialogue_day1_morning(){
	with(obj_globals) {
		ds_map_clear(dialogue)
		show_debug_message(" \"day1_morning\" dialogue loading...")
		dialogue[?"bed"] = {"ptr_index": 0, "content": load_dialogue("json_dialogue_bed.txt")}
		dialogue[?"wakeup"] = {"ptr_index": 0, "content": load_dialogue("json_dialogue_wakeup.txt")}
		dialogue[?"duck"] = {"ptr_index": 0, "content": load_dialogue("json_dialogue_ducklamp.txt")}
		dialogue[?"pc"] = {"ptr_index": 0, "content": load_dialogue("json_dialogue_computer.txt")}
		dialogue[?"kettle"] = {"ptr_index": 0, "content": load_dialogue("json_dialogue_kettle.txt")}
		dialogue[?"mirrorsink"] = {"ptr_index": 0, "content": load_dialogue("json_dialogue_mirrorsink.txt")}
		dialogue[?"toilet"] = {"ptr_index": 0, "content": load_dialogue("json_dialogue_toilet.txt")}
	}
}
/// @function load_dialogue_day2_afternoon
/// @description A function to dialogue for day 2 afternoon.
function load_dialogue_day2_afternoon(){
	with(obj_globals) {
		ds_map_clear(dialogue)
		dialogue[?"bikerack"] = {"ptr_index": 0, "content": load_dialogue("json_dialogue_bikerack.txt")}
		dialogue[?"bench"] = {"ptr_index": 0, "content": load_dialogue("json_dialogue_bench.txt")}
		dialogue[?"exitschool"] = {"ptr_index": 0, "content": load_dialogue("json_dialogue_exitschool.txt")}
		dialogue[?"enterschool"] = {"ptr_index":0, "content": load_dialogue("json_dialogue_enterschool_day2.txt")}
		dialogue[?"start_day2"] = {"ptr_index": 0, "content": load_dialogue("json_dialogue_start_day02.txt")}
		dialogue[?"leaveroom"] = {"ptr_index": 0, "content": load_dialogue("json_dialogue_leaveroom.txt")}
	}
}