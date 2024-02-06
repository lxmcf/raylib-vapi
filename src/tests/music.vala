using RaylibOOP;
using Raylib;

int main(string[] args) {
	if(args[1] == null) {
		print("You must provide a file type.\n");
		Process.exit(1);
	}
	string filetype = args[1];
	var window = new Core.Window(320, 240, "Test Audio");
	var music = new Audio.Music(@"../src/tests/resources/music.$(filetype)");
	/* Check if master volume works */
	print(@"Master Volume: $(window.master_volume)\n");
	window.master_volume = 0.5f;
	print(@"Master Volume: $(window.master_volume)\n");
	music.playing = true;
	while(music.playing == true && !window.should_close) {
		window.begin_drawing();
		switch(get_key_pressed()) {
			case KeyboardKey.Q:
				music.playing = false;
				break;
			/* Master Volume */
			case KeyboardKey.UP:
				window.master_volume += 0.1f;
				print(@"Master Volume: $(window.master_volume)\n");
				break;
			case KeyboardKey.DOWN:
				window.master_volume -= 0.1f;
				print(@"Master Volume: $(window.master_volume)\n");
				break;
			case KeyboardKey.W:
				music.volume += 0.1f;
				print(@"Music Volume: $(music.volume)\n");
				break;
			case KeyboardKey.S:
				music.volume -= 0.1f;
				print(@"Music Volume: $(music.volume)\n");
				break;
			default:
				break;
		}
		music.update();
		window.end_drawing();
	}
	music = null; // Test if destroy works.
	Thread.usleep(1000000);
	window = null;
	Thread.usleep(1000000);
	return(0);
}
