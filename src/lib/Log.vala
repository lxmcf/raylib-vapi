namespace RaylibOOP {
	public class Log : GLib.Object {
		public enum Level {
			ALL     = Raylib.TraceLogLevel.ALL,
			TRACE   = Raylib.TraceLogLevel.TRACE,
			DEBUG   = Raylib.TraceLogLevel.DEBUG,
			INFO    = Raylib.TraceLogLevel.INFO,
			WARNING = Raylib.TraceLogLevel.WARNING,
			ERROR   = Raylib.TraceLogLevel.ERROR,
			FATAL   = Raylib.TraceLogLevel.FATAL,
			NONE    = Raylib.TraceLogLevel.NONE,
		}
		private Log() {
			return;
		}
		internal static void trace_log(int log_level, string text, va_list args) {
			/* I have no idea why I have to create this string, but it'll segfault
			 * otherwise =( */
			string res = "[Raylib] "+text.vprintf(args);
			switch(log_level) {
				case Level.ALL:
					message(res);
					break;
				case Level.TRACE:
					info(res);
					break;
				case Level.DEBUG:
					debug(res);
					break;
				case Level.INFO:
					info(res);
					break;
				case Level.WARNING:
					warning(res);
					break;
				case Level.ERROR:
					error(res);
				case Level.FATAL:
					error(@"FATAL: $(res)");
				default:
					break;
			}
		}
	}
}
