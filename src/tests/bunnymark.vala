using RaylibOOP;
using RaylibOOP.Core;
using RaylibOOP.Shapes;
using RaylibOOP.Color;

class Bunny : GLib.Object {
	private Vector2 position;
	private Vector2 speed;
	private Raylib.Color color;
	public static Raylib.Texture2D sprite;
	public Bunny(Raylib.Vector2 pos, float speedX, float speedY, Raylib.Color color) {
		this.position.x = pos.x;
		this.position.y = pos.y;
		this.speed.x = speedX;
		this.speed.y = speedY;
		this.color = color;
	}
	public void update() {
		this.position.x += this.speed.x;
		this.position.y += this.speed.y;
		if (((this.position.x + Bunny.sprite.width/2) > Raylib.get_screen_width()) ||
			((this.position.x + Bunny.sprite.width/2) < 0)) this.speed.x *= -1;
		if (((this.position.y + Bunny.sprite.height/2) > Raylib.get_screen_height()) ||
			((this.position.y + Bunny.sprite.height/2 - 40) < 0)) this.speed.y *= -1;
		Raylib.draw_texture(Bunny.sprite, (int)this.position.x, (int)this.position.y, this.color);
	}
}

int main() {
	var window = new Window(800, 450, "Bunnymark!");
	Bunny.sprite = Raylib.load_texture("resources/bunny.png");
	Array<Bunny> bunnies = new Array<Bunny>();
	window.target_fps = 9999;
	while(window.should_close == false) {
		// Add controls
		if(Raylib.is_mouse_button_down(Raylib.MouseButton.LEFT)) {
			for(int i = 0; i < 100; i++)
				bunnies.append_val(new Bunny(
					Raylib.get_mouse_position(),
					Raylib.get_random_value(-250, 250)/60.0f,
					Raylib.get_random_value(-250, 250)/60.0f,
					Color.Custom.from_rgba(
						(uint8)Raylib.get_random_value(50, 240),
						(uint8)Raylib.get_random_value(80, 240),
						(uint8)Raylib.get_random_value(100, 240),
						255)));
		} else if(Raylib.is_mouse_button_down(Raylib.MouseButton.RIGHT)) {
			for(int i = 0; i < 10000; i++)
				bunnies.append_val(new Bunny(
					Raylib.get_mouse_position(),
					Raylib.get_random_value(-250, 250)/60.0f,
					Raylib.get_random_value(-250, 250)/60.0f,
					Color.Custom.from_rgba(
						(uint8)Raylib.get_random_value(50, 240),
						(uint8)Raylib.get_random_value(80, 240),
						(uint8)Raylib.get_random_value(100, 240),
						255)));
		}

		window.begin_drawing();
		window.clear_background(WHITE);
		foreach (Bunny b in bunnies) {
			b.update();
		}
		Raylib.draw_rectangle(0, 0, Raylib.get_screen_width(), 40, BLACK);
		Raylib.draw_text(@"Bunnies: $(bunnies.length)", 120, 10, 20, GREEN);

		window.draw_fps(10, 10);
		window.end_drawing();
	}
	bunnies = null;
	window = null;
	return(0);
}
