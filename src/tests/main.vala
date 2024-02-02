using Raylib.OOP.Core;
using Raylib.OOP.Shapes;

int main() {
	var window = new Window(320, 240, "Wooo");
	var vector = new Vector2(0, 15);
	var second_vector = new Vector2(5, 35);
	while(true) {
		window.begin_drawing();
		Raylib.clear_background(Raylib.WHITE);
		vector.draw_line(second_vector, Raylib.BLACK, null);
		window.end_drawing();
	}
}
