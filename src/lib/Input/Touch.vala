using RaylibOOP.Shapes;

namespace RaylibOOP {
	namespace Input {
		public class Touch : GLib.Object {
			public class Gestures {
				private Gestures() {
					return;
				}
			}
			private Touch() {
				return;
			}
			/* Methods */
			/**
			* Get touch position XY for a touch point index (relative to screen size)
			*/
			public static Vector2 get_position(int index) {
				var a = Raylib.get_touch_position(index);
				return(new Vector2(a.x, a.y));
			}
			/**
			* Get touch point identifier for given index.
			*/
			public static int get_id(int index) {
				return(Raylib.get_touch_point_id(index));
			}
			/* Properties */
			/**
			* Touch position X for touch point 0 (relative to screen size)
			*/
			public static int x {
				get {
					return(Raylib.get_touch_x());
				}
			}
			/**
			* Touch position Y for touch point 0 (relative to screen size)
			*/
			public static int y {
				get {
					return(Raylib.get_touch_y());
				}
			}
			/**
			* Get number of touch points.
			*/
			public static int point_count {
				get {
					return(Raylib.get_touch_point_count());
				}
			}
		}
	}
}
