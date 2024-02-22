/*
 * RaylibOOP Template by Charadon
 *
 * To the extent possible under law, the person who associated CC0 with
 * RaylibOOP Template has waived all copyright and related or neighboring rights
 * to RaylibOOP Template.
 *
 * You should have received a copy of the CC0 legalcode along with this
 * work.  If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.
 */
using GLib;
using RaylibOOP;

const string VERSION = "v1.0\n";
const string LICENSE = """
LICENSE GOES HERE
""";

public class Game : GLib.Application {
	private Window window;
	private MainLoop loop;
	private TimeoutSource timeout;

	private Game() {
		/* The project doesn't really have a website to it's name. So I guess
		 * I'll just use mine? */
		Object (
			application_id: "com.example.GAME_NAME_HERE",
			flags: ApplicationFlags.FLAGS_NONE
		);
	}

	~Game() {
		window = null;
	}

	private bool main_loop() {
		/* Check if Application Should Close */
		if(window.should_close) {
			/* Tell loop to stop */
			loop.quit();
			return(false);
		}
		window.draw(()=>{
			window.clear_background(RaylibOOP.Color.WHITE);
			/* CODE GOES HERE */
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
		/* Print License and Exit */
		if(args.contains("license")) {
			stdout.printf(LICENSE);
			Process.exit(0);
		}
		/* Run Application */
		return(-1);
	}

	public override void activate() {
		const int screenWidth  = 800;
		const int screenHeight = 450;
		/* Create Window */
		try {
			/* Set the title to the application_id to begin with, so Wayland-based
			 * compositors can figure out their name. Not *technically* needed but
			 * com.example.Example is easier to make rules for than "COOL GAME WINDOW TITLE" */
			window = new Window(screenWidth, screenHeight, this.application_id);
		} catch(WindowError e) {
			error(e.message);
		}
		window.title = "RaylibOOP - Template";
		/* Create GLib MainLoop */
		loop = new MainLoop();
		timeout = new TimeoutSource(1);
		timeout.set_callback(this.main_loop);
		timeout.attach(loop.get_context());
		/* Run Main Loop */
		loop.run();
	}

	public static int main(string[] args) {
		/* Create GLib.Application */
		var app = new Game();
		/* Handle Args */
		app.add_main_option("version", 'v', GLib.OptionFlags.NONE, GLib.OptionArg.NONE, "Displays program's version.", null);
		app.add_main_option("license", 'l', GLib.OptionFlags.NONE, GLib.OptionArg.NONE, "Displays program's license.", null);
		/* Run Application */
		app.run(args);
		return(0);
	}
}
