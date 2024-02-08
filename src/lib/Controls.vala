using RaylibOOP;
using RaylibOOP.Shapes;

namespace RaylibOOP {
	namespace Input {
		public class Gamepad : GLib.Object {
			/* Variables */
			internal int padID;
			/* Constructor */
			public Gamepad(int gamepad) throws GLib.Error {
				if(Raylib.is_gamepad_available(gamepad) == false) {
					throw new GLib.Error(
						GLib.Quark.from_string("Gamepad"),
						1,
						@"The gamepad specified, $(gamepad), is not available.");
				}
				this.padID = gamepad;
				return;
			}
			/* Methods */
			/**
			* Checks if the gamepad is still available.
			*/
			public bool still_around() {
				return(Raylib.is_gamepad_available(this.padID));
			}
			/**
			* Check if a button has been pressed once.
			*/
			public bool is_button_pressed(Raylib.GamepadButton button) throws GLib.Error {
				if(!still_around()) {
					throw new GLib.Error(
						GLib.Quark.from_string("Gamepad"),
						1,
						@"The gamepad specified, $(this.padID), is no longer available."
					);
				}
				return(Raylib.is_gamepad_button_pressed(this.padID, button));
			}
			/**
			* Check if a button is being pressed.
			*/
			public bool is_button_down(Raylib.GamepadButton button) throws GLib.Error {
				if(!still_around()) {
					throw new GLib.Error(
						GLib.Quark.from_string("Gamepad"),
						1,
						@"The gamepad specified, $(this.padID), is no longer available."
					);
				}
				return(Raylib.is_gamepad_button_down(this.padID, button));
			}
			/**
			* Check if a button has been released once.
			*/
			public bool is_button_released(Raylib.GamepadButton button) throws GLib.Error {
				if(!still_around()) {
					throw new GLib.Error(
						GLib.Quark.from_string("Gamepad"),
						1,
						@"The gamepad specified, $(this.padID), is no longer available."
					);
				}
				return(Raylib.is_gamepad_button_released(this.padID, button));
			}
			/**
			* Check if a button is NOT being pressed.
			*/
			public bool is_button_up(Raylib.GamepadButton button) throws GLib.Error {
				if(!still_around()) {
					throw new GLib.Error(
						GLib.Quark.from_string("Gamepad"),
						1,
						@"The gamepad specified, $(this.padID), is no longer available."
					);
				}
				return(Raylib.is_gamepad_button_up(this.padID, button));
			}
			/**
			* Get axis movement value for an axis.
			*/
			public float get_axis_movement(Raylib.GamepadAxis axis) throws GLib.Error {
				if(!still_around()) {
					throw new GLib.Error(
						GLib.Quark.from_string("Gamepad"),
						1,
						@"The gamepad specified, $(this.padID), is no longer available."
					);
				}
				return(Raylib.get_gamepad_axis_movement(this.padID, axis));
			}
			/**
			* Set internal mappings (SDL_GameControllerDB)
			*/
			public int set_mappings(string mappings) throws GLib.Error {
				if(!still_around()) {
					throw new GLib.Error(
						GLib.Quark.from_string("Gamepad"),
						1,
						@"The gamepad specified, $(this.padID), is no longer available."
					);
				}
				return(Raylib.set_gamepad_mappings(mappings));
			}
			/* Properties */
			/**
			* Get internal name id.
			*/
			public string name {
				get {
					return(@"$(Raylib.get_gamepad_name(this.padID))");
				}
			}
			/**
			* Get the last button pressed.
			*/
			public Raylib.GamepadButton button_pressed {
				get {
					return(Raylib.get_gamepad_button_pressed());
				}
			}
			/**
			* Get axis count for gamepad.
			*/
			public Raylib.GamepadAxis axis_count {
				get {
					return(Raylib.get_gamepad_axis_count(this.padID));
				}
			}
		}

		public class Keyboard : GLib.Object {
			private Keyboard() {
				return;
			}
			/* Methods */
			/**
			* Check if a key has been pressed once.
			*/
			public static bool is_key_pressed(Raylib.KeyboardKey key) {
				return(Raylib.is_key_pressed(key));
			}
			/**
			* Check if a key has been pressed again (Only PLATFORM_DESKTOP)
			*/
			public static bool is_key_pressed_repeat(Raylib.KeyboardKey key) {
				return(Raylib.is_key_pressed_repeat(key));
			}
			/**
			* Check if a key is being pressed.
			*/
			public static bool is_key_down(Raylib.KeyboardKey key) {
				return(Raylib.is_key_down(key));
			}
			/**
			* Check if a key has been released once.
			*/
			public static bool is_key_released(Raylib.KeyboardKey key) {
				return(Raylib.is_key_released(key));
			}
			/**
			* Check if a key is NOT being pressed.
			*/
			public static bool is_key_up(Raylib.KeyboardKey key) {
				return(Raylib.is_key_up(key));
			}
			/* Properties */
			/**
			* Get key pressed (keycode), call it multiple times for keys queued, returns 0 when the queue is empty.
			*/
			public static Raylib.KeyboardKey key_pressed {
				get {
					return(Raylib.get_key_pressed());
				}
			}
			/**
			* Get char pressed (unicode), call it multiple times for chars queued, returns 0 when the queue is empty.
			*/
			public static int char_pressed {
				get {
					return(Raylib.get_char_pressed());
				}
			}
		}
		public class Mouse : GLib.Object {
			/* Variables */
			internal static Raylib.Vector2 scaleVector = {1, 1};
			public enum Button { /* I wish there was a better way to do this */
				LEFT    = Raylib.MouseButton.LEFT,
				RIGHT   = Raylib.MouseButton.RIGHT,
				MIDDLE  = Raylib.MouseButton.MIDDLE,
				SIDE    = Raylib.MouseButton.SIDE,
				EXTRA   = Raylib.MouseButton.EXTRA,
				FORWARD = Raylib.MouseButton.FORWARD,
				BACK    = Raylib.MouseButton.BACK,
			}
			private Mouse() {
				return;
			}
			/* Methods */
			/**
			* Check if a mouse button has been pressed once
			*/
			public static bool is_pressed(int button) {
				return(Raylib.is_mouse_button_pressed(button));
			}
			/**
			* Check if a mouse button is being pressed
			*/
			public static bool is_down(int button) {
				return(Raylib.is_mouse_button_down(button));
			}
			/**
			* Check if a mouse button has been released once
			*/
			public static bool is_released(int button) {
				return(Raylib.is_mouse_button_released(button));
			}
			/**
			* Check if a mouse button is NOT being pressed
			*/
			public static bool is_up(int button) {
				return(Raylib.is_mouse_button_up(button));
			}
			/* Properties */
			/**
			* Mouse position XY
			*/
			public static Vector2 position {
				owned get {
					Raylib.Vector2 a = Raylib.get_mouse_position();
					return(new Vector2(a.x, a.y));
				}
				set {
					Vector2 a = value;
					Raylib.set_mouse_position((int)Math.ceilf(a.x), (int)Math.ceilf(a.y));
				}
			}
			/**
			* Mouse delta between frames
			*/
			public static Vector2 delta {
				owned get {
					Raylib.Vector2 a = Raylib.get_mouse_delta();
					return(new Vector2(a.x, a.y));
				}
			}
			/**
			* Mouse scaling
			*/
			public static Vector2 scale {
				owned get {
					return(new Vector2(scaleVector.x, scaleVector.y));
				}
				set {
					Vector2 a = value;
					Raylib.set_mouse_scale(a.x, a.y);
				}
			}
			/**
			* Mouse position X
			*/
			public static int x {
				get {
					return(Raylib.get_mouse_x());
				}
				set {
					Raylib.set_mouse_position(value, Raylib.get_mouse_y());
				}
			}
			/**
			* Mouse position Y
			*/
			public static int y {
				get {
					return(Raylib.get_mouse_y());
				}
				set {
					Raylib.set_mouse_position(Raylib.get_mouse_x(), value);
				}
			}
		}
	}
}
