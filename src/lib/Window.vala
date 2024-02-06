using Raylib;

namespace RaylibOOP {
	namespace Core {
		public class Window : GLib.Object {
			/* Variables */
			private string windowTitle;
			/* Constructor */
			public Window(int width, int height, string title) {
				stderr.printf("WARN: The OOP interface is not done. Here be dragons!\n");
				this.windowTitle = title;
				Raylib.init_window(width, height, this.windowTitle);
			}
			/* Destroyer */
			~Window() {
				close_window();
			}
			/* Methods */
			public void begin_drawing() {
				Raylib.begin_drawing();
			}
			public void end_drawing() {
				Raylib.end_drawing();
			}
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
		}
	}
}
