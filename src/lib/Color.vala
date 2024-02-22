using RaylibOOP.Util;

namespace RaylibOOP {
	public class Color : GLib.Object {
		/* Variables */
		internal Raylib.Color iColor;
		/* Constructors */
		/**
		* Creates a color from rgba
		*/
		public Color.from_rgba(uint8 r, uint8 g, uint8 b, uint8 a) {
			this.iColor.r = r;
			this.iColor.g = g;
			this.iColor.b = b;
			this.iColor.a = a;
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
			this.iColor.r = ((hex_to_uint8(rrggbbaa[index])*16)+hex_to_uint8(rrggbbaa[index+1]));
			this.iColor.g = ((hex_to_uint8(rrggbbaa[index+2])*16)+hex_to_uint8(rrggbbaa[index+3]));
			this.iColor.b = ((hex_to_uint8(rrggbbaa[index+4])*16)+hex_to_uint8(rrggbbaa[index+5]));
			this.iColor.a = ((hex_to_uint8(rrggbbaa[index+6])*16)+hex_to_uint8(rrggbbaa[index+7]));
		}
		/**
		* Creates the object from a Raylib.Color struct
		*/
		public Color.from_raylib_color(Raylib.Color color) {
			this.iColor.r = color.r;
			this.iColor.g = color.g;
			this.iColor.b = color.b;
			this.iColor.a = color.a;
		}
		/* Properties */
		/**
		* Red
		*/
		public uint8 r {
			get {
				return(this.iColor.r);
			}
			set {
				this.iColor.r = value;
			}
		}
		/**
		* Green
		*/
		public uint8 g {
			get {
				return(this.iColor.g);
			}
			set {
				this.iColor.g = value;
			}
		}
		/**
		* Blue
		*/
		public uint8 b {
			get {
				return(this.iColor.b);
			}
			set {
				this.iColor.b = value;
			}
		}
		/**
		* Alpha
		*/
		public uint8 a {
			get {
				return(this.iColor.a);
			}
			set {
				this.iColor.a = value;
			}
		}
		/* Pre-defined colors. This is awful, but I don't see another way without
		 * needing to use Raylib directly. Which is something I want to avoid. */
		public static Color LIGHT_GRAY {
			owned get {
				return(new Color.from_raylib_color(Raylib.LIGHTGRAY));
			}
		}
		public static Color GRAY {
			owned get {
				return(new Color.from_raylib_color(Raylib.GRAY));
			}
		}
		public static Color DARK_GRAY {
			owned get {
				return(new Color.from_raylib_color(Raylib.DARKGRAY));
			}
		}
		public static Color YELLOW {
			owned get {
				return(new Color.from_raylib_color(Raylib.YELLOW));
			}
		}
		public static Color GOLD {
			owned get {
				return(new Color.from_raylib_color(Raylib.GOLD));
			}
		}
		public static Color ORANGE {
			owned get {
				return(new Color.from_raylib_color(Raylib.ORANGE));
			}
		}
		public static Color PINK {
			owned get {
				return(new Color.from_raylib_color(Raylib.PINK));
			}
		}
		public static Color RED {
			owned get {
				return(new Color.from_raylib_color(Raylib.RED));
			}
		}
		public static Color MAROON {
			owned get {
				return(new Color.from_raylib_color(Raylib.MAROON));
			}
		}
		public static Color GREEN {
			owned get {
				return(new Color.from_raylib_color(Raylib.GREEN));
			}
		}
		public static Color LIME {
			owned get {
				return(new Color.from_raylib_color(Raylib.LIME));
			}
		}
		public static Color DARK_GREEN {
			owned get {
				return(new Color.from_raylib_color(Raylib.DARKGREEN));
			}
		}
		public static Color SKY_BLUE {
			owned get {
				return(new Color.from_raylib_color(Raylib.SKYBLUE));
			}
		}
		public static Color BLUE {
			owned get {
				return(new Color.from_raylib_color(Raylib.BLUE));
			}
		}
		public static Color DARK_BLUE {
			owned get {
				return(new Color.from_raylib_color(Raylib.DARKBLUE));
			}
		}
		public static Color PURPLE {
			owned get {
				return(new Color.from_raylib_color(Raylib.PURPLE));
			}
		}
		public static Color VIOLET {
			owned get {
				return(new Color.from_raylib_color(Raylib.VIOLET));
			}
		}
		public static Color DARK_PURPLE {
			owned get {
				return(new Color.from_raylib_color(Raylib.DARKPURPLE));
			}
		}
		public static Color BEIGE {
			owned get {
				return(new Color.from_raylib_color(Raylib.BEIGE));
			}
		}
		public static Color BROWN {
			owned get {
				return(new Color.from_raylib_color(Raylib.BROWN));
			}
		}
		public static Color DARK_BROWN {
			owned get {
				return(new Color.from_raylib_color(Raylib.DARKBROWN));
			}
		}
		public static Color WHITE {
			owned get {
				return(new Color.from_raylib_color(Raylib.WHITE));
			}
		}
		public static Color BLACK {
			owned get {
				return(new Color.from_raylib_color(Raylib.BLACK));
			}
		}
		public static Color BLANK {
			owned get {
				return(new Color.from_raylib_color(Raylib.BLANK));
			}
		}
		public static Color MAGENTA {
			owned get {
				return(new Color.from_raylib_color(Raylib.MAGENTA));
			}
		}
		public static Color RAY_WHITE {
			owned get {
				return(new Color.from_raylib_color(Raylib.RAYWHITE));
			}
		}
	}
}
