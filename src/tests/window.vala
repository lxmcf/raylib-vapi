using GLib;
using Raylib.OOP;
using Raylib.OOP.Core;
using Raylib.OOP.Shapes;

void println(string msg) {
	/* We put a [Test] at the start, to differentiate output from Raylib, from the test. */
	print("[Test] "+msg+"\n");
	return;
}

/* Quickly refreshes the screen. Also serves as a test to see if the draw methods are working. */
void quick_draw(Window win) {
	win.begin_drawing();
	win.clear_background(Color.WHITE);
	win.end_drawing();
}

void check_ready(Window window) {
	println("Checking if ready...");
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
	var window = new Window(320, 240, "Test");
	quick_draw(window);
	Thread.usleep(1000000);
	println("Checking methods...");
	check_fullscreen(window);
	return(0);
}
