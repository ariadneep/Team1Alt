event_inherited()
is_closest = false
dialogue_index = 0
name = object_get_name(id.object_index)

var y_offset = -sprite_height
// if y offset would make the sprite go off the screen, put the icon below the object
if(y + y_offset <= 30 || y_offset >= 256)
	y_offset = 20
hover_icon = instance_create_depth(x, y + y_offset, -150, obj_symbol_interactible)