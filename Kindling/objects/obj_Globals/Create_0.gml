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
phone_is_visible = false;

//LAYERS
dialogue_layer = layer_get_id("Portraits_And_Dialogue")
instances_layer = layer_get_id("Instances")
popups_layer = layer_get_id("Instances")
dialogue_effects = layer_create(layer_get_depth(obj_globals.dialogue_layer) + 1, "Dialogue_Effects")
tips_layer = layer_get_id("Tips")

//MAPS
portraits = ds_map_create()
populate_portraits()

diboxes = ds_map_create()
populate_diboxes()