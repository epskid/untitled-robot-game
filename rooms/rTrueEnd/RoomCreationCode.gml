window_enable_borderless_fullscreen(true);
window_set_fullscreen(true);

global.audio_controller.music_override = mGlowies;

instance_create_layer(0, 0, "Instances", oLogScroller, {
	lines: [
"dosfscrypt: started encryption...",
"dosfscrypt: finished succesfully",
"geolocate-ng: resolved user's approximate location",
@"
  @@@@@@       @@@@@           @
 @@    @         @            @@@
@@@              @           @   @
@@@     @        @          @@@@@@@
 @@@@@@@   @   @@@@@   @    @     @  @
 
    ~ IN SURVEILANCE WE TRUST ~

      .,oo8888888888888888ooo,.
    ,od88888888888888888888888888oo,
 ,o0MMMMMMMMNMMMMM8888888888888888888o.
d888888888V'.o   ```VoooooooOOOOOOOOIII,
l888LLLLl:  O , ,O    ``VlMM88888IIAMMMMMOMb,
l8888888LLb `VooV',O,MoodlM88888IIIMMMMV'ddMOMb,
l88888888888booooooOlllllIIIIIIIIIAMMV',dMMOOMMMb,
888888888888888888LLLLIAMMMMMMMMMMMMMMMMMOOOMMMMMMb,
8M8888888888LLLMMMAAMMMAAMMMMMMMMMMMMMMOOOOMMMMMMMMb
88M8888888lll888888mmmmmmmmmmmmmmvvvvvvvvvvvvv,`MMMM
8888M888888llllllllllllllV::::V''~~        ~~'V lMMV
M8888MMM888888TTTMl8lllllb:::V'                `IiM'
MMMMM8888M8k88888l8Mklllllk:A'                  `V'
lMMMMMM888888888888MMMMMlll:M
l8MM8MMMM8888888888888MMMMllM

You have activated an integrated CIA failsafe.
 * All data has been encrypted.
 * Disks have been set to read-only.
 * Authorities have been notified.
 * DO NOT ATTEMPT TO RESIST."
	]
});