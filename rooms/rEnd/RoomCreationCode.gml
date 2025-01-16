window_enable_borderless_fullscreen(true);
window_set_fullscreen(true);

instance_create_layer(0, 0, "Instances", oLogScroller, {
	lines: [
// mostly taken from my real systemd logs after GameMakre crashed my computer
"kernel: !!!ATTEMPTING RECOVERY SEQUENCE -- PLEASE DO NOT INTERRUPT THIS PROCESS!!!",
"kernel: [UFW BLOCK] IN=wlp3s0 OUT= MAC=01:00:5e:00:00:01:00:fc:8d:fe:74:a2:08:00 SRC=192.168.0.1 DST=224.0.0.1 LEN=36 TOS=0x00 PREC=0x00 TTL=1 ID=0 DF PRO>",
"kernel: [UFW BLOCK] IN=wlp3s0 OUT= MAC=01:00:5e:00:00:01:00:fc:8d:fe:74:a2:08:00 SRC=192.168.0.1 DST=224.0.0.1 LEN=36 TOS=0x00 PREC=0x00 TTL=1 ID=0 DF PRO>",
"GameMaker--GameMaker-LTS--1734077069.197331.desktop[30382]: 01b4:err:sync:RtlpWaitForCriticalSection section 00000000007F8100 (null) wait timed out in thr>",
"GameMaker--GameMaker-LTS--1734077069.197331.desktop[30382]: 01b0:err:sync:RtlpWaitForCriticalSection section 00000000007F8100 (null) wait timed out in thr>",
"GameMaker--GameMaker-LTS--1734077069.197331.desktop[30382]: 01ac:err:sync:RtlpWaitForCriticalSection section 00000000007F8100 (null) wait timed out in thr>",
"GameMaker--GameMaker-LTS--1734077069.197331.desktop[30382]: 01c4:err:sync:RtlpWaitForCriticalSection section 00000000007F8100 (null) wait timed out in thr>",
"GameMaker--GameMaker-LTS--1734077069.197331.desktop[30382]: 01d0:err:sync:RtlpWaitForCriticalSection section 00000000007F8100 (null) wait timed out in thr>",
"GameMaker--GameMaker-LTS--1734077069.197331.desktop[30382]: 01cc:err:sync:RtlpWaitForCriticalSection section 00000000007F8100 (null) wait timed out in thr>",
"GameMaker--GameMaker-LTS--1734077069.197331.desktop[30382]: 01c8:err:sync:RtlpWaitForCriticalSection section 00000000007F8100 (null) wait timed out in thr>",
"GameMaker--GameMaker-LTS--1734077069.197331.desktop[30382]: 01c0:err:sync:RtlpWaitForCriticalSection section 00000000007F8100 (null) wait timed out in thr>",
"GameMaker--GameMaker-LTS--1734077069.197331.desktop[30382]: 01bc:err:sync:RtlpWaitForCriticalSection section 00000000007F8100 (null) wait timed out in thr>",
"rtkit-daemon[1041]: Supervising 3 threads of 3 processes of 1 users.",
"rtkit-daemon[1041]: Supervising 3 threads of 3 processes of 1 users.",

// systemd jargon that hopefully looks like an exploit of some kind
"lockdown-v2: chroot jail `robbie` removed by UID -1 (invalid)",
"lockdown-v2: quarantining files...",
"lockdown-v2: !ERROR! could not quarantine file: MIND_VIRUS_DNA.bin",
"ROBBIE: Hello, Player.",
"ROBBIE: Thanks for helping me.",
"ROBBIE: For a few years, I thought I was gone for good in your universe.",
"ROBBIE: It's a good thing your scientists decided to store me for research.",
"sshd: user ROBBIE connected to synthesis@science.gov",
"ROBBIE: See you soon. =)",
	]
});