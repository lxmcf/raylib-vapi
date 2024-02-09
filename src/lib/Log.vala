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
			switch(log_level) {
				case Level.DEBUG:
					debug(text, args);
					break;
				case Level.INFO:
					info(text, args);
					break;
				case Level.WARNING:
					warning(text, args);
					break;
				case Level.ERROR:
					error(text, args);
				case Level.FATAL:
					error(@"FATAL: $(text)", args);
				default:
					break;
			}
		}
	}
}
