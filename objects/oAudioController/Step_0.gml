if fade_out_master {
	audio_master_gain(max(audio_get_master_gain(0) - 0.01, 0));
	return;
}

if room != rMainMenu && (audio_sound_get_gain(mMelody) != 1) {
	// runs if we aren't in the main menu and the melody isn't playing,
	// which only occurs when we transition from the menu to the game
	
	if audio_sound_get_track_position(mDrums) == 0 {
		// runs when the drums just finished a loop
		audio_sound_gain(mDrums, 0.75, 0); // make drums slightly quieter to hear melody
		audio_sound_gain(mMelody, 1, 0);
	}
} else if room == rMainMenu && (audio_sound_get_gain(mMelody) == 1) {
	// runs when we leave the game into the menu
	audio_sound_gain(mMelody, 0, 500); // fade out melody
	audio_sound_gain(mDrums, 1, 500); // fade in drums
} else if room == rEnd && audio_sync_group_is_playing(group) {
	audio_stop_sync_group(group);
}