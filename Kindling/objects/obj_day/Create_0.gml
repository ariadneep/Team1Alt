visible = true
if(!variable_instance_exists(id, "day")) {
	day = "none"
}
show_debug_message("day object created with day " + string(day))
image_speed = 0
alarm[0] = 2 * 60