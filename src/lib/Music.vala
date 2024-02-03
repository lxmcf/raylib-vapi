using Raylib;
namespace RaylibOOP {
	namespace Audio {
		public class Music : GLib.Object {
			/* Variables */
			private Raylib.Music track;
			private bool isPaused = false;
			private float trackVolume = 1.0f;
			private float trackPitch = 1.0f;
			private float trackPan = 0.5f;
			/* Constructors */
			/**
			* Loads the track from a file.
			*/
			public Music(string file) {
				if(is_audio_device_ready() == false) {
					init_audio_device();
				}
				this.track = load_music_stream(file);
			}
			/**
			* Loads the track from memory.
			*/
			public Music.from_memory(uint8[] data, string fileType) {
				if(is_audio_device_ready() == false) {
					init_audio_device();
				}
				this.track = load_music_stream_from_memory(fileType, data);
			}
			/* Destroyer */
			~Music() {
				unload_music_stream(this.track);
			}
			/* Methods */
			/**
			* Updates buffers for music streaming
			*/
			public void update() {
				update_music_stream(this.track);
			}
			/* Properties */
			/**
			* If music stream is playing or stopped
			*/
			public bool playing {
				get {
					return(is_music_stream_playing(this.track));
				}
				set {
					if(value == true) {
						play_music_stream(this.track);
					} else {
						stop_music_stream(this.track);
					}
				}
			}
			/**
			* If music stream is paused
			*/
			public bool paused {
				get {
					return(this.isPaused);
				}
				set {
					if(value == true) {
						isPaused = true;
						pause_music_stream(this.track);
					} else {
						isPaused = false;
						resume_music_stream(this.track);
					}
				}
			}
			/**
			* Pan for music stream. 0.5 is center.
			*/
			public float pan {
				get {
					return(this.trackPan);
				}
				set {
					this.trackPan = value;
					set_music_pan(this.track, value);
				}
			}
			/**
			* Pitch of the music stream. 1.0 if base level.
			*/
			public float pitch {
				get {
					return(this.trackPitch);
				}
				set {
					this.trackPitch = value;
					set_music_pitch(this.track, value);
				}
			}
			/**
			* Volume of the music stream. 1.0 is max level.
			*/
			public float volume {
				get {
					return(this.trackVolume);
				}
				set {
					/* No need to error out the program if an invalid value
					 * is given, we'll just round it up or down. */
					float f = value;
					if(f > 1.0f) {
						f = 1.0f;
					} else if(f < 0.0f) {
						f = 0.0f;
					}
					set_music_volume(this.track, f);
					this.trackVolume = f;
				}
			}
			/**
			* How long the music stream's track is.
			*/
			public float timeLength {
				get {
					return(get_music_time_length(this.track));
				}
			}
			/**
			* How far into the track the music stream is.
			*/
			public float timePlayed {
				get {
					return(get_music_time_played(this.track));
				}
			}
		}
	}
}
