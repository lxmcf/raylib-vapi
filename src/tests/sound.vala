using RaylibOOP;

int main() {
	var window = new Core.Window(320, 240, "Test Audio");
	/* Check if master volume works */
	print(@"Master Volume: $(window.master_volume)\n");
	window.master_volume = 0.5f;
	print(@"Master Volume: $(window.master_volume)\n");
	window.begin_drawing();
	window.end_drawing();
	return(0);
}
