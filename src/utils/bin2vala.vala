/* This script creates a constant uint8 array of any file, for use with embedding
 * into code. */
using GLib;

public class Main : GLib.Object {
	private static string? outputFile = null;
	private static string? inputFile = null;
	private static string? namespace = null;
	private static string? variable = null;
	private const OptionEntry[] opts = {
		{"input", 'i', OptionFlags.NONE, OptionArg.FILENAME, ref inputFile, "Input file", "file"},
		{"output", 'o', OptionFlags.NONE, OptionArg.FILENAME, ref outputFile, "Output file, defaults to standard output.", "file"},
		{"namespace", 'n', OptionFlags.NONE, OptionArg.STRING, ref namespace, "Namespace (Optional)", "string"},
		{"variable", 'v', OptionFlags.NONE, OptionArg.STRING, ref variable, "Variable Name", "string"},
		{null}
	};
	static int main(string[] args) {
		try {
			var options = new OptionContext("- bin2vala Options");
			options.set_help_enabled(true);
			options.add_main_entries(opts, null);
			options.parse(ref args);
		} catch(OptionError e) {
			error(@"Error: $(e.message)");
		}
		/* Check if user provided everything */
		if(inputFile == null) {
			error("No input file provided.");
		}
		FileStream o;
		if(outputFile == null) {
			var fd = stdout.fileno();
			o = FileStream.fdopen(fd, "w");
		} else {
			o = FileStream.open(outputFile, "w");
		}
		if(variable == null) {
			error("Variable name not provided.");
		}

		/* Print Namespace */
		if(namespace != null) {
			o.printf("namespace %s {\n", namespace);
		}
		o.printf("const uint8[] %s = {\n\t", variable);
		/* Get bytes from input file */
		var i = FileStream.open(inputFile, "rb");
		/* Get size of input file */
		i.seek(0, FileSeek.END);
		int64 size = i.tell();
		i.rewind();
		/* Get bytes from file */
		uint8[] inputBuf = new uint8[size];
		var read = i.read(inputBuf);
		/* Make sure the size read was correct */
		assert(size == read);
		int c = 0;
		foreach (uint8 b in inputBuf) {
			/* Make sure we line break every 80 characters */
			if(c >= 80) {
				o.printf("\n\t");
				c = 0;
			}
			c += 5;
			/* Print out hexidecimal */
			o.printf("%03d, ", b);
		}
		o.printf("\n};\n");
		if(namespace != null) {
			o.printf("}\n");
		}
		return(0);
	}
}
