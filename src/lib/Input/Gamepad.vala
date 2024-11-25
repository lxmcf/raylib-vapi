namespace RaylibOOP {
    namespace Input {
        public class Gamepad : GLib.Object {

            /* Enums */
            public enum Axis {
                LEFT_X = Raylib.GamepadAxis.LEFT_X,
                LEFT_Y = Raylib.GamepadAxis.LEFT_Y,
                RIGHT_X = Raylib.GamepadAxis.RIGHT_X,
                RIGHT_Y = Raylib.GamepadAxis.RIGHT_Y,
                LEFT_TRIGGER = Raylib.GamepadAxis.LEFT_TRIGGER,
                RIGHT_TRIGGER = Raylib.GamepadAxis.RIGHT_TRIGGER
            }

            public enum Button {
                UNKNOWN = Raylib.GamepadButton.UNKNOWN,
                LEFT_FACE_UP = Raylib.GamepadButton.LEFT_FACE_UP,
                LEFT_FACE_RIGHT = Raylib.GamepadButton.LEFT_FACE_RIGHT,
                LEFT_FACE_DOWN = Raylib.GamepadButton.LEFT_FACE_DOWN,
                LEFT_FACE_LEFT = Raylib.GamepadButton.LEFT_FACE_LEFT,
                RIGHT_FACE_UP = Raylib.GamepadButton.RIGHT_FACE_UP,
                RIGHT_FACE_RIGHT = Raylib.GamepadButton.RIGHT_FACE_RIGHT,
                RIGHT_FACE_DOWN = Raylib.GamepadButton.RIGHT_FACE_DOWN,
                RIGHT_FACE_LEFT = Raylib.GamepadButton.RIGHT_FACE_LEFT,
                LEFT_TRIGGER_1 = Raylib.GamepadButton.LEFT_TRIGGER_1,
                LEFT_TRIGGER_2 = Raylib.GamepadButton.LEFT_TRIGGER_2,
                RIGHT_TRIGGER_1 = Raylib.GamepadButton.RIGHT_TRIGGER_1,
                RIGHT_TRIGGER_2 = Raylib.GamepadButton.RIGHT_TRIGGER_2,
                MIDDLE_LEFT = Raylib.GamepadButton.MIDDLE_LEFT,
                MIDDLE = Raylib.GamepadButton.MIDDLE,
                MIDDLE_RIGHT = Raylib.GamepadButton.MIDDLE_RIGHT,
                LEFT_THUMB = Raylib.GamepadButton.LEFT_THUMB,
                RIGHT_THUMB = Raylib.GamepadButton.RIGHT_THUMB
            }

            /* Variables */
            internal int padID;
            internal string padName;
            /* Constructor */
            public Gamepad (int gamepad) throws GLib.Error {
                if (Raylib.is_gamepad_available (gamepad) == false) {
                    throw new GLib.Error (
                                          GLib.Quark.from_string ("Gamepad"),
                                          1,
                                          @"The gamepad specified, $(gamepad), is not available.");
                }
                this.padID = gamepad;
                this.padName = this.name;
                return;
            }

            /* Methods */
            /**
             * Checks if the gamepad is still available.
             */
            public bool still_around () {
                return (Raylib.is_gamepad_available (this.padID));
            }

            /**
             * Check if a button has been pressed once.
             */
            public bool is_button_pressed (Gamepad.Button button) throws GLib.Error {
                if (!still_around ()) {
                    throw new GLib.Error (
                                          GLib.Quark.from_string ("Gamepad"),
                                          1,
                                          @"The gamepad specified, $(this.padID):$(this.padName), is no longer available."
                    );
                }
                return (Raylib.is_gamepad_button_pressed (this.padID, (Raylib.GamepadButton) button));
            }

            /**
             * Check if a button is being pressed.
             */
            public bool is_button_down (Gamepad.Button button) throws GLib.Error {
                if (!still_around ()) {
                    throw new GLib.Error (
                                          GLib.Quark.from_string ("Gamepad"),
                                          1,
                                          @"The gamepad specified, $(this.padID):$(this.padName), is no longer available."
                    );
                }
                return (Raylib.is_gamepad_button_down (this.padID, (Raylib.GamepadButton) button));
            }

            /**
             * Check if a button has been released once.
             */
            public bool is_button_released (Gamepad.Button button) throws GLib.Error {
                if (!still_around ()) {
                    throw new GLib.Error (
                                          GLib.Quark.from_string ("Gamepad"),
                                          1,
                                          @"The gamepad specified, $(this.padID):$(this.padName), is no longer available."
                    );
                }
                return (Raylib.is_gamepad_button_released (this.padID, (Raylib.GamepadButton) button));
            }

            /**
             * Check if a button is NOT being pressed.
             */
            public bool is_button_up (Gamepad.Button button) throws GLib.Error {
                if (!still_around ()) {
                    throw new GLib.Error (
                                          GLib.Quark.from_string ("Gamepad"),
                                          1,
                                          @"The gamepad specified, $(this.padID):$(this.padName), is no longer available."
                    );
                }
                return (Raylib.is_gamepad_button_up (this.padID, (Raylib.GamepadButton) button));
            }

            /**
             * Get axis movement value for an axis.
             */
            public float get_axis_movement (Gamepad.Axis axis) throws GLib.Error {
                if (!still_around ()) {
                    throw new GLib.Error (
                                          GLib.Quark.from_string ("Gamepad"),
                                          1,
                                          @"The gamepad specified, $(this.padID):$(this.padName), is no longer available."
                    );
                }
                return (Raylib.get_gamepad_axis_movement (this.padID, (Raylib.GamepadAxis) axis));
            }

            /**
             * Set internal mappings (SDL_GameControllerDB)
             */
            public int set_mappings (string mappings) throws GLib.Error {
                if (!still_around ()) {
                    throw new GLib.Error (
                                          GLib.Quark.from_string ("Gamepad"),
                                          1,
                                          @"The gamepad specified, $(this.padID):$(this.padName), is no longer available."
                    );
                }
                return (Raylib.set_gamepad_mappings (mappings));
            }

            /* Properties */
            /**
             * Get internal name id.
             */
            public string name {
                owned get {
                    /* Update pad name */
                    var name = Raylib.get_gamepad_name (this.padID);
                    this.padName = name;
                    return (name);
                }
            }
            /**
             * Get the last button pressed.
             */
            public Raylib.GamepadButton button_pressed {
                get {
                    return (Raylib.get_gamepad_button_pressed ());
                }
            }
            /**
             * Get axis count for gamepad.
             */
            public int axis_count {
                get {
                    return (Raylib.get_gamepad_axis_count (this.padID));
                }
            }
        }
    }
}
