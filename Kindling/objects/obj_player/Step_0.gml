depth = -(.1 * y)
show_debug_message(depth)
// Handle player movement and collisions
if(obj_Globals.rpgMode){
	var move_left = keyboard_check(vk_left) or keyboard_check(ord("A"))
	var move_right =  keyboard_check(vk_right) or keyboard_check(ord("D"))
	var move_up = keyboard_check(vk_up) or keyboard_check(ord("W"))
	var move_down = keyboard_check(vk_down) or keyboard_check(ord("S"))
	
	if (move_left)
		move_and_collide(-player_speed, 0, impassible_objects)
	if (move_right)
	    move_and_collide(player_speed, 0, impassible_objects)
	if (move_up)
	   move_and_collide(0, -player_speed, impassible_objects)
	if (move_down)
		move_and_collide(0, player_speed, impassible_objects)
}