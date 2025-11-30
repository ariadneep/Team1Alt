calc_depth(id)

xspeed = 0
yspeed = 0
var old_nearest = noone
//If there are interactible objects, worry about whatever is closest to show the interactible sign. 
if(nearest_interactible != noone) {
	// If the old nearest interactible is out of range, reset its boolean flag
	if(distance_to_object(nearest_interactible) > 30){
		nearest_interactible.is_closest = false
		layer_set_visible(obj_globals.tips_layer, false)
	}
	
	old_nearest = nearest_interactible
}

nearest_interactible  = instance_nearest(x, y, obj_INTERACTIBLE)
	
if(old_nearest != noone && old_nearest.id != nearest_interactible.id)
	old_nearest.is_closest = false

if(distance_to_object(nearest_interactible) <= 30){
	nearest_interactible.is_closest = true
	layer_set_visible(obj_globals.tips_layer, true)
} else {
	nearest_interactible = noone
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
		xspeed += -player_speed
		sprite_index = spr_character_ashley_walk_left
		image_speed = 1
	}
	if (move_right) {
	    xspeed += player_speed
		sprite_index = spr_character_ashley_walk_right
		image_speed = 1
	}
	if (move_up) {
	   yspeed += -player_speed
	   sprite_index = spr_character_ashley_walk_up
	   image_speed = 1
	} 
	if (move_down) {
		yspeed += player_speed
		sprite_index = spr_character_ashley_walk_down
		image_speed = 1
	}

	if (yspeed != 0 || xspeed != 0) {
		var angle = point_direction(0, 0, xspeed, yspeed)
		xspeed = lengthdir_x(player_speed, angle)
		yspeed = lengthdir_y(player_speed, angle)
	}
	if(is_moving) {
		move_and_collide(xspeed, yspeed, impassible_objects)
	}
	
	if(!is_moving) {
		image_index = 0
		image_speed = 0
	}
}