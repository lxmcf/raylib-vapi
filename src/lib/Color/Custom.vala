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
	}
}
