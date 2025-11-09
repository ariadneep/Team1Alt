depth = .1 * -y

//TODO: organize this later because it's a mess!sta
if(distance_to_object(nearest_interactible) > 30){
	nearest_interactible.is_closest = false
	layer_set_visible(obj_globals.tips_layer, false)
}
var old_nearest = nearest_interactible
nearest_interactible  = instance_nearest(x, y, obj_INTERACTIBLE)

if(old_nearest.id != nearest_interactible.id)
	old_nearest.is_closest = false

if(distance_to_object(nearest_interactible) <= 30){
	nearest_interactible.is_closest = true
	layer_set_visible(obj_globals.tips_layer, true)
}
if(obj_globals.dialogueMode)
	layer_set_visible(obj_globals.tips_layer, false)

// Handle player movement and collisions
if(obj_globals.rpgMode){
	var move_left = keyboard_check(vk_left) or keyboard_check(ord("A"))
	var move_right =  keyboard_check(vk_right) or keyboard_check(ord("D"))
	var move_up = keyboard_check(vk_up) or keyboard_check(ord("W"))
	var move_down = keyboard_check(vk_down) or keyboard_check(ord("S"))
	var is_moving = move_left || move_right || move_up || move_down
	
	if (move_left) {
		move_and_collide(-player_speed, 0, impassible_objects)
		sprite_index = spr_character_ashley_walk_left
		image_speed = 1
	}
	if (move_right) {
	    move_and_collide(player_speed, 0, impassible_objects)
		sprite_index = spr_character_ashley_walk_right
		image_speed = 1
	}
	if (move_up) {
	   move_and_collide(0, -player_speed, impassible_objects)
	   sprite_index = spr_character_ashley_walk_up
	   image_speed = 1
	}
	if (move_down) {
		move_and_collide(0, player_speed, impassible_objects)
		sprite_index = spr_character_ashley_walk_down
		image_speed = 1
	}
	
	if(!is_moving) {
		image_index = 0
		image_speed = 0
	}
}