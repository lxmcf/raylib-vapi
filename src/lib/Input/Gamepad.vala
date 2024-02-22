namespace RaylibOOP {
	namespace Input {
		public class Gamepad : GLib.Object {
			/* Variables */
			internal int padID;
			internal string padName;
			/* Constructor */
			public Gamepad(int gamepad) throws GLib.Error {
				if(Raylib.is_gamepad_available(gamepad) == false) {
					throw new GLib.Error(
						GLib.Quark.from_string("Gamepad"),
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
						@"The gamepad specified, $(this.padID):$(this.padName), is no longer available."
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
						@"The gamepad specified, $(this.padID):$(this.padName), is no longer available."
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
						@"The gamepad specified, $(this.padID):$(this.padName), is no longer available."
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
						@"The gamepad specified, $(this.padID):$(this.padName), is no longer available."
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
						@"The gamepad specified, $(this.padID):$(this.padName), is no longer available."
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
						@"The gamepad specified, $(this.padID):$(this.padName), is no longer available."
					);
				}
				return(Raylib.set_gamepad_mappings(mappings));
			}
			/* Properties */
			/**
			* Get internal name id.
			*/
			public string name {
				owned get {
					/* Update pad name */
					var name = Raylib.get_gamepad_name(this.padID);
					this.padName = name;
					return(name);
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
			public int axis_count {
				get {
					return(Raylib.get_gamepad_axis_count(this.padID));
				}
			}
		}
	}
}
