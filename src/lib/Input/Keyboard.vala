using RaylibOOP;
using RaylibOOP.Shapes;

namespace RaylibOOP {
	namespace Input {
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
	}
}
