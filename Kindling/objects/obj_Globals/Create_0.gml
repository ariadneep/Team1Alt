//CONTROLS
CTRL_interact = vk_space
CTRL_up = [vk_up, ord("W")]
CTRL_down = [vk_down, ord("S")]
CTRL_left = [vk_left, ord("A")]
CTRL_right = [vk_right, ord("D")]
day = 1
// make another array for movement 

//GLOBAL VARIABLES
rpgMode = true
dialogueMode = false
phone_is_visible = false;

//LAYERS
initialize_layers()

//initialzie deeper layer
layer_set_fx(obj_globals.dialogue_effects_2, fx_create("_effect_gaussian_blur"))
layer_set_visible(dialogue_effects_2, false)
layer_set_visible(dialogue_effects, false)

//MAPS
archetypes = ds_map_create()
populate_archetypes()

portraits = ds_map_create()
populate_portraits()

diboxes = ds_map_create()
populate_diboxes()

effects = ds_map_create()
populate_effects()