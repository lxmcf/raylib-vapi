/*
 * Copyright 2024 Charadon
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
using GLib;
using RaylibOOP;

const string VERSION = "v1.0\n";

public class BasicWindow : Application {
	private Window window;
	private MainLoop loop;
	private TimeoutSource timeout;

	private BasicWindow() {
		/* The project doesn't really have a website to it's name. So I guess
		 * I'll just use mine? */
		Object (
			application_id: "net.iotib.RaylibOOP.core_basic_window",
			flags: ApplicationFlags.FLAGS_NONE
		);
	}

	~BasicWindow() {
		window = null;
	}

	private bool main_loop() {
		/* Check if Application Should Close */
		if(window.should_close) {
			/* Tell loop to stop */
			loop.quit();
			return(false);
		}
		/* Draw Frames */
		window.draw(()=>{
			window.clear_background(Color.RAY_WHITE);
			Font.DEFAULT.draw_text(
				"Congrats! You created your first window!",
				new Shapes.Vector2(190, 200), 20, null, Color.LIGHT_GRAY
			);
			window.draw_fps(0, 0);
		});
		/* Tell Loop to keep going */
		return(true);
	}

	public override int handle_local_options(VariantDict args) {
		/* Print Version and Exit */
		if(args.contains("version")) {
			stdout.printf(VERSION);
			Process.exit(0);
		}
		if(args.contains("license")) {
			stdout.printf(LICENSE);
			Process.exit(0);
		}
		/* Activate Application */
		return(-1);
	}

	public override void activate() {
		const int screenWidth  = 800;
		const int screenHeight = 450;
		/* Create Window */
		try {
			window = new Window(screenWidth, screenHeight, "RaylibOOP [core] example - basic window");
		} catch(WindowError e) {
			error(e.message);
		}
		/* Create GLib MainLoop */
		loop = new MainLoop();
		timeout = new TimeoutSource(1);
		timeout.set_callback(this.main_loop);
		timeout.attach(loop.get_context());
		/* Run Main Loop */
		loop.run();
	}

	public static int main(string[] args) {
		/* Force Logs to Show */
		Environment.set_variable("G_MESSAGES_DEBUG", "all", true);
		/* Create GLib.Application */
		var app = new BasicWindow();
		/* Handle Args */
		app.add_main_option("version", 'v', GLib.OptionFlags.NONE, GLib.OptionArg.NONE, "Displays program's version.", null);
		app.add_main_option("license", 'l', GLib.OptionFlags.NONE, GLib.OptionArg.NONE, "Displays program's license.", null);
		/* Run Application */
		app.run(args);
		return(0);
	}
}
