// reveals the next line in the logs

if alarm[1] == -1 && (idx == array_length(lines) - 1) {
	// if the logs have been exhausted, wait for a while before closing
	alarm[1] = 2000;
} else {
	// otherwise, show the next line at a random delay
	
	idx++;
	alarm[0] = irandom_range(25, 75);
}