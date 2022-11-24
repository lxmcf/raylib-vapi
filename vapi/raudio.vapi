[CCode (cprefix = "", cheader_filename = "raudio.h")]
namespace Raudio {
    //----------------------------------------------------------------------------------
    // Types and Structures Definition
    //----------------------------------------------------------------------------------
    [CCode (cname = "AudioCallback")]
    public delegate void AudioCallback (void* buffer_data, uint frames);

    [CCode (cname = "Wave")]
    public struct Wave {
        public uint frameCount;         // Total number of frames (considering channels)                                // vala-lint=naming-convention
        public uint sampleRate;         // Frequency (samples per second)                                               // vala-lint=naming-convention
        public uint sampleSize;         // Bit depth (bits per sample): 8, 16, 32 (24 not supported)                    // vala-lint=naming-convention
        public uint channels;           // Number of channels (1-mono, 2-stereo, ...)
        public void *data;              // Buffer data pointer
    }

    [CCode (cname = "rAudioBuffer")]
    public struct AudioBuffer { }

    [CCode (cname = "rAudioProcessor")]
    public struct AudioProcessor { }

    [CCode (cname = "AudioStream")]
    public struct AudioStream {
        public AudioBuffer buffer;          // Pointer to internal data used by the audio system
        public AudioProcessor processor;    // Pointer to internal data processor, useful for audio effects

        public uint sampleRate;             // Frequency (samples per second)                                           // vala-lint=naming-convention
        public uint sampleSize;             // Bit depth (bits per sample): 8, 16, 32 (24 not supported)                // vala-lint=naming-convention
        public uint channels;               // Number of channels (1-mono, 2-stereo, ...)
    }

    [CCode (cname = "Sound")]
    public struct Sound {
        public AudioStream stream;      // Audio stream
        public uint frameCount;         // Total number of frames (considering channels)                                // vala-lint=naming-convention
    }

    [CCode (cname = "Music")]
    public struct Music {
        public AudioStream stream;      // Audio stream
        public uint frameCount;         // Total number of frames (considering channels)                                // vala-lint=naming-convention
        public bool looping;            // Music looping enable

        public int ctxType;             // Type of music context (audio filetype)                                       // vala-lint=naming-convention
        public void* ctxData;           // Audio context data, depends on type                                          // vala-lint=naming-convention
    }

    //----------------------------------------------------------------------------------
    // Module Functions Declaration
    //----------------------------------------------------------------------------------
    // Audio device management functions
    [CCode (cname = "InitAudioDevice")]
    public static void init_audio_device ();

    [CCode (cname = "CloseAudioDevice")]
    public static void close_audio_device ();

    [CCode (cname = "IsAudioDeviceReady")]
    public static bool is_audio_device_ready ();

    [CCode (cname = "SetMasterVolume")]
    public static void set_master_volume (float volume);

    // Wave/Sound loading/unloading functions
    [CCode (cname = "LoadWave")]
    public static Wave load_wave (string filename);

    [CCode (cname = "LoadWaveFromMemory")]
    public static Wave load_wave_from_memory (string file_type, uchar[] file_data);

    [CCode (cname = "LoadSound")]
    public static Sound load_sound (string filename);

    [CCode (cname = "LoadSoundFromWave")]
    public static Sound load_sound_from_wave (Wave wave);

    [CCode (cname = "UpdateSound")]
    public static void update_sound (Sound sound, void* data, int sample_ount);

    [CCode (cname = "UnloadWave")]
    public static void unload_wave (Wave wave);

    [CCode (cname = "UnloadSound")]
    public static void unload_sound (Sound sound);

    [CCode (cname = "ExportWave")]
    public static bool export_wave (Wave wave, string filename);

    [CCode (cname = "ExportWaveAsCode")]
    public static bool export_wave_as_code (Wave wave, string filename);

    // Wave/Sound management functions
    [CCode (cname = "PlaySound")]
    public static void play_sound (Sound sound);

    [CCode (cname = "StopSound")]
    public static void stop_sound (Sound sound);

    [CCode (cname = "PauseSound")]
    public static void pause_sound (Sound sound);

    [CCode (cname = "ResumeSound")]
    public static void resume_sound (Sound sound);

    [CCode (cname = "PlaySoundMulti")]
    public static void play_sound_multi (Sound sound);

    [CCode (cname = "StopSoundMulti")]
    public static void stop_sound_multi ();

    [CCode (cname = "GetSoundsPlaying")]
    public static int get_sounds_playing ();

    [CCode (cname = "IsSoundPlaying")]
    public static bool is_sound_playing (Sound sound);

    [CCode (cname = "SetSoundVolume")]
    public static void set_sound_volume (Sound sound, float volume);

    [CCode (cname = "SetSoundPitch")]
    public static void set_sound_pitch (Sound sound, float pitch);

    [CCode (cname = "SetSoundPan")]
    public static void set_sound_pan (Sound sound, float pan);

    [CCode (cname = "WaveCopy")]
    public static Wave wave_copy (Wave wave);

    [CCode (cname = "WaveCrop")]
    public static void wave_crop (Wave? wave, int initial_sample, int final_sample);

    [CCode (cname = "WaveFormat")]
    public static void wave_format (Wave? wave, int sample_rate, int sample_size, int channels);

    [CCode (cname = "LoadWaveSamples")]
    public static float[] load_wave_samples (Wave wave);

    [CCode (cname = "UnloadWaveSamples")]
    public static void unload_wave_samples (float* samples);

    // Music management functions
    [CCode (cname = "LoadMusicStream")]
    public static Music load_music_stream (string filename);

    [CCode (cname = "LoadMusicStreamFromMemory")]
    public static Music load_music_stream_from_memory (string file_type, uchar[] data);

    [CCode (cname = "UnloadMusicStream")]
    public static void unload_usic_stream (Music music);

    [CCode (cname = "PlayMusicStream")]
    public static void play_music_stream (Music music);

    [CCode (cname = "IsMusicStreamPlaying")]
    public static bool is_music_stream_playing (Music music);

    [CCode (cname = "UpdateMusicStream")]
    public static void update_music_stream (Music music);

    [CCode (cname = "StopMusicStream")]
    public static void stop_music_stream (Music music);

    [CCode (cname = "PauseMusicStream")]
    public static void pause_music_stream (Music music);

    [CCode (cname = "ResumeMusicStream")]
    public static void resume_music_stream (Music music);

    [CCode (cname = "SeekMusicStream")]
    public static void seek_music_stream (Music music, float position);

    [CCode (cname = "SetMusicVolume")]
    public static void set_music_volume (Music music, float volume);

    [CCode (cname = "SetMusicPitch")]
    public static void set_music_pitch (Music music, float pitch);

    [CCode (cname = "SetMusicPan")]
    public static void set_music_pan (Music music, float pan);

    [CCode (cname = "GetMusicTimeLength")]
    public static float get_music_time_length (Music music);

    [CCode (cname = "GetMusicTimePlayed")]
    public static float get_music_time_played (Music music);

    // AudioStream management functions
    [CCode (cname = "LoadAudioStream")]
    public static AudioStream load_audio_stream (uint sample_rate, uint sample_size, uint channels);

    [CCode (cname = "UnloadAudioStream")]
    public static void unload_audio_stream (AudioStream stream);

    [CCode (cname = "UpdateAudioStream")]
    public static void update_audio_stream (AudioStream stream, void* data, int frame_count);

    [CCode (cname = "IsAudioStreamProcessed")]
    public static bool is_audio_stream_processed (AudioStream stream);

    [CCode (cname = "PlayAudioStream")]
    public static void play_audio_stream (AudioStream stream);

    [CCode (cname = "PauseAudioStream")]
    public static void pause_audio_stream (AudioStream stream);

    [CCode (cname = "ResumeAudioStream")]
    public static void resume_audio_stream (AudioStream stream);

    [CCode (cname = "IsAudioStreamPlaying")]
    public static bool is_audio_stream_playing (AudioStream stream);

    [CCode (cname = "StopAudioStream")]
    public static void stop_audio_stream (AudioStream stream);

    [CCode (cname = "SetAudioStreamVolume")]
    public static void set_audio_stream_volume (AudioStream stream, float volume);

    [CCode (cname = "SetAudioStreamPitch")]
    public static void set_audio_stream_pitch (AudioStream stream, float pitch);

    [CCode (cname = "SetAudioStreamPan")]
    public static void set_audio_stream_pan (AudioStream stream, float pan);

    [CCode (cname = "SetAudioStreamBufferSizeDefault")]
    public static void set_audio_stream_buffer_size_default (int size);

}
