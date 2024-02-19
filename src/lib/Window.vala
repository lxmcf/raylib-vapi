using RaylibOOP.Shapes;

namespace RaylibOOP {
	public errordomain WindowError {
		ONLY_ONE,
		NO_DROPPED_FILES
	}
	/* Prevents 2 Window objects from existing */
	internal uint8 numOfWindows = 0;

	public class Window : GLib.Object {
		/* Objects */
		public class Cursor {
			/* Variables */
			internal bool cursorLocked = false;
			/* Methods */
			/* Properties */
			/**
			* If cursor is not visible
			*/
			public bool hidden {
				get {
					return(Raylib.is_cursor_hidden());
				}
				set {
					if(value == true) {
						Raylib.hide_cursor();
					} else {
						Raylib.show_cursor();
					}
				}
			}
			/**
			* If cursor is locked.
			*/
			public bool locked {
				get {
					return(cursorLocked);
				}
				set {
					if(value == true) {
						cursorLocked = true;
						Raylib.disable_cursor();
					} else {
						cursorLocked = false;
						Raylib.enable_cursor();
					}
				}
			}
			/**
			* If cursor is on the screen
			*/
			public bool on_screen {
				get {
					return(Raylib.is_cursor_on_screen());
				}
			}
		}
		public class Monitor {
			private int num;
			public Monitor(int monitorNum) {
				this.num = monitorNum;
			}
			/* Properties */
			/**
			* Get monitor width (current video mode used by monitor)
			*/
			public int width {
				get {
					return(Raylib.get_monitor_width(num));
				}
			}
			/**
			* Get monitor height (current video mode used by monitor)
			*/
			public int height {
				get {
					return(Raylib.get_monitor_height(num));
				}
			}
			/**
			* Get monitor refresh rate
			*/
			public int refresh_rate {
				get {
					return(Raylib.get_monitor_refresh_rate(num));
				}
			}
			/**
			* Get the human-readable, UTF-8 encoded name of the monitor
			*/
			public string name {
				owned get {
					return(Raylib.get_monitor_name(num));
				}
			}
			/**
			* Get monitor physical width in millimetres
			*/
			public int physical_width {
				get {
					return(Raylib.get_monitor_physical_width(num));
				}
			}
			/**
			* Get monitor physical height in millimetres
			*/
			public int physical_height {
				get {
					return(Raylib.get_monitor_physical_height(num));
				}
			}
		}
		/* Variables */
		internal string windowTitle          = "Raylib";
		internal int targetFPS              = 60;
		internal bool initialized           = false; /* Checks if this object has been initialized, or if it error'd */
		internal Input.Keyboard.Key exitKey = Input.Keyboard.Key.ESCAPE;
		internal int minimumHeight          = 0;
		internal int minimumWidth           = 0;
		internal int maximumHeight          = 0;
		internal int maximumWidth           = 0;
		internal bool eventRecording        = false;
		internal bool eventListSet          = false;
		internal bool eventWaiting          = false;
		public Cursor cursor;
		public Monitor[] monitors;
		/* Constructor */
		public Window(int width, int height, string title) throws WindowError {
			/* Check that only 1 window is active. */
			if(numOfWindows > 0) {
				throw new WindowError.ONLY_ONE("You can only have one Window at a time.");
			}

			warning("The OOP interface is not done. Here be dragons!");

			/* Make raylib use GLib's logging system */
			Raylib.set_trace_log_callback(Log.trace_log);
			/* Initialize the Window */
			this.windowTitle = title;
			Raylib.init_window(width, height, this.windowTitle);
			this.initialized = true;
			this.target_fps = targetFPS;
			/* Create Cursor Object */
			cursor = new Cursor();
			/* Create Monitor Array */
			monitors[0] = new Monitor(0);
			for(int i = 1; i < Raylib.get_monitor_count(); i++) {
				monitors += new Monitor(i);
			}
			numOfWindows++;
		}
		/* Destroyer */
		~Window() {
			if(this.initialized == false) {
				return;
			}
			info("Destroying Window...");
			Raylib.close_window();
			numOfWindows--;
		}
		/* Methods */
		/**
		* Set automation event list to record to.
		*/
		public void set_automation_event_list(Automation.EventList eventList) {
			Raylib.set_automation_event_list(&eventList.eventList);
			eventListSet = true;
		}
		/**
		* Get current connected monitor
		*/
		public Monitor* get_current_monitor() {
			return(this.monitors[Raylib.get_current_monitor()]);
		}
		/**
		* Set automation event internal base frame to start recording
		*/
		public void set_automation_event_base_frame(int frame) {
			Raylib.set_automation_event_base_frame(frame);
		}
		/**
		* Play a recorded automation event
		*/
		public void play_automation_event(Raylib.AutomationEvent event) {
			Raylib.play_automation_event(event);
		}
		/**
		* Scissor mode (define screen area for following drawing)
		*/
		public void scissor(Func func, int x, int y, int width, int height) {
			Raylib.begin_scissor_mode(x, y, width, height);
			func(null);
			Raylib.end_scissor_mode();
		}
		/**
		* Begin scissor mode (define screen area for following drawing)
		*/
		public void begin_scissor(int x, int y, int width, int height) {
			Raylib.begin_scissor_mode(x, y, width, height);
		}
		/**
		* End scissor mode.
		*/
		public void end_scissor() {
			Raylib.end_scissor_mode();
		}
		/**
		* Load dropped filepaths
		*/
		public void get_dropped_files(out GLib.Array<string> files) throws WindowError {
			if(file_dropped == false) {
				throw new WindowError.NO_DROPPED_FILES("No files were dropped.");
			}
			files = new GLib.Array<string>();
		 	Raylib.FilePathList a = Raylib.load_dropped_files();
			for(int i = 0; i < a.paths.length; i++) {
				files.append_val(a.paths[i]);
				debug(a.paths[i]);
			}
			Raylib.unload_dropped_files(a);
		}
		/**
		* Take Screenshot
		*/
		public void take_screenshot(string filename) {
			Raylib.take_screenshot(filename);
		}
		/**
		* Set window state: not minimized/maximized (only PLATFORM_DESKTOP)
		*/
		public void restore() {
			Raylib.restore_window();
		}
		/**
		* Draws current framerate at coordinates.
		*/
		public void draw_fps(int x, int y) {
			Raylib.draw_fps(x, y);
			return;
		}
		/**
		* Draw Frame
		*/
		public void draw(Func function) {
			this.begin_drawing();
			function(null);
			this.end_drawing();
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
		public void clear_background(Color color) {
			Raylib.Color a = {
				color.r, color.g, color.b, color.a,
			};
			Raylib.clear_background(a);
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
		* Borderless windowed (only PLATFORM_DESKTOP)
		*/
		public bool borderless {
			get {
				return(Raylib.is_window_state(Raylib.ConfigFlags.BORDERLESS_WINDOWED_MODE));
			}
			set {
				Raylib.set_window_state(Raylib.ConfigFlags.BORDERLESS_WINDOWED_MODE);
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
			set {
				if(value == true)
					Raylib.set_window_state(Raylib.ConfigFlags.WINDOW_MINIMIZED);
				else
					Raylib.clear_window_state(Raylib.ConfigFlags.WINDOW_MINIMIZED);
			}
		}
		/**
		* Is window maximized.
		*/
		public bool maximized {
			get { return(Raylib.is_window_maximized()); }
			set {
				if(value == true)
					Raylib.set_window_state(Raylib.ConfigFlags.WINDOW_MAXIMIZED);
				else
					Raylib.clear_window_state(Raylib.ConfigFlags.WINDOW_MAXIMIZED);
			}
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
		public Input.Keyboard.Key exit_key {
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
		/**
		* Minimum Height of Window. A value of 0 means unset.
		*/
		public int minimum_height {
			get {
				return(this.minimumHeight);
			}
			set {
				minimumHeight = value;
				Raylib.set_window_minimum_size(minimumWidth, value);
			}
		}
		/**
		* Minimum Width of Window. Value of 0 means unset.
		*/
		public int minimum_width {
			get {
				return(this.minimumWidth);
			}
			set {
				minimumWidth = value;
				Raylib.set_window_minimum_size(value, minimumHeight);
			}
		}
		/**
		* Maximum Height of Window. A value of 0 means unset.
		*/
		public int maximum_height {
			get {
				return(this.maximumHeight);
			}
			set {
				this.maximumHeight = value;
				Raylib.set_window_maximum_size(this.maximumWidth, value);
			}
		}
		/**
		* Maximum Width of Window. A value of 0 means unset.
		*/
		public int maximum_width {
			get {
				return(this.maximumWidth);
			}
			set {
				this.maximumWidth = value;
				Raylib.set_window_maximum_size(value, this.maximumHeight);
			}
		}
		/**
		* Position of window.
		*/
		public Vector2 position {
			owned get {
				var a = Raylib.get_window_position();
				return(new Vector2(a.x, a.y));
			}
			set {
				Vector2 a = value;
				Raylib.set_window_position((int)Math.ceilf(a.x),(int)Math.ceilf(a.y));
				a = null;
			}
		}
		/**
		* Elapsed time in seconds since window creation.
		*/
		public double time {
			get {
				return(Raylib.get_time());
			}
		}
		/**
		* Time in seconds for last frame drawn (delta time)
		*/
		public float frame_time {
			get {
				return(Raylib.get_frame_time());
			}
		}
		/**
		* If a file has been dropped into window
		*/
		public bool file_dropped {
			get {
				return(Raylib.is_file_dropped());
			}
		}
		/**
		* Recording automation events (set_automation_event_list must have been run)
		*/
		public bool record_automation_events {
			get {
				if(eventListSet == false) {
					return(false);
				}
				return(eventRecording);
			}
			set {
				if(eventListSet == true) {
					if(value == true) {
						Raylib.start_automation_event_recording();
						eventRecording = true;
					} else {
						Raylib.stop_automation_event_recording();
						eventRecording = false;
					}
				}
			}
		}
		/**
		* Waiting for events on EndDrawing()
		* true: no automatic event polling.
		* false: automatic event polling.
		*/
		public bool event_waiting {
			get {
				return(this.eventWaiting);
			}
			set {
				if(value == true) {
					Raylib.disable_event_waiting();
					this.eventWaiting = true;
				} else {
					Raylib.enable_event_waiting();
					this.eventWaiting = false;
				}
			}
		}
	}
}
