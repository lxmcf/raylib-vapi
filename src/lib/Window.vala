using Raylib;

namespace RaylibOOP {
	namespace Core {
		public class Window : GLib.Object {
			/* Variables */
			private string windowTitle;
			public Window(int width, int height, string title) {
				stderr.printf("The OOP interface is not done. Here be dragons.\n");
				this.title = title;
				Raylib.init_window(width, height, this.title);
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
