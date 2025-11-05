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
populate_portraits()

diboxes = ds_map_create()
populate_diboxes()