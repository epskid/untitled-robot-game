// decrease volume on down (clamp at 0)
global.config.prefs.volume = max(audio_get_master_gain(0) - 0.1, 0);