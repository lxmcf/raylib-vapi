using Raylib;

namespace RaylibOOP {
	namespace Core {
		internal uint8 numOfWindows = 0;
		public class Window : GLib.Object {
			/* Variables */
			private string windowTitle;
			internal int targetFPS = 60;
			internal Raylib.KeyboardKey exitKey = Raylib.KeyboardKey.ESCAPE;
			/* Constructor */
			public Window(int width, int height, string title) {
				if(numOfWindows > 0) {
					error("You cannot create more than 1 window object. Please set the last one to null!");
				}
				stderr.printf("WARN: The OOP interface is not done. Here be dragons!\n");
				this.windowTitle = title;
				Raylib.init_window(width, height, this.windowTitle);
				numOfWindows++;
			}
			/* Destroyer */
			~Window() {
				close_window();
				numOfWindows--;
			}
			/* Methods */
			/**
			* Draws current framerate at coordinates.
			*/
			public void draw_fps(int x, int y) {
				Raylib.draw_fps(x, y);
				return;
			}
			/**
			* Setup canvas (framebuffer) to start drawing
			*/
			public void begin_drawing() {
				Raylib.begin_drawing();
			}
			/**
			* End canvas drawing and swap buffers (double buffering)
			*/
			public void end_drawing() {
				Raylib.end_drawing();
			}
			/**
			* Begin 2D mode with custom camera (2D)
			*/
			public void begin_2D(Raylib.Camera2D camera) {
				Raylib.begin_mode_2D(camera);
				return;
			}
			/**
			* Ends 2D mode with custom camera
			*/
			public void end_2D() {
				Raylib.end_mode_2D();
			}
			/**
			* Set background color (framebuffer clear color)
			*/
			public void clear_background(Raylib.Color color) {
				Raylib.clear_background(color);
			}
			/* Properties */
			/**
			* If window is ready.
			*/
			public bool ready {
				get { return(Raylib.is_window_ready()); }
			}
			/**
			* If window should close.
			*/
			public bool should_close {
				get {
					return(Raylib.window_should_close());
				}
			}
			/**
			* Is window fullscreen.
			*/
			public bool fullscreen {
				get { return(Raylib.is_window_fullscreen()); }
				set {
					if(value == true)
						Raylib.set_window_state(Raylib.ConfigFlags.FULLSCREEN_MODE);
					else
						Raylib.clear_window_state(Raylib.ConfigFlags.FULLSCREEN_MODE);
				}
			}
			/**
			* Is window hidden.
			*/
			public bool hidden {
				get { return(Raylib.is_window_hidden()); }
				set {
					if(value == true)
						Raylib.set_window_state(Raylib.ConfigFlags.WINDOW_HIDDEN);
					else
						Raylib.clear_window_state(Raylib.ConfigFlags.WINDOW_HIDDEN);
				}
			}
			/**
			* Is window minimized.
			*/
			public bool minimized {
				get { return(Raylib.is_window_minimized()); }
			}
			/**
			* Is window maximized.
			*/
			public bool maximized {
				get { return(Raylib.is_window_maximized()); }
			}
			/**
			* Is window focused.
			*/
			public bool focused {
				get { return(Raylib.is_window_focused()); }
			}
			/**
			* If window has been resized.
			*/
			public bool resized {
				get { return(Raylib.is_window_resized()); }
			}
			/**
			* Master volume of the window
			*/
			public float master_volume {
				get {
					return(Raylib.get_master_volume());
				}
				set {
					float volume = value;
					if(volume > 1.0f) {
						volume = 1.0f;
					} else if(volume < 0.0f) {
						volume = 0.0f;
					}
					Raylib.set_master_volume(volume);
				}
			}
			/**
			* Title of the window
			*/
			public string title {
				get {
					return(this.windowTitle);
				}
				set {
					this.windowTitle = value;
					Raylib.set_window_title(this.windowTitle);
				}
			}
			/**
			* Current Frames per Second of the Window.
			*/
			public int fps {
				get {
					return(Raylib.get_fps());
				}
			}
			/**
			* Target FPS of the Window.
			*/
			public int target_fps {
				get {
					return(this.targetFPS);
				}
				set {
					Raylib.set_target_fps(value);
					this.targetFPS = value;
				}
			}
			/**
			* The exit key of the window.
			*/
			public Raylib.KeyboardKey exit_key {
				get {
					return(this.exitKey);
				}
				set {
					this.exitKey = value;
					Raylib.set_exit_key(value);
				}
			}
			/**
			* Screen width
			*/
			public int width {
				get {
					return(Raylib.get_screen_width());
				}
				set {
					Raylib.set_window_size(value, Raylib.get_screen_height());
				}
			}
			/**
			* Screen Height
			*/
			public int height {
				get {
					return(Raylib.get_screen_height());
				}
				set {
					Raylib.set_window_size(Raylib.get_screen_width(), value);
				}
			}
		}
	}
}
