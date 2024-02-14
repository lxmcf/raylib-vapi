namespace RaylibOOP {
	namespace Automation {
		public class EventList : GLib.Object {
			internal Raylib.AutomationEventList eventList;
			public EventList(string file) {
				eventList = Raylib.load_automation_event_list(file);
				return;
			}
		}
	}
}
