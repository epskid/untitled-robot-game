// create the block the user will grab
spawned = instance_create_depth(x, y, -2, oCodeBlock, opts);
// and the one behind to create the illusion of infinite blocks
behind = instance_create_depth(x, y, -2, oCodeBlock, opts);