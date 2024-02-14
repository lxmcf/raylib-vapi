using RaylibOOP.Util;

namespace RaylibOOP {
	public class Color : GLib.Object {
		/* Variables */
		public static Color LIGHT_GRAY         = new Color.from_raylib_color(Raylib.LIGHTGRAY);
		public static Color GRAY               = new Color.from_raylib_color(Raylib.GRAY);
		public static Color DARK_GRAY          = new Color.from_raylib_color(Raylib.DARKGRAY);
		public static Color YELLOW             = new Color.from_raylib_color(Raylib.YELLOW);
		public static Color GOLD               = new Color.from_raylib_color(Raylib.GOLD);
		public static Color ORANGE             = new Color.from_raylib_color(Raylib.ORANGE);
		public static Color PINK               = new Color.from_raylib_color(Raylib.PINK);
		public static Color RED                = new Color.from_raylib_color(Raylib.RED);
		public static Color MAROON             = new Color.from_raylib_color(Raylib.MAROON);
		public static Color GREEN              = new Color.from_raylib_color(Raylib.GREEN);
		public static Color LIME               = new Color.from_raylib_color(Raylib.LIME);
		public static Color DARK_GREEN         = new Color.from_raylib_color(Raylib.DARKGREEN);
		public static Color SKY_BLUE           = new Color.from_raylib_color(Raylib.SKYBLUE);
		public static Color BLUE               = new Color.from_raylib_color(Raylib.BLUE);
		public static Color DARK_BLUE          = new Color.from_raylib_color(Raylib.DARKBLUE);
		public static Color PURPLE             = new Color.from_raylib_color(Raylib.PURPLE);
		public static Color VIOLET             = new Color.from_raylib_color(Raylib.VIOLET);
		public static Color DARK_PURPLE        = new Color.from_raylib_color(Raylib.DARKPURPLE);
		public static Color BEIGE              = new Color.from_raylib_color(Raylib.BEIGE);
		public static Color BROWN              = new Color.from_raylib_color(Raylib.BROWN);
		public static Color DARK_BROWN         = new Color.from_raylib_color(Raylib.DARKBROWN);
		public static Color WHITE              = new Color.from_raylib_color(Raylib.WHITE);
		public static Color BLACK              = new Color.from_raylib_color(Raylib.BLACK);
		public static Color BLANK              = new Color.from_raylib_color(Raylib.BLANK);
		public static Color MAGENTA            = new Color.from_raylib_color(Raylib.MAGENTA);
		public static Color RAY_WHITE          = new Color.from_raylib_color(Raylib.RAYWHITE);
		/**
		* Red
		*/
		public uint8 r;
		/**
		* Green
		*/
		public uint8 g;
		/**
		* Blue
		*/
		public uint8 b;
		/**
		* Alpha
		*/
		public uint8 a;
		/* Constructors */
		/**
		* Creates a color from rgba
		*/
		public Color.from_rgba(uint8 r, uint8 g, uint8 b, uint8 a) {
			this.r = r;
			this.g = g;
			this.b = b;
			this.a = a;
		}
		/**
		* Creates a color from a traditional HTML rgba code.
		*/
		public Color.from_html_code(string rrggbbaa) {
			/* Convert the HTML code to rbga and return it. */
			int index = 0;
			if(rrggbbaa[0] == '#') { // Skip hashtag.
				index++;
			}
			this.r = ((hex_to_uint8(rrggbbaa[index])*16)+hex_to_uint8(rrggbbaa[index+1]));
			this.g = ((hex_to_uint8(rrggbbaa[index+2])*16)+hex_to_uint8(rrggbbaa[index+3]));
			this.b = ((hex_to_uint8(rrggbbaa[index+4])*16)+hex_to_uint8(rrggbbaa[index+5]));
			this.a = ((hex_to_uint8(rrggbbaa[index+6])*16)+hex_to_uint8(rrggbbaa[index+7]));
		}
		/**
		* Creates the object from a Raylib.Color struct
		*/
		public Color.from_raylib_color(Raylib.Color color) {
			this.r = color.r;
			this.g = color.g;
			this.b = color.b;
			this.a = color.a;
		}
	}
}
