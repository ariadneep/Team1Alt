
// Handle player movement and collisions
if (keyboard_check(vk_left) or keyboard_check(ord("a")))
	move_and_collide(-2, 0, impassible_objects)
if (keyboard_check(vk_right) or keyboard_check(ord("d")))
    move_and_collide(2, 0, impassible_objects)
if (keyboard_check(vk_up) or keyboard_check(ord("w")))
   move_and_collide(0, -2, impassible_objects)
if (keyboard_check(vk_down) or keyboard_check(ord("s")))
    move_and_collide(0, 2, impassible_objects)