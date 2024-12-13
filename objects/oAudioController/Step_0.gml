if room != rMainMenu && (audio_sound_get_gain(melody) != 1) {
	// runs if we aren't in the main menu and the melody isn't playing,
	// which only occurs when we transition from the menu to the game
	
	if audio_sound_get_track_position(drums) <= 0.01 {
		// runs when the drums just finished a loop
		// it rarely equals zero due to the framerate, so we have to sacrifice some accuracy
		audio_sound_set_track_position(drums, 0); // reset track position to sync better (i know sync groups exist i just couldn't bother)
		audio_sound_set_track_position(melody, 0);
		audio_sound_gain(drums, 0.75, 0); // make drums slightly quieter to hear melody
		audio_sound_gain(melody, 1, 0);
	}
} else if room == rMainMenu && (audio_sound_get_gain(melody) == 1) {
	// runs when we leave the game into the menu
	audio_sound_gain(melody, 0, 500); // fade out melody
	audio_sound_gain(drums, 1, 500); // fade in drums
}