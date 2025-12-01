if(is_closest && (ds_map_exists(obj_globals.dialogue, name) || name == "enterschool")){
	hover_icon.visible = true
	show_debug_message($"Showing interactible for {name}, as map exists")
} 
else {
	hover_icon.visible = false
	if(!ds_map_exists(obj_globals.dialogue, name))
		show_debug_message($"No map found for object {name}.")
}