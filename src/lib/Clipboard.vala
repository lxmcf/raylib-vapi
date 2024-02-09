namespace RaylibOOP {
	public class Clipboard : GLib.Object {
		private Clipboard() {
			return;
		}
		public new static string get() {
			return(Raylib.get_clipboard_text());
		}
		public new static void set(string text) {
			Raylib.set_clipboard_text(text);
		}
	}
}
