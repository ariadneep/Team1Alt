function populate_portraits() {
	with(obj_globals) {
		portraits[?""] = spr_portrait
		portraits[?"ashley"] = spr_portrait_ashley
		portraits[?"ashley_happy"] = spr_portrait_ashley_happy
		portraits[?"ashley_worried"] = spr_portrait_ashley_worried
		portraits[?"mel"] = spr_portrait_mel
		portraits[?"mel_happy"] = spr_portrait_mel_happy
		portraits[?"mel_worried"] = spr_portrait_mel_worried
		portraits[?"alex"] = spr_portrait_alex
		portraits[?"alex_happy"] = spr_portrait_alex_happy
		portraits[?"alex_worried"] = spr_portrait_alex_worried
		portraits[?"sanctum"] = spr_portrait_sanctum
		portraits[?"yearner"] = spr_portrait_yearner
		portraits[?"hit"] = spr_portrait_hit
		portraits[?"executive"] = spr_portrait_executive
	}
}

function populate_diboxes() {
	with(obj_globals) {
		diboxes[?""] = spr_dialoguebox
		diboxes[?"ashley"] = spr_dialoguebox_ashley
		diboxes[?"mel"] =spr_dialoguebox_mel
		diboxes[?"alex"] = spr_dialoguebox_alex
		diboxes[?"sanctum"] = spr_dialoguebox_sanctum
		diboxes[?"yearner"] = spr_dialoguebox_yearner
		diboxes[?"hit"] = spr_dialoguebox_hit
		diboxes[?"executive"] = spr_dialoguebox_executive
	}
}

function populate_archetypes() {
	with(obj_globals) {
		archetypes[?"yearner"] = 1
		archetypes[?"sanctum"] = 1
		archetypes[?"hit"] = 1
		archetypes[?"executive"] = 1
	}
}

function populate_effects() {
	with (obj_globals) {
		effects[?"sanctum"] = fx_create("_effect_gaussian_blur")
		effects[?"yearner"] = fx_create("_filter_heathaze")
		effects[?"hit"] = fx_create("_filter_underwater")
		effects[?"executive"] = fx_create("_filter_whitenoise")
	}
}

function initialize_layers() {
	show_debug_message("initializing layers??")
	with (obj_globals) {
		dialogue_layer = layer_get_id("Portraits_And_Dialogue")
		instances_layer = layer_get_id("Instances")
		popups_layer = layer_get_id("Instances") //todo: um fix this?
		dialogue_effects = layer_create(layer_get_depth(obj_globals.dialogue_layer) + 1, "Dialogue_Effects")
		dialogue_effects_2 = layer_create(layer_get_depth(obj_globals.dialogue_layer) + 2, "Dialogue_Effects_2")
		tips_layer = layer_get_id("Tips")

		//initialzie deeper layer
		layer_set_fx(obj_globals.dialogue_effects_2, fx_create("_effect_gaussian_blur"))
		layer_set_visible(dialogue_effects_2, false)
		layer_set_visible(dialogue_effects, false)
	}
}