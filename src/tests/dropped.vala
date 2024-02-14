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
				GLib.Array<string> listOfFiles;
				try {
					window.get_dropped_files(out listOfFiles);
				} catch(GLib.Error e) {
					warning(e.message);
				}
				if(listOfFiles != null)
					foreach (string b in listOfFiles) {
						info(b);
					}
			}
			return;
		});
	}
	return(0);
}
