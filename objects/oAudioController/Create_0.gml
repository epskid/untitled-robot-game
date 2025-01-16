// create the main sync group
group = audio_create_sync_group(true);
audio_play_in_sync_group(group, mDrums);
audio_play_in_sync_group(group, mMelody);
audio_sound_gain(mDrums, 0.5, 0);
audio_sound_gain(mMelody, 0, 0);
audio_start_sync_group(group);

// create fading controllers
fade_out_master = false;
fade_in_master = false;

// explicitly set music overrride to undefined to avoid warnings
music_override = undefined;

global.audio_controller = id;