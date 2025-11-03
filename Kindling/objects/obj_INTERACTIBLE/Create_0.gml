event_inherited()
is_closest = false
dialogue_bed = load_dialogue("json_dialogue_bed.txt")
dialogue_wakeup = load_dialogue("json_dialogue_wakeup.txt")
hover_icon = instance_create_layer(x, y - sprite_height, layer_get_id("Symbols"), obj_symbol_interactible)

var dialogue_map = {
	"bed": load_dialogue("json_dialogue_bed.txt"),
	"wakeup": load_dialogue("json_dialogue_wakeup.txt"),
	"duck": load_dialogue("json_dialogue_ducklamp.txt"),
	"computer": load_dialogue("json_dialogue_computer.txt"),
}

//for(var i = 0; i < array_length(dialogue_map.computer); i++)
//	show_debug_message(dialogue_map.computer[i].text)
