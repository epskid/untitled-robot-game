// in a user event to be easily called by other instances, so there's no lag on movement

// align run button
run.x = x + 12;
run.y = y + 12;

// reset hitbox
hitbox.x = x;
hitbox.y = y + (sprite_height / 2);
hitbox.width = sprite_width;
hitbox.height = sprite_height;