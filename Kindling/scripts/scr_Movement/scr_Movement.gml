function calc_depth(argument0){
	argument0.depth = ((-argument0.y/room_height) * 100) + layer_get_depth(obj_globals.instances_layer)
}