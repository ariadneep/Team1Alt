calc_depth(id)

if (instance_exists(obj_sky)) {
	//make the kettle sit nicely on top of its box:
    var parent = instance_nearest(x, y, obj_sky);
    depth = parent.depth - 1;
}