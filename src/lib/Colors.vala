using Raylib;
using Raylib.OOP.Util;

namespace Raylib {
	namespace OOP {
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
			const Raylib.Color LIGHT_GRAY  = Raylib.LIGHTGRAY;
			const Raylib.Color GRAY        = Raylib.GRAY;
			const Raylib.Color DARK_GRAY   = Raylib.DARKGRAY;
			const Raylib.Color YELLOW      = Raylib.YELLOW;
			const Raylib.Color GOLD        = Raylib.GOLD;
			const Raylib.Color ORANGE      = Raylib.ORANGE;
			const Raylib.Color PINK        = Raylib.PINK;
			const Raylib.Color RED         = Raylib.RED;
			const Raylib.Color MAROON      = Raylib.MAROON;
			const Raylib.Color GREEN       = Raylib.GREEN;
			const Raylib.Color LIME        = Raylib.LIME;
			const Raylib.Color DARK_GREEN  = Raylib.DARKGREEN;
			const Raylib.Color SKY_BLUE    = Raylib.SKYBLUE;
			const Raylib.Color BLUE        = Raylib.BLUE;
			const Raylib.Color DARK_BLUE   = Raylib.DARKBLUE;
			const Raylib.Color PURPLE      = Raylib.PURPLE;
			const Raylib.Color VIOLET      = Raylib.VIOLET;
			const Raylib.Color DARK_PURPLE = Raylib.DARKPURPLE;
			const Raylib.Color BEIGE       = Raylib.BEIGE;
			const Raylib.Color BROWN       = Raylib.BROWN;
			const Raylib.Color DARK_BROWN  = Raylib.DARKBROWN;
			const Raylib.Color WHITE       = Raylib.WHITE;
			const Raylib.Color BLACK       = Raylib.BLACK;
			const Raylib.Color BLANK       = Raylib.BLANK;
			const Raylib.Color MAGENTA     = Raylib.MAGENTA;
			const Raylib.Color RAY_WHITE   = Raylib.RAYWHITE;
		}
	}
}
