if room != rMainMenu && audio_is_playing(musIntro) {
	if audio_sound_get_track_position(intro) <= 0.01 {
		audio_stop_sound(musIntro);
		audio_play_sound(musLoop, 0, true);
	}
}