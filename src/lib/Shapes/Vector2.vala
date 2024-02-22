namespace RaylibOOP {
	namespace Shapes {
		public class Vector2 : GLib.Object {
			/* Variables */
			public Raylib.Vector2 iVector;
			/* Constructor */
			public Vector2(float x, float y) {
				this.iVector.x = x;
				this.iVector.y = y;
			}
			/* Methods */
			public void draw_line(Shapes.Vector2 other, Raylib.Color color, float? thickness) {
				/* Prep */
				if(thickness == null) {
					thickness = 1;
				}
				/* Calls */
				Raylib.draw_line_ext(this.iVector, other.iVector, thickness, color);
				return;
			}
			public void draw_pixel(Raylib.Color color) {
				Raylib.draw_pixel_vector(this.iVector, color);
				return;
			}
			public void draw_circle() {

			}
			/* Properties */
			public float x {
				get {
					return(this.iVector.x);
				}
				set {
					this.iVector.x = value;
				}
			}
			public float y {
				get {
					return(this.iVector.y);
				}
				set {
					this.iVector.y = value;
				}
			}
		}
	}
}
