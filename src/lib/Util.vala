namespace Raylib {
	namespace OOP {
		namespace Util {
			uint8 hex_to_uint8(char a) {
				uint8 base10_a;
				switch(a.tolower()) {
					case 'a':
						base10_a = 10;
						break;
					case 'b':
						base10_a = 11;
						break;
					case 'c':
						base10_a = 12;
						break;
					case 'd':
						base10_a = 13;
						break;
					case 'e':
						base10_a = 14;
						break;
					case 'f':
						base10_a = 15;
						break;
					default:
						base10_a = (uint8)a.digit_value();
						break;
				}
				return(base10_a);
			}
		}
	}
}
