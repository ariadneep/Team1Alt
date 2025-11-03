rpgMode = true
dialogueMode = false
dialogue_layer = layer_get_id("Portraits_And_Dialogue")
portrait_effect_layer = layer_get_id("PortraitEffect")
tips_layer = layer_get_id("Tips")

var dialogue_map = {
	"bed": load_dialogue("json_dialogue_bed.txt"),
	"wakeup": load_dialogue("json_dialogue_wakeup.txt"),
	"duck": load_dialogue("json_dialogue_ducklamp.txt"),
	"computer": load_dialogue("json_dialogue_computer.txt"),
}

for(var i = 0; i < array_length(dialogue_map.computer); i++)
	show_debug_message(dialogue_map.computer[i].text)
