using RaylibOOP;
using RaylibOOP.Shapes;

namespace RaylibOOP {
	namespace Input {
		public class Keyboard : GLib.Object {
			public enum Key {
				NULL            = Raylib.KeyboardKey.NULL,               // Key: NULL, used for no key pressed
				// Alphanumeric keys
				APOSTROPHE      = Raylib.KeyboardKey.APOSTROPHE,         // Key: '
				COMMA           = Raylib.KeyboardKey.COMMA,              // Key: ,
				MINUS           = Raylib.KeyboardKey.MINUS,              // Key: -
				PERIOD          = Raylib.KeyboardKey.PERIOD,             // Key: .
				SLASH           = Raylib.KeyboardKey.SLASH,              // Key: /
				ZERO            = Raylib.KeyboardKey.ZERO,               // Key: 0
				ONE             = Raylib.KeyboardKey.ONE,                // Key: 1
				TWO             = Raylib.KeyboardKey.TWO,                // Key: 2
				THREE           = Raylib.KeyboardKey.THREE,              // Key: 3
				FOUR            = Raylib.KeyboardKey.FOUR,               // Key: 4
				FIVE            = Raylib.KeyboardKey.FIVE,               // Key: 5
				SIX             = Raylib.KeyboardKey.SIX,                // Key: 6
				SEVEN           = Raylib.KeyboardKey.SEVEN,              // Key: 7
				EIGHT           = Raylib.KeyboardKey.EIGHT,              // Key: 8
				NINE            = Raylib.KeyboardKey.NINE,               // Key: 9
				SEMICOLON       = Raylib.KeyboardKey.SEMICOLON,          // Key: ;
				EQUAL           = Raylib.KeyboardKey.EQUAL,              // Key: =
				A               = Raylib.KeyboardKey.A,                  // Key: A | a
				B               = Raylib.KeyboardKey.B,                  // Key: B | b
				C               = Raylib.KeyboardKey.C,                  // Key: C | c
				D               = Raylib.KeyboardKey.D,                  // Key: D | d
				E               = Raylib.KeyboardKey.E,                  // Key: E | e
				F               = Raylib.KeyboardKey.F,                  // Key: F | f
				G               = Raylib.KeyboardKey.G,                  // Key: G | g
				H               = Raylib.KeyboardKey.H,                  // Key: H | h
				I               = Raylib.KeyboardKey.I,                  // Key: I | i
				J               = Raylib.KeyboardKey.J,                  // Key: J | j
				K               = Raylib.KeyboardKey.K,                  // Key: K | k
				L               = Raylib.KeyboardKey.L,                  // Key: L | l
				M               = Raylib.KeyboardKey.M,                  // Key: M | m
				N               = Raylib.KeyboardKey.N,                  // Key: N | n
				O               = Raylib.KeyboardKey.O,                  // Key: O | o
				P               = Raylib.KeyboardKey.P,                  // Key: P | p
				Q               = Raylib.KeyboardKey.Q,                  // Key: Q | q
				R               = Raylib.KeyboardKey.R,                  // Key: R | r
				S               = Raylib.KeyboardKey.S,                  // Key: S | s
				T               = Raylib.KeyboardKey.T,                  // Key: T | t
				U               = Raylib.KeyboardKey.U,                  // Key: U | u
				V               = Raylib.KeyboardKey.V,                  // Key: V | v
				W               = Raylib.KeyboardKey.W,                  // Key: W | w
				X               = Raylib.KeyboardKey.X,                  // Key: X | x
				Y               = Raylib.KeyboardKey.Y,                  // Key: Y | y
				Z               = Raylib.KeyboardKey.Z,                  // Key: Z | z
				LEFT_BRACKET    = Raylib.KeyboardKey.LEFT_BRACKET,       // Key: [
				BACKSLASH       = Raylib.KeyboardKey.BACKSLASH,          // Key: '\'
				RIGHT_BRACKET   = Raylib.KeyboardKey.RIGHT_BRACKET,      // Key: ]
				GRAVE           = Raylib.KeyboardKey.GRAVE,              // Key: `
				// Function keys
				SPACE           = Raylib.KeyboardKey.SPACE,              // Key: Space
				ESCAPE          = Raylib.KeyboardKey.ESCAPE,             // Key: Esc
				ENTER           = Raylib.KeyboardKey.ENTER,              // Key: Enter
				TAB             = Raylib.KeyboardKey.TAB,                // Key: Tab
				BACKSPACE       = Raylib.KeyboardKey.BACKSPACE,          // Key: Backspace
				INSERT          = Raylib.KeyboardKey.INSERT,             // Key: Ins
				DELETE          = Raylib.KeyboardKey.DELETE,             // Key: Del
				RIGHT           = Raylib.KeyboardKey.RIGHT,              // Key: Cursor right
				LEFT            = Raylib.KeyboardKey.LEFT,               // Key: Cursor left
				DOWN            = Raylib.KeyboardKey.DOWN,               // Key: Cursor down
				UP              = Raylib.KeyboardKey.UP,                 // Key: Cursor up
				PAGE_UP         = Raylib.KeyboardKey.PAGE_UP,            // Key: Page up
				PAGE_DOWN       = Raylib.KeyboardKey.PAGE_DOWN,          // Key: Page down
				HOME            = Raylib.KeyboardKey.HOME,               // Key: Home
				END             = Raylib.KeyboardKey.END,                // Key: End
				CAPS_LOCK       = Raylib.KeyboardKey.CAPS_LOCK,          // Key: Caps lock
				SCROLL_LOCK     = Raylib.KeyboardKey.SCROLL_LOCK,        // Key: Scroll down
				NUM_LOCK        = Raylib.KeyboardKey.NUM_LOCK,           // Key: Num lock
				PRINT_SCREEN    = Raylib.KeyboardKey.PRINT_SCREEN,       // Key: Print screen
				PAUSE           = Raylib.KeyboardKey.PAUSE,              // Key: Pause
				F1              = Raylib.KeyboardKey.F1,                 // Key: F1
				F2              = Raylib.KeyboardKey.F2,                 // Key: F2
				F3              = Raylib.KeyboardKey.F3,                 // Key: F3
				F4              = Raylib.KeyboardKey.F4,                 // Key: F4
				F5              = Raylib.KeyboardKey.F5,                 // Key: F5
				F6              = Raylib.KeyboardKey.F6,                 // Key: F6
				F7              = Raylib.KeyboardKey.F7,                 // Key: F7
				F8              = Raylib.KeyboardKey.F8,                 // Key: F8
				F9              = Raylib.KeyboardKey.F9,                 // Key: F9
				F10             = Raylib.KeyboardKey.F10,                // Key: F10
				F11             = Raylib.KeyboardKey.F11,                // Key: F11
				F12             = Raylib.KeyboardKey.F12,                // Key: F12
				LEFT_SHIFT      = Raylib.KeyboardKey.LEFT_SHIFT,         // Key: Shift left
				LEFT_CONTROL    = Raylib.KeyboardKey.LEFT_CONTROL,       // Key: Control left
				LEFT_ALT        = Raylib.KeyboardKey.LEFT_ALT,           // Key: Alt left
				LEFT_SUPER      = Raylib.KeyboardKey.LEFT_SUPER,         // Key: Super left
				RIGHT_SHIFT     = Raylib.KeyboardKey.RIGHT_SHIFT,        // Key: Shift right
				RIGHT_CONTROL   = Raylib.KeyboardKey.RIGHT_CONTROL,      // Key: Control right
				RIGHT_ALT       = Raylib.KeyboardKey.RIGHT_ALT,          // Key: Alt right
				RIGHT_SUPER     = Raylib.KeyboardKey.RIGHT_SUPER,        // Key: Super right
				KB_MENU         = Raylib.KeyboardKey.KB_MENU,            // Key: KB menu
				KP_0            = Raylib.KeyboardKey.KP_0,               // Key: Keypad 0
				KP_1            = Raylib.KeyboardKey.KP_1,               // Key: Keypad 1
				KP_2            = Raylib.KeyboardKey.KP_2,               // Key: Keypad 2
				KP_3            = Raylib.KeyboardKey.KP_3,               // Key: Keypad 3
				KP_4            = Raylib.KeyboardKey.KP_4,               // Key: Keypad 4
				KP_5            = Raylib.KeyboardKey.KP_5,               // Key: Keypad 5
				KP_6            = Raylib.KeyboardKey.KP_6,               // Key: Keypad 6
				KP_7            = Raylib.KeyboardKey.KP_7,               // Key: Keypad 7
				KP_8            = Raylib.KeyboardKey.KP_8,               // Key: Keypad 8
				KP_9            = Raylib.KeyboardKey.KP_9,               // Key: Keypad 9
				KP_DECIMAL      = Raylib.KeyboardKey.KP_DECIMAL,         // Key: Keypad .
				KP_DIVIDE       = Raylib.KeyboardKey.KP_DIVIDE,          // Key: Keypad /
				KP_MULTIPLY     = Raylib.KeyboardKey.KP_MULTIPLY,        // Key: Keypad *
				KP_SUBTRACT     = Raylib.KeyboardKey.KP_SUBTRACT,        // Key: Keypad -
				KP_ADD          = Raylib.KeyboardKey.KP_ADD,             // Key: Keypad +
				KP_ENTER        = Raylib.KeyboardKey.KP_ENTER,           // Key: Keypad Enter
				KP_EQUAL        = Raylib.KeyboardKey.KP_EQUAL,           // Key: Keypad =
				BACK            = Raylib.KeyboardKey.BACK,               // Key: Android back button
				MENU            = Raylib.KeyboardKey.MENU,               // Key: Android menu button
				VOLUME_UP       = Raylib.KeyboardKey.VOLUME_UP,          // Key: Android volume up button
				VOLUME_DOWN     = Raylib.KeyboardKey.VOLUME_DOWN         // Key: Android volume down button

			}
			private Keyboard() {
				return;
			}
			/* Methods */
			/**
			* Check if a key has been pressed once.
			*/
			public static bool is_key_pressed(int key) {
				return(Raylib.is_key_pressed(key));
			}
			/**
			* Check if a key has been pressed again (Only PLATFORM_DESKTOP)
			*/
			public static bool is_key_pressed_repeat(int key) {
				return(Raylib.is_key_pressed_repeat(key));
			}
			/**
			* Check if a key is being pressed.
			*/
			public static bool is_key_down(int key) {
				return(Raylib.is_key_down(key));
			}
			/**
			* Check if a key has been released once.
			*/
			public static bool is_key_released(int key) {
				return(Raylib.is_key_released(key));
			}
			/**
			* Check if a key is NOT being pressed.
			*/
			public static bool is_key_up(int key) {
				return(Raylib.is_key_up(key));
			}
			/* Properties */
			/**
			* Get key pressed (keycode), call it multiple times for keys queued, returns 0 when the queue is empty.
			*/
			public static int key_pressed {
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
