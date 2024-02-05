using Raylib;
namespace RaylibOOP {
	namespace Audio {
		namespace MasterVolume {
			public float get() {
				return(get_master_volume());
			}
			public void set(float volume) {
				set_master_volume(volume);
				return;
			}
		}
		namespace FileType {
			const string WAV  = ".wav";
			const string OGG  = ".ogg";
			const string MP3  = ".mp3";
			const string QOA  = ".qoa";
			const string FLAC = ".flac";
			const string XM   = ".xm";
			const string MOD  = ".mod";
		}
	}
}
