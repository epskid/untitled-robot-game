switch keyboard_string {
	
	// silly skrillex cheat codes
	case "bangarangbyskrillex":
		keyboard_string = "";
		global.audio_controller.music_override = mBangarang;
		break;
	case "scarymonstersnicespritesbyskrillex":
		keyboard_string = "";
		global.audio_controller.music_override = mScaryBlahBlah;
		break;

	// important "cheat" codes
	case "lies":
		keyboard_string = "";
		go_to({ room_to: rTrueEnd, length: 10 });
		break;
	
	// dev codes
	case "ruinthegame":
		keyboard_string = "";
		global.config.state.last_level = infinity;
		room_restart();
		break;
	case "reset":
		keyboard_string = "";
		global.no_progression = false;
		global.config.state.last_level = 0;
		room_restart();
		break;
}

// clear everything typed when backspace pressed
if keyboard_lastkey == vk_backspace {
	keyboard_string = "";
}