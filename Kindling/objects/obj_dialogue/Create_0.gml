map = {
	"bed": load_dialogue("json_dialogue_bed.txt"),
	"wakeup": load_dialogue("json_dialogue_wakeup.txt"),
	"duck": load_dialogue("json_dialogue_ducklamp.txt"),
	"pc": load_dialogue("json_dialogue_computer.txt"),
	"kettle": [],
}

for(var i = 0; i < array_length(map.bed); i++)
	show_debug_message(map.bed[i].text)
