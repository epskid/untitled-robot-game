// COPIED FROM oRobot AND MODIFIED TO LOOP

// initialize the variables (ignore how these variables use camel case whereas everything else uses snake case please)

depth = 10;
robotSize = 8;
movementCurveChannel = animcurve_get_channel(acOomph, 0);
squashCurveChannelMinor = animcurve_get_channel(acSquash, 0);
squashCurveChannelMajor = animcurve_get_channel(acSquash, 1);
movementTime = 0.0;
realX = x;
realY = y;
moveDirections = [];

// copy the loop into moveDirections so removing an element from moveDirections doesn't affect the loop instructions
array_copy(moveDirections, 0, loop, 0, array_length(loop));