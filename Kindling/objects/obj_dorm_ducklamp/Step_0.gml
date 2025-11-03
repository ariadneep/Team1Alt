// Inherit the parent event
event_inherited()
if (instance_exists(duck_box)) {
	//make the kettle sit nicely on top of its box:
    var parent = duck_box;
    depth = parent.depth - 1;
} else {
	//in case something is weird:
    depth = -y + base_depth;
}
