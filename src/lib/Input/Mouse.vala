using RaylibOOP.Shapes;

namespace RaylibOOP {
	namespace Input {
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
