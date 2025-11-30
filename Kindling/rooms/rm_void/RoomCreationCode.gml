initialize_layers()
open_dialogue("intro")
obj_globals.rpgMode = false
instance_create_depth(0, 0, -500, obj_day, {sprite_index: spr_transition_fade_fromblack, day: "intro"})