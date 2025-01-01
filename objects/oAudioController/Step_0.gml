if fade_in_master {
	// fading in has priority over fading out
	if fade_out_master {
		fade_out_master = false;
	}
	
	var _new_vol = audio_get_master_gain(0) + 0.01;
	
	// stop fading once it reaches the user's preferred volume
	if _new_vol < global.config.prefs.volume {
		audio_master_gain(_new_vol);
	} else {
		fade_in_master = false;
	}
	
	return;
}

if fade_out_master {
	audio_master_gain(max(audio_get_master_gain(0) - 0.01, 0));
	return;
}

// set the volume to what the user wants
audio_master_gain(global.config.prefs.volume);

if room != rMainMenu && (audio_sound_get_gain(mMelody) != 1) {
	// runs if we aren't in the main menu and the melody isn't playing,
	// which only occurs when we transition from the menu to the game
	
	if audio_sound_get_track_position(mDrums) == 0 {
		// runs when the drums just finished a loop
		audio_sound_gain(mDrums, 0.4, 0); // make drums slightly quieter to hear melody
		audio_sound_gain(mMelody, 0.5, 0);
	}
} else if room == rMainMenu && (audio_sound_get_gain(mMelody) == 1) {
	// runs when we leave the game into the menu
	audio_sound_gain(mMelody, 0, 500); // fade out melody
	audio_sound_gain(mDrums, 0.5, 500); // fade in drums
} else if room == rEnd && audio_sync_group_is_playing(group) {
	// stop the usual music at the end for dramatic effect
	audio_stop_sync_group(group);
}