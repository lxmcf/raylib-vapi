using GLib;
using RaylibOOP;

void println(string msg) {
	/* We put a [Test] at the start, to differentiate output from Raylib, from the test. */
	print("[Test] "+msg+"\n");
	return;
}

/* Quickly refreshes the screen. Also serves as a test to see if the draw methods are working. */
void quick_draw(Window win) {
	win.begin_drawing();
	var someKindofYellow = Color.Custom.from_html_code("#ff00af23");
	win.clear_background(someKindofYellow);
	win.end_drawing();
}

void check_ready(Window window) {
	println("Checking if ready...");
	println(@"Window is ready: $(window.ready)");
}

void check_fullscreen(Window window) {
	println("Checking fullscreen...");
	println(@"Fullscreen: $(window.fullscreen)");
	window.fullscreen = true;
	quick_draw(window);
	Thread.usleep(1000000);
	println(@"Fullscreen: $(window.fullscreen)");
	quick_draw(window);
	window.fullscreen = false;
	quick_draw(window);
	Thread.usleep(1000000);
	quick_draw(window);
	println("Done testing fullscreen.");
	return;
}



int main() {
	println("Checking Window object...");
	Window window;
	try {
		window = new Window(320, 240, "Test");
	} catch(WindowError e) {
		error("We shouldn't get here!");
	}
	println("Checking properties...");
	check_ready(window);
	quick_draw(window);
	Thread.usleep(1000000);
	println("Checking methods...");
	check_fullscreen(window);
	/* Finally, check if number of windows detection works */
	Window window_two;
	try {
		window_two = new Window(320, 240, "This should throw an error.");
	} catch (WindowError e) {
		warning(e.message);
	}
	return(0);
}
