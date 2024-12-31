group = audio_create_sync_group(true);
audio_play_in_sync_group(group, mDrums);
audio_play_in_sync_group(group, mMelody);
audio_sound_gain(mMelody, 0, 0);
audio_start_sync_group(group);
fade_out_master = false;