var dialogue = []
var bed_index = 0

load_dialogue_bed(dialogue)

//for debug:
for(i = 0; i < array_length(dialogue); i++)
	show_debug_message(dialogue[i].text + string(dialogue[i].children))