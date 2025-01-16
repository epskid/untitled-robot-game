if !is_undefined(music_override) {
	// check if there's a music override and start playing if it's not playing yet
	if !audio_is_playing(music_override) {
		// stop everything else before playing the override
		audio_stop_all();
		audio_stop_sync_group(group);
	
		audio_play_sound(music_override, 1, true);
	}
	
	return;
}

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
	// fade out master track
	audio_master_gain(max(audio_get_master_gain(0) - 0.01, 0));
	return;
}

// set the volume to what the user wants
audio_master_gain(global.config.prefs.volume);

if room != rMainMenu && (audio_sound_get_gain(mMelody) == 0) {
	// runs if we aren't in the main menu and the melody isn't playing,
	// which only occurs when we transition from the menu to the game

	audio_sound_gain(mDrums, 0, 100); // fade out drums
	audio_sound_gain(mMelody, 0.5, 100); // fade in melody
} else if room == rMainMenu && (audio_sound_get_gain(mMelody) != 0) {
	// runs when we leave the game into the menu
	audio_sound_gain(mMelody, 0, 100); // fade out melody
	audio_sound_gain(mDrums, 0.5, 100); // fade in drums
}