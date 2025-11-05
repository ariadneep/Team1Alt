//CONTROLS
CTRL_interact = vk_space
CTRL_up = [vk_up, ord("W")]
CTRL_down = [vk_down, ord("S")]
CTRL_left = [vk_left, ord("A")]
CTRL_right = [vk_right, ord("D")]
// make another array for movement 

//GLOBAL VARIABLES
rpgMode = true
dialogueMode = false

//LAYERS
dialogue_layer = layer_get_id("Portraits_And_Dialogue")
portrait_effect_layer = layer_get_id("PortraitEffect")
tips_layer = layer_get_id("Tips")

portraits = ds_map_create()
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