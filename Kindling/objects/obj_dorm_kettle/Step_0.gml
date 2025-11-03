event_inherited()
if (instance_exists(kettle_box)) {
	//make the kettle sit nicely on top of its box:
    var parent = kettle_box;
    depth = parent.depth - 1;
} else {
	//in case something is weird:
    depth = -y + base_depth;
}