namespace RaylibOOP {
	namespace Automation {
		public class EventList : GLib.Object {
			/* Variables */
			internal Raylib.AutomationEventList eventList;
			/* Constructors */
			public EventList(string file) {
				eventList = Raylib.load_automation_event_list(file);
				return;
			}
			~EventList() {
				Raylib.unload_automation_event_list(&eventList);
			}
			/* Methods */
			public void export(string exportFile) throws GLib.FileError {
				if(Raylib.export_automation_event_list(this.eventList, exportFile) == false) {
					throw new GLib.FileError.FAILED(@"Failed to create file: "+GLib.strerror(GLib.errno));
				}
				return;
			}
			/**
			* Events entries
			*/
			public Raylib.AutomationEvent get_event(uint index) {
				return(this.eventList.events[index]);
			}
			/* Properties */
			/**
			* Events max entries.
			*/
			public uint capacity {
				get {
					return(this.eventList.capacity);
				}
			}
			/**
			* Events entries count
			*/
			public uint count {
				get {
					return(this.eventList.count);
				}
			}
		}
	}
}
