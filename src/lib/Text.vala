namespace RaylibOOP {
	public class Font : GLib.Object {
		internal Raylib.Font iFont;
		/* Default font, see Window object for initialization */
		public static Font DEFAULT;
		/* Constructors */
		/**
		* Load font from file.
		*/
		public Font(string? fontFile) {
			if(fontFile == null) {
				iFont = Raylib.get_font_default();
			} else {
				iFont = Raylib.load_font(fontFile);
			}
		}
		/**
		* Loads font from memory.
		*/
		public Font.from_memory(uint8[] font, string type, int size, int[] characters) {
			iFont = Raylib.load_font_from_memory(type, font, size, characters);
			return;
		}
		/* Initializes default font */
		internal Font.default() {
			iFont = Raylib.get_font_default();
		}
		/* Destructor */
		~Font() {
			Raylib.unload_font(iFont);
		}
		/* Methods */
		/**
		* Exports font data as C Code.
		* If you want vala code, please see bin2vala.
		*/
		public void export_as_code(string file) throws GLib.FileError {
			if(Raylib.export_font_as_code(this.iFont, file) == true) {
				return;
			}
			throw new GLib.FileError.FAILED("Failed to export font as code.");
		}
		/**
		* Draw text on screen.
		*/
		public void draw_text(string text, Shapes.Vector2 xy, float size, float? spacing, Color color) {
			float s;
			float defaultFontSize = 10;
			if(spacing == null) {
				s = size/defaultFontSize;
			} else {
				s = spacing;
			}
			Raylib.draw_text_ext(this.iFont, text, xy.iVector, size, s, color.iColor);
			return;
		}
		/* Properties */
		public bool ready {
			get {
				return(Raylib.is_font_ready(this.iFont));
			}
		}
	}
}
