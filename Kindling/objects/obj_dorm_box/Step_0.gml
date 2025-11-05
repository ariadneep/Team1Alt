// Inherit the parent event
event_inherited();

if (instance_exists(box_table)) {
	//make the kettle sit nicely on top of its box:
    var parent = box_table;
    depth = parent.depth - 1;
}
