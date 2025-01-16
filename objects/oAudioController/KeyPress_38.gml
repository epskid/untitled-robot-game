// increase volume on up (clamp at 1)
global.config.prefs.volume = min(audio_get_master_gain(0) + 0.1, 1);