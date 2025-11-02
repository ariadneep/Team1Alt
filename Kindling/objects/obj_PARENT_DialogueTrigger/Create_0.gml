var dialogue_bed = load_dialogue("json_dialogue_bed.txt")
var dialogue_wakeup = load_dialogue("json_dialogue_wakeup.txt")

var dialogue_map = {
	"bed": load_dialogue("json_dialogue_bed.txt"),
	"wakeup": load_dialogue("json_dialogue_wakeup.txt"),
}

for(var i = 0; i < array_length(dialogue_map.bed); i++)
	show_debug_message(dialogue_map.bed[i].text)
