event_inherited()
if (instance_exists(table)) {
	//make the kettle sit nicely on top of its box:
    var parent = table;
    depth = parent.depth - 1;
} else {
	//in case something is weird:
    //depth = -y + base_depth;
}