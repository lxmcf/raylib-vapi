using RaylibOOP.Shapes;

namespace RaylibOOP {
	namespace Input {
		public class Touch : GLib.Object {
			/* Variables */
			public enum Gestures {
				DOUBLE_TAP  = Raylib.Gesture.DOUBLETAP,
				DRAG        = Raylib.Gesture.DRAG,
				HOLD        = Raylib.Gesture.HOLD,
				NONE        = Raylib.Gesture.NONE,
				PINCH_IN    = Raylib.Gesture.PINCH_IN,
				PINCH_OUT   = Raylib.Gesture.PINCH_OUT,
				SWIPE_DOWN  = Raylib.Gesture.SWIPE_DOWN,
				SWIPE_LEFT  = Raylib.Gesture.SWIPE_LEFT,
				SWIPE_RIGHT = Raylib.Gesture.SWIPE_RIGHT,
				SWIPE_UP    = Raylib.Gesture.SWIPE_UP,
				TAP         = Raylib.Gesture.TAP,
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
			/* Gestures */
			/**
			* Enable a set of gestures using flags
			*/
			public static void enable_gestures(int gestures) {
				Raylib.set_gestures_enabled(gestures);
			}
			/**
			* Check if a gesture have been detected
			*/
			public static bool is_gesture_detected(int gesture) {
				return(Raylib.is_gesture_detected(gesture));
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
			/* Gestures */
			/**
			* Get latest detected gesture
			*/
			public static int detected_gesture {
				get {
					return(Raylib.get_gesture_detected());
				}
			}
			/**
			* Gesture hold time in milliseconds
			*/
			public static float hold_duration {
				get {
					return(Raylib.get_gesture_hold_duration());
				}
			}
			/**
			* Gesture drag vector
			*/
			public static Vector2 drag_vector {
				owned get {
					var a = Raylib.get_gesture_drag_vector();
					return(new Vector2(a.x, a.y));
				}
			}
			/**
			* Gesture drag angle
			*/
			public static float drag_angle {
				get {
					return(Raylib.get_gesture_drag_angle());
				}
			}
			/**
			* Gesture pinch delta
			*/
			public static Vector2 pinch_vector {
				owned get {
					var a = Raylib.get_gesture_pinch_vector();
					return(new Vector2(a.x, a.y));
				}
			}
			/**
			* Gesture pinch angle
			*/
			public static float pinch_angle {
				get {
					return(Raylib.get_gesture_pinch_angle());
				}
			}
		}
	}
}
