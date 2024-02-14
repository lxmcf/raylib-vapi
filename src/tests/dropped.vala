using RaylibOOP;


int main() {
	Window window;
	try {
		window = new Window(640, 480, "Drop a damn file!");
	} catch(WindowError e) {
		error(e.message);
	}

	while(window.should_close == false) {
		window.draw(()=>{
			window.clear_background(Color.LIGHT_GRAY);
			if(window.file_dropped == true) {
				try {
					GLib.Array<string> listOfFiles;
					window.get_dropped_files(out listOfFiles);
					foreach (string b in listOfFiles) {
						info(b);
					}
				} catch(GLib.Error e) {
					warning(e.message);
				}
			}
			return;
		});
	}
	return(0);
}
