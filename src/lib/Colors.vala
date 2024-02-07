using Raylib;
using RaylibOOP.Util;

namespace RaylibOOP {
	namespace Color {
		public class Custom : GLib.Object {
			public static Raylib.Color from_rgba(uint8 r, uint8 g, uint8 b, uint8 a) {
				return({r,g,b,a});
			}
			public static Raylib.Color from_html_code(string rrggbbaa) {
				/* Convert the HTML code to rbga and return it. */
				int index = 0;
				if(rrggbbaa[0] == '#') { // Skip hashtag.
					index++;
				}
				Raylib.Color color = {0,0,0,0};
				color.r = ((hex_to_uint8(rrggbbaa[index])*16)+hex_to_uint8(rrggbbaa[index+1]));
				color.g = ((hex_to_uint8(rrggbbaa[index+2])*16)+hex_to_uint8(rrggbbaa[index+3]));
				color.b = ((hex_to_uint8(rrggbbaa[index+4])*16)+hex_to_uint8(rrggbbaa[index+5]));
				color.a = ((hex_to_uint8(rrggbbaa[index+6])*16)+hex_to_uint8(rrggbbaa[index+7]));
				return(color);
			}

			private Custom() {
				return;
			}
		}
		public const Raylib.Color LIGHT_GRAY  = Raylib.LIGHTGRAY;
		public const Raylib.Color GRAY        = Raylib.GRAY;
		public const Raylib.Color DARK_GRAY   = Raylib.DARKGRAY;
		public const Raylib.Color YELLOW      = Raylib.YELLOW;
		public const Raylib.Color GOLD        = Raylib.GOLD;
		public const Raylib.Color ORANGE      = Raylib.ORANGE;
		public const Raylib.Color PINK        = Raylib.PINK;
		public const Raylib.Color RED         = Raylib.RED;
		public const Raylib.Color MAROON      = Raylib.MAROON;
		public const Raylib.Color GREEN       = Raylib.GREEN;
		public const Raylib.Color LIME        = Raylib.LIME;
		public const Raylib.Color DARK_GREEN  = Raylib.DARKGREEN;
		public const Raylib.Color SKY_BLUE    = Raylib.SKYBLUE;
		public const Raylib.Color BLUE        = Raylib.BLUE;
		public const Raylib.Color DARK_BLUE   = Raylib.DARKBLUE;
		public const Raylib.Color PURPLE      = Raylib.PURPLE;
		public const Raylib.Color VIOLET      = Raylib.VIOLET;
		public const Raylib.Color DARK_PURPLE = Raylib.DARKPURPLE;
		public const Raylib.Color BEIGE       = Raylib.BEIGE;
		public const Raylib.Color BROWN       = Raylib.BROWN;
		public const Raylib.Color DARK_BROWN  = Raylib.DARKBROWN;
		public const Raylib.Color WHITE       = Raylib.WHITE;
		public const Raylib.Color BLACK       = Raylib.BLACK;
		public const Raylib.Color BLANK       = Raylib.BLANK;
		public const Raylib.Color MAGENTA     = Raylib.MAGENTA;
		public const Raylib.Color RAY_WHITE   = Raylib.RAYWHITE;
	}
}
