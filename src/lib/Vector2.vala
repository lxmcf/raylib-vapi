using Raylib;

namespace Raylib {
	namespace OOP {
		namespace Shapes {
			public class Vector2 : GLib.Object {
				/* Variables */
				public Raylib.Vector2 vector;
				/* Constructor */
				public Vector2(float x, float y) {
					this.vector.x = x;
					this.vector.y = y;
				}
				/* Methods */
				public void draw_line(Raylib.OOP.Shapes.Vector2 other, Raylib.Color color, float? thickness) {
					/* Prep */
					if(thickness == null) {
						thickness = 1;
					}
					/* Calls */
					Raylib.draw_line_ext(this.vector, other.vector, thickness, color);
					return;
				}
				public void draw_pixel(Raylib.Color color) {
					Raylib.draw_pixel_vector(this.vector, color);
					return;
				}
				public void draw_circle() {

				}
				/* Properties */
				public float x {
					get {
						return(this.vector.x);
					}
					set {
						this.vector.x = value;
					}
				}
				public float y {
					get {
						return(this.vector.y);
					}
					set {
						this.vector.y = y;
					}
				}
			}
		}
	}
}
