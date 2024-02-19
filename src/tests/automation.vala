using RaylibOOP;
using RaylibOOP.Automation;
using RaylibOOP.Input;


/*
* To use this program. Run the program with no arguments. Do some movements, and then
* exit. Re-run with the argument `run` like this: `automated run` and the square will
* do whatever movements you did
*/

int main(string[] args) {
	/* Create Window */
	Window window;
	try {
		window = new Window(640, 480, "Automated!");
	} catch(WindowError e) {
		error(e.message);
	}
	/* Create "Player" */
	Raylib.Rectangle a = {
		0, 0, 60, 60
	};
	Automation.EventList auto = new Automation.EventList("automate.txt");
	window.set_automation_event_list(auto);
	if(args[1] != "run") {
		window.record_automation_events = true;
	}
	int i = 0;
	int frame = 0;
	while(!window.should_close) {
		while(frame == auto.get_event(i).frame && args[1] == "run") {
			debug(@"Play Frame: $i | Current Frame: $frame");
			window.play_automation_event(auto.get_event(i));
			i++;
			if(i == auto.count) {
				i = 0;
				break;
			}
		}
		frame++;
		window.draw(()=>{
			window.clear_background(Color.WHITE);
			if(Keyboard.is_down(Keyboard.Key.UP)) {
				a.y -= 3;
			}
			if(Keyboard.is_down(Keyboard.Key.DOWN)) {
				a.y += 3;
			}
			if(Keyboard.is_down(Keyboard.Key.LEFT)) {
				a.x -= 3;
			}
			if(Keyboard.is_down(Keyboard.Key.RIGHT)) {
				a.x += 3;
			}
			Raylib.draw_rectangle_rect(a, Raylib.RED);
		});
	}
	if(args[1] != "run") {
		window.record_automation_events = false;
		try {
			auto.export("automate.txt");
		} catch(FileError e) {
			error(e.message);
		}
	}
	return(0);
}
