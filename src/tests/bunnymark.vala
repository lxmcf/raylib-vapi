using RaylibOOP;
using RaylibOOP.Core;
using RaylibOOP.Shapes;
using RaylibOOP.Color;
using RaylibOOP.Input;
using GLib.Random;

Window window;

public class Bunny : GLib.Object {
	private Vector2 position;
	private Vector2 speed;
	private Raylib.Color color;
	public static Raylib.Texture2D sprite;
	public Bunny(Vector2 pos, float speedX, float speedY, Raylib.Color color) {
		this.position = new Vector2(pos.x, pos.y);
		this.speed = new Vector2(speedX, speedY);
		this.color = color;
	}
	public void update() {
		this.position.x += this.speed.x;
		this.position.y += this.speed.y;
		if (((this.position.x + Bunny.sprite.width/2) > window.width) ||
			((this.position.x + Bunny.sprite.width/2) < 0))
			this.speed.x *= -1;
		if (((this.position.y + Bunny.sprite.height/2) > window.height) ||
			((this.position.y + Bunny.sprite.height/2 - 40) < 0))
			this.speed.y *= -1;
		Raylib.draw_texture(Bunny.sprite, (int)this.position.x, (int)this.position.y, this.color);
	}
}

int main() {
	window = new Window(800, 450, "Bunnymark!");
	set_seed((uint32)new DateTime.now_local().to_unix());
	Bunny.sprite = Raylib.load_texture("resources/bunny.png");
	Array<Bunny> bunnies = new Array<Bunny>();
	window.target_fps = 9999;
	while(window.should_close == false) {
		/* Create new Bunnies */
		if(Mouse.is_down(Raylib.MouseButton.LEFT)) {
			for(int i = 0; i < 100; i++)
				bunnies.append_val(new Bunny(
					Mouse.position,
					int_range(-250, 250)/60.0f,
					int_range(-250, 250)/60.0f,
					Color.Custom.from_rgba(
						(uint8)int_range(50, 240),
						(uint8)int_range(80, 240),
						(uint8)int_range(100, 240),
						255)));
		} else if(Mouse.is_down(Raylib.MouseButton.RIGHT)) {
			for(int i = 0; i < 10000; i++)
				bunnies.append_val(new Bunny(
					Mouse.position,
					int_range(-250, 250)/60.0f,
					int_range(-250, 250)/60.0f,
					Color.Custom.from_rgba(
						(uint8)int_range(50, 240),
						(uint8)int_range(80, 240),
						(uint8)int_range(100, 240),
						255)));
		}
		/* Draw Frames */
		window.draw(()=>{
			window.clear_background(WHITE);
			foreach (Bunny b in bunnies) {
				b.update();
			}
			Raylib.draw_rectangle(0, 0, window.width, 40, BLACK);
			Raylib.draw_text(@"Bunnies: $(bunnies.length)", 120, 10, 20, GREEN);

			window.draw_fps(10, 10);
		});
		/* Get final bunny score once framerate dips below 55 */
		if(window.fps < 55 && Environment.get_variable("UNLIMITED_BUNNIES") != "1") {
			break;
		}
	}
	window = null;
	info(@"Total Bunnies: $(bunnies.length)");
	bunnies = null;
	return(0);
}
