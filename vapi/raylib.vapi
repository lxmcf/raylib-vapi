[CCode (cprefix = "", cheader_filename = "raylib.h")]
namespace Raylib {
    [CCode (cname = "RAYLIB_VERSION")]
    public const string VERSION;

    //----------------------------------------------------------------------------------
    // Some basic Defines
    //----------------------------------------------------------------------------------
    [CCode (cname = "PI")]
    public const float PI;

    [CCode (cname = "DEG2RAD")]
    public const float DEG2RAD;

    [CCode (cname = "RAD2DEG")]
    public const float RAD2DEG;

    // Some Basic Colors
    // NOTE: Custom raylib color palette for amazing visuals on WHITE background
    [CCode (cname = "LIGHTGRAY")]
    public const Color LIGHTGRAY;

    [CCode (cname = "GRAY")]
    public const Color GRAY;

    [CCode (cname = "DARKGRAY")]
    public const Color DARKGRAY;

    [CCode (cname = "YELLOW")]
    public const Color YELLOW;

    [CCode (cname = "GOLD")]
    public const Color GOLD;

    [CCode (cname = "ORANGE")]
    public const Color ORANGE;

    [CCode (cname = "PINK")]
    public const Color PINK;

    [CCode (cname = "RED")]
    public const Color RED;

    [CCode (cname = "MAROON")]
    public const Color MAROON;

    [CCode (cname = "GREEN")]
    public const Color GREEN;

    [CCode (cname = "LIME")]
    public const Color LIME;

    [CCode (cname = "DARKGREEN")]
    public const Color DARKGREEN;

    [CCode (cname = "SKYBLUE")]
    public const Color SKYBLUE;

    [CCode (cname = "BLUE")]
    public const Color BLUE;

    [CCode (cname = "DARKBLUE")]
    public const Color DARKBLUE;

    [CCode (cname = "PURPLE")]
    public const Color PURPLE;

    [CCode (cname = "VIOLET")]
    public const Color VIOLET;

    [CCode (cname = "DARKPURPLE")]
    public const Color DARKPURPLE;

    [CCode (cname = "BEIGE")]
    public const Color BEIGE;

    [CCode (cname = "BROWN")]
    public const Color BROWN;


    [CCode (cname = "DARKBROWN")]
    public const Color DARKBROWN;

    [CCode (cname = "WHITE")]
    public const Color WHITE;

    [CCode (cname = "BLACK")]
    public const Color BLACK;

    [CCode (cname = "BLANK")]
    public const Color BLANK;

    [CCode (cname = "MAGENTA")]
    public const Color MAGENTA;

    [CCode (cname = "RAYWHITE")]
    public const Color RAYWHITE;

    //----------------------------------------------------------------------------------
    // Structures Definition
    //----------------------------------------------------------------------------------
    [SimpleType]
    [CCode (cname = "Vector2")]
    public struct Vector2 {
        public float x;
        public float y;
    }

    [SimpleType]
    [CCode (cname = "Vector3")]
    public struct Vector3 {
        public float x;
        public float y;
        public float z;
    }

    [SimpleType]
    [CCode (cname = "Vector4")]
    public struct Vector4 {
        public float x;
        public float y;
        public float z;
        public float w;
    }

    [SimpleType]
    [CCode (cname = "Quaternion")]
    public struct Quaternion {
        public float x;
        public float y;
        public float z;
        public float w;
    }

    [SimpleType]
    [CCode (cname = "Matrix")]
    public struct Matrix {
        public float m0;
        public float m4;
        public float m8;
        public float m12;

        public float m1;
        public float m5;
        public float m9;
        public float m13;

        public float m2;
        public float m6;
        public float m10;
        public float m14;

        public float m3;
        public float m7;
        public float m11;
        public float m15;
    }

    [SimpleType]
    [CCode (cname = "Color")]
    public struct Color {
        public uchar r;
        public uchar g;
        public uchar b;
        public uchar a;
    }

    [SimpleType]
    [CCode (cname = "Rectangle")]
    public struct Rectangle {
        public float x;
        public float y;
        public float width;
        public float height;
    }

    [SimpleType]
    [CCode (cname = "Image")]
    public struct Image {
        void* data;

        int width;
        int height;
        int mipmaps;

        PixelFormat format;
    }

    [SimpleType]
    [CCode (cname = "Texture")]
    public struct Texture {
        public uint id;                // OpenGL texture id
        public int width;              // Texture base width
        public int height;             // Texture base height
        public int mipmaps;            // Mipmap levels, 1 by default

        public PixelFormat format;     // Data format (PixelFormat type)
    }

    [SimpleType]
    [CCode (cname = "Texture2D")]
    public struct Texture2D {
        public uint id;                // OpenGL texture id
        public int width;              // Texture base width
        public int height;             // Texture base height
        public int mipmaps;            // Mipmap levels, 1 by default

        public PixelFormat format;     // Data format (PixelFormat type)
    }

    [SimpleType]
    [CCode (cname = "TextureCubemap")]
    public struct TextureCubemap {
        public uint id;                // OpenGL texture id
        public int width;              // Texture base width
        public int height;             // Texture base height
        public int mipmaps;            // Mipmap levels, 1 by default

        public PixelFormat format;     // Data format (PixelFormat type)
    }

    [SimpleType]
    [CCode (cname = "RenderTexture")]
    public struct RenderTexture {
        public uint id;                           // OpenGL framebuffer object id

        public unowned Texture2D texture;         // Color buffer attachment texture
        public unowned Texture2D depth;           // Depth buffer attachment texture
    }

    [SimpleType]
    [CCode (cname = "RenderTexture2D")]
    public struct RenderTexture2D : RenderTexture {
        public uint id;                           // OpenGL framebuffer object id

        public unowned Texture2D texture;         // Color buffer attachment texture
        public unowned Texture2D depth;           // Depth buffer attachment texture
    }

    [SimpleType]
    [CCode (cname = "NPatchInfo")]
    public struct NPatchInfo {
        public unowned Rectangle source;        // Texture source rectangle

        public int left;                        // Left border offset
        public int top;                         // Top border offset
        public int right;                       // Right border offset
        public int bottom;                      // Bottom border offset
        public int layout;                      // Layout of the n-patch: 3x3, 1x3 or 3x1
    }

    [SimpleType]
    [CCode (cname = "GlyphInfo")]
    public struct GlyphInfo {
        public int value;                       // Character value (Unicode)
        public int offsetX;                     // Character offset X when drawing                                      // vala-lint=naming-convention
        public int offsetY;                     // Character offset Y when drawing                                      // vala-lint=naming-convention
        public int advanceX;                    // Character advance position X                                         // vala-lint=naming-convention

        public unowned Image image;             // Character image data
    }

    [SimpleType]
    [CCode (cname = "Font")]
    public struct Font {
        public int baseSize;                    // Base size (default chars height)                                     // vala-lint=naming-convention
        public int glyphCount;                  // Number of glyph characters                                           // vala-lint=naming-convention
        public int glyphPadding;                // Padding around the glyph characters                                  // vala-lint=naming-convention

        public unowned Texture2D texture;       // Texture atlas containing the glyphs
        public unowned Rectangle[] recs;        // Rectangles in texture for the glyphs
        public unowned GlyphInfo[] glyphs;      // Glyphs info data
    }

    [SimpleType]
    [CCode (cname = "Camera3D")]
    public struct Camera3D {
        public unowned Vector3 position;        // Camera position
        public unowned Vector3 target;          // Camera target it looks-at
        public unowned Vector3 up;              // Camera up vector (rotation over its axis)

        public float fovy;                      // Camera field-of-view apperture in Y (degrees) in perspective, used as near plane width in orthographic
        public int projection;                  // Camera projection: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC
    }

    [SimpleType]
    [CCode (cname = "Camera")]
    public struct Camera : Camera3D {
        public unowned Vector3 position;        // Camera position
        public unowned Vector3 target;          // Camera target it looks-at
        public unowned Vector3 up;              // Camera up vector (rotation over its axis)

        public float fovy;                      // Camera field-of-view apperture in Y (degrees) in perspective, used as near plane width in orthographic
        public int projection;                  // Camera projection: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC
    }

    [SimpleType]
    [CCode (cname = "Camera2D")]
    public struct Camera2D {
        public unowned Vector2 offset;          // Camera offset (displacement from target)
        public unowned Vector2 target;          // Camera target (rotation and zoom origin)

        public float rotation;                  // Camera rotation in degrees
        public float zoom;                      // Camera zoom (scaling), should be 1.0f by default
    }

    [SimpleType]
    [CCode (cname = "Mesh")]
    public struct Mesh {
        public int vertexCount;                 // Number of vertices stored in arrays                                                          // vala-lint=naming-convention
        public int triangleCount;               // Number of triangles stored (indexed or not)                                                  // vala-lint=naming-convention

        // Vertex attributes data
        public unowned float[] vertices;        // Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
        public unowned float[] texcoords;       // Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
        public unowned float[] texcoords2;      // Vertex texture second coordinates (UV - 2 components per vertex) (shader-location = 5)
        public unowned float[] normals;         // Vertex normals (XYZ - 3 components per vertex) (shader-location = 2)
        public unowned float[] tangents;        // Vertex tangents (XYZW - 4 components per vertex) (shader-location = 4)
        public unowned uchar[] colors;          // Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
        public unowned ushort[] indices;        // Vertex indices (in case vertex data comes indexed)

        // Animation vertex data
        public unowned float[] animVertices;    // Animated vertex positions (after bones transformations)                                      // vala-lint=naming-convention
        public unowned float[] animNormals;     // Animated normals (after bones transformations)                                               // vala-lint=naming-convention
        public unowned uchar[] boneIds;         // Vertex bone ids, max 255 bone ids, up to 4 bones influence by vertex (skinning)              // vala-lint=naming-convention
        public unowned float[] boneWeights;     // Vertex bone weight, up to 4 bones influence by vertex (skinning)                             // vala-lint=naming-convention

        // OpenGL identifiers
        public uint vaoId;                      // OpenGL Vertex Array Object id                                                                // vala-lint=naming-convention
        public unowned uint[] vboId;            // OpenGL Vertex Buffer Objects id (default vertex data)                                        // vala-lint=naming-convention
    }

    [SimpleType]
    [CCode (cname = "Shader")]
    public struct Shader {
        public uint id;                       // Shader program id
        public unowned int[] locs;            // Shader locations array (RL_MAX_SHADER_LOCATIONS)
    }

    [SimpleType]
    [CCode (cname = "MaterialMap")]
    public struct MaterialMap {
        unowned Texture2D texture;      // Material map texture
        Color color;                    // Material map color

        float value;                    // Material map value
    }

    [SimpleType]
    [CCode (cname = "Material")]
    public struct Material {
        unowned Shader shader;          // Material shader
        unowned MaterialMap[] maps;     // Material maps array (MAX_MATERIAL_MAPS)
        float @params[4];               // Material generic parameters (if required)
    }

    [SimpleType]
    [CCode (cname = "Transform")]
    public struct Transform {
        public Vector3 translation;     // Translation
        public Quaternion rotation;     // Rotation
        public Vector3 scale;           // Scale
    }

    [SimpleType]
    [CCode (cname = "BoneInfo")]
    public struct BoneInfo {
        public unowned string name;     // Bone name
        public int parent;              // Bone parent
    }

    [SimpleType]
    [CCode (cname = "Model")]
    public struct Model {
        public Matrix transform;                // Local transform matrix

        public int meshCount;                   // Number of meshes                                                             // vala-lint=naming-convention
        public int materialCount;               // Number of materials                                                          // vala-lint=naming-convention
        public unowned Mesh[] meshes;           // Meshes array
        public unowned Material[] materials;    // Materials array
        public unowned int[] meshMaterial;      // Mesh material number                                                         // vala-lint=naming-convention

        // Animation data
        public int boneCount;                   // Number of bones                                                              // vala-lint=naming-convention
        public unowned BoneInfo[] bones;        // Bones information (skeleton)
        public unowned Transform[] bindPose;    // Bones base transformation (pose)                                             // vala-lint=naming-convention
    }

    [SimpleType]
    [CCode (cname = "ModelAnimation")]
    public struct ModelAnimation {
        public int boneCount;                   // Number of bones                                                              // vala-lint=naming-convention
        public int frameCount;                  // Number of animation frames                                                   // vala-lint=naming-convention
        public unowned BoneInfo[] bones;        // Bones information (skeleton)
        public unowned Transform[,] framePoses; // Poses array by frame                                                         // vala-lint=naming-convention
    }

    [SimpleType]
    [CCode (cname = "Ray")]
    public struct Ray {
        public Vector3 position;        // Ray position (origin)
        public Vector3 direction;       // Ray direction
    }

    [SimpleType]
    [CCode (cname = "RayCollision")]
    public struct RayCollision {
        public bool hit;                // Did the ray hit something?
        public float distance;          // Distance to nearest hit
        public Vector3 point;           // Point of nearest hit
        public Vector3 normal;          // Surface normal of hit
    }

    [SimpleType]
    [CCode (cname = "BoundingBox")]
    public struct BoundingBox {
        public Vector3 min;            // Minimum vertex box-corner
        public Vector3 max;            // Maximum vertex box-corner
    }

    [SimpleType]
    [CCode (cname = "Wave")]
    public struct Wave {
        public uint frameCount;         // Total number of frames (considering channels)                                // vala-lint=naming-convention
        public uint sampleRate;         // Frequency (samples per second)                                               // vala-lint=naming-convention
        public uint sampleSize;         // Bit depth (bits per sample): 8, 16, 32 (24 not supported)                    // vala-lint=naming-convention
        public uint channels;           // Number of channels (1-mono, 2-stereo, ...)
        public void *data;              // Buffer data pointer
    }

    [SimpleType]
    [CCode (cname = "rAudioBuffer")]
    public struct AudioBuffer { }

    [SimpleType]
    [CCode (cname = "rAudioProcessor")]
    public struct AudioProcessor { }

    [SimpleType]
    [CCode (cname = "AudioStream")]
    public struct AudioStream {
        public AudioBuffer buffer;          // Pointer to internal data used by the audio system
        public AudioProcessor processor;    // Pointer to internal data processor, useful for audio effects

        public uint sampleRate;             // Frequency (samples per second)                                           // vala-lint=naming-convention
        public uint sampleSize;             // Bit depth (bits per sample): 8, 16, 32 (24 not supported)                // vala-lint=naming-convention
        public uint channels;               // Number of channels (1-mono, 2-stereo, ...)
    }

    [SimpleType]
    [CCode (cname = "Sound")]
    public struct Sound {
        public AudioStream stream;      // Audio stream
        public uint frameCount;         // Total number of frames (considering channels)                                // vala-lint=naming-convention
    }

    [SimpleType]
    [CCode (cname = "Music")]
    public struct Music {
        public AudioStream stream;      // Audio stream
        public uint frameCount;         // Total number of frames (considering channels)                                // vala-lint=naming-convention
        public bool looping;            // Music looping enable

        public int ctxType;             // Type of music context (audio filetype)                                       // vala-lint=naming-convention
        public void* ctxData;           // Audio context data, depends on type                                          // vala-lint=naming-convention
    }

    [SimpleType]
    [CCode (cname = "VrDeviceInfo")]
    public struct VrDeviceInfo {
        public int hResolution;                // Horizontal resolution in pixels                                       // vala-lint=naming-convention
        public int vResolution;                // Vertical resolution in pixels                                         // vala-lint=naming-convention
        public float hScreenSize;              // Horizontal size in meters                                             // vala-lint=naming-convention
        public float vScreenSize;              // Vertical size in meters                                               // vala-lint=naming-convention
        public float vScreenCenter;            // Screen center in meters                                               // vala-lint=naming-convention
        public float eyeToScreenDistance;      // Distance between eye and display in meters                            // vala-lint=naming-convention
        public float lensSeparationDistance;   // Lens separation distance in meters                                    // vala-lint=naming-convention
        public float interpupillaryDistance;   // IPD (distance between pupils) in meters                               // vala-lint=naming-convention
        public float lensDistortionValues[4];  // Lens distortion constant parameters                                   // vala-lint=naming-convention
        public float chromaAbCorrection[4];    // Chromatic aberration correction parameters                            // vala-lint=naming-convention
    }

    [SimpleType]
    [CCode (cname = "VrStereoConfig")]
    public struct VrStereoConfig {
        public Matrix projection[2];           // VR projection matrices (per eye)
        public Matrix viewOffset[2];           // VR view offset matrices (per eye)                                     // vala-lint=naming-convention
        public float leftLensCenter[2];        // VR left lens center                                                   // vala-lint=naming-convention
        public float rightLensCenter[2];       // VR right lens center                                                  // vala-lint=naming-convention
        public float leftScreenCenter[2];      // VR left screen center                                                 // vala-lint=naming-convention
        public float rightScreenCenter[2];     // VR right screen center                                                // vala-lint=naming-convention
        public float scale[2];                 // VR distortion scale
        public float scaleIn[2];               // VR distortion scale in                                                // vala-lint=naming-convention
    }

    [SimpleType]
    [CCode (cname = "FilePathList")]
    public struct FilePathList {
        public uint capacity;                   // Filepaths max entries
        public uint count;                      // Filepaths entries count
        public unowned string[] paths;          // Filepaths entries
    }

    [Flags]
    [CCode (cname = "ConfigFlags", cprefix = "FLAG_", has_type_id = false)]
    public enum ConfigFlags {
        VSYNC_HINT,                 // Set to try enabling V-Sync on GPU
        FULLSCREEN_MODE,            // Set to run program in fullscreen
        WINDOW_RESIZABLE,           // Set to allow resizable window
        WINDOW_UNDECORATED,         // Set to disable window decoration (frame and buttons)
        WINDOW_HIDDEN,              // Set to hide window
        WINDOW_MINIMIZED,           // Set to minimize window (iconify)
        WINDOW_MAXIMIZED,           // Set to maximize window (expanded to monitor)
        WINDOW_UNFOCUSED,           // Set to window non focused
        WINDOW_TOPMOST,             // Set to window always on top
        WINDOW_ALWAYS_RUN,          // Set to allow windows running while minimized
        WINDOW_TRANSPARENT,         // Set to allow transparent framebuffer
        WINDOW_HIGHDPI,             // Set to support HighDPI
        WINDOW_MOUSE_PASSTHROUGH,   // Set to support mouse passthrough, only supported when FLAG_WINDOW_UNDECORATED
        MSAA_4X_HINT,               // Set to try enabling MSAA 4X
        INTERLACED_HINT             // Set to try enabling interlaced video format (for V3D)
    }

    [CCode (cname = "TraceLogLevel", cprefix = "LOG_", has_type_id = false)]
    public enum TraceLogLevel {
        ALL,            // Display all logs
        TRACE,          // Trace logging, intended for internal use only
        DEBUG,          // Debug logging, used for internal debugging, it should be disabled on release builds
        INFO,           // Info logging, used for program execution info
        WARNING,        // Warning logging, used on recoverable failures
        ERROR,          // Error logging, used on unrecoverable failures
        FATAL,          // Fatal logging, used to abort program: exit(EXIT_FAILURE)
        NONE            // Disable logging
    }

    [CCode (cname = "KeyboardKey", cprefix = "KEY_", has_type_id = false)]
    public enum KeyboardKey {
        NULL,               // Key: NULL, used for no key pressed
        // Alphanumeric keys
        APOSTROPHE,         // Key: '
        COMMA,              // Key: ,
        MINUS,              // Key: -
        PERIOD,             // Key: .
        SLASH,              // Key: /
        ZERO,               // Key: 0
        ONE,                // Key: 1
        TWO,                // Key: 2
        THREE,              // Key: 3
        FOUR,               // Key: 4
        FIVE,               // Key: 5
        SIX,                // Key: 6
        SEVEN,              // Key: 7
        EIGHT,              // Key: 8
        NINE,               // Key: 9
        SEMICOLON,          // Key: ;
        EQUAL,              // Key: =
        A,                  // Key: A | a
        B,                  // Key: B | b
        C,                  // Key: C | c
        D,                  // Key: D | d
        E,                  // Key: E | e
        F,                  // Key: F | f
        G,                  // Key: G | g
        H,                  // Key: H | h
        I,                  // Key: I | i
        J,                  // Key: J | j
        K,                  // Key: K | k
        L,                  // Key: L | l
        M,                  // Key: M | m
        N,                  // Key: N | n
        O,                  // Key: O | o
        P,                  // Key: P | p
        Q,                  // Key: Q | q
        R,                  // Key: R | r
        S,                  // Key: S | s
        T,                  // Key: T | t
        U,                  // Key: U | u
        V,                  // Key: V | v
        W,                  // Key: W | w
        X,                  // Key: X | x
        Y,                  // Key: Y | y
        Z,                  // Key: Z | z
        LEFT_BRACKET,       // Key: [
        BACKSLASH,          // Key: '\'
        RIGHT_BRACKET,      // Key: ]
        GRAVE,              // Key: `
        // Function keys
        SPACE,              // Key: Space
        ESCAPE,             // Key: Esc
        ENTER,              // Key: Enter
        TAB,                // Key: Tab
        BACKSPACE,          // Key: Backspace
        INSERT,             // Key: Ins
        DELETE,             // Key: Del
        RIGHT,              // Key: Cursor right
        LEFT,               // Key: Cursor left
        DOWN,               // Key: Cursor down
        UP,                 // Key: Cursor up
        PAGE_UP,            // Key: Page up
        PAGE_DOWN,          // Key: Page down
        HOME,               // Key: Home
        END,                // Key: End
        CAPS_LOCK,          // Key: Caps lock
        SCROLL_LOCK,        // Key: Scroll down
        NUM_LOCK,           // Key: Num lock
        PRINT_SCREEN,       // Key: Print screen
        PAUSE,              // Key: Pause
        F1,                 // Key: F1
        F2,                 // Key: F2
        F3,                 // Key: F3
        F4,                 // Key: F4
        F5,                 // Key: F5
        F6,                 // Key: F6
        F7,                 // Key: F7
        F8,                 // Key: F8
        F9,                 // Key: F9
        F10,                // Key: F10
        F11,                // Key: F11
        F12,                // Key: F12
        LEFT_SHIFT,         // Key: Shift left
        LEFT_CONTROL,       // Key: Control left
        LEFT_ALT,           // Key: Alt left
        LEFT_SUPER,         // Key: Super left
        RIGHT_SHIFT,        // Key: Shift right
        RIGHT_CONTROL,      // Key: Control right
        RIGHT_ALT,          // Key: Alt right
        RIGHT_SUPER,        // Key: Super right
        KB_MENU,            // Key: KB menu
        // Keypad keys
        KP_0,               // Key: Keypad 0
        KP_1,               // Key: Keypad 1
        KP_2,               // Key: Keypad 2
        KP_3,               // Key: Keypad 3
        KP_4,               // Key: Keypad 4
        KP_5,               // Key: Keypad 5
        KP_6,               // Key: Keypad 6
        KP_7,               // Key: Keypad 7
        KP_8,               // Key: Keypad 8
        KP_9,               // Key: Keypad 9
        KP_DECIMAL,         // Key: Keypad .
        KP_DIVIDE,          // Key: Keypad /
        KP_MULTIPLY,        // Key: Keypad *
        KP_SUBTRACT,        // Key: Keypad -
        KP_ADD,             // Key: Keypad +
        KP_ENTER,           // Key: Keypad Enter
        KP_EQUAL,           // Key: Keypad =
        // Android key buttons
        BACK,               // Key: Android back button
        MENU,               // Key: Android menu button
        VOLUME_UP,          // Key: Android volume up button
        VOLUME_DOWN         // Key: Android volume down button
    }

    [CCode (cname = "MouseButton", cprefix = "MOUSE_BUTTON_", has_type_id = false)]
    public enum MouseButton {
        LEFT,           // Mouse button left
        RIGHT,          // Mouse button right
        MIDDLE,         // Mouse button middle (pressed wheel)
        SIDE,           // Mouse button side (advanced mouse device)
        EXTRA,          // Mouse button extra (advanced mouse device)
        FORWARD,        // Mouse button fordward (advanced mouse device)
        BACK,           // Mouse button back (advanced mouse device)
    }

    [CCode (cname = "MouseCursor", cprefix = "MOUSE_CURSOR_", has_type_id = false)]
    public enum MouseCursor {
        DEFAULT,        // Default pointer shape
        ARROW,          // Arrow shape
        IBEAM,          // Text writing cursor shape
        CROSSHAIR,      // Cross shape
        POINTING_HAND,  // Pointing hand cursor
        RESIZE_EW,      // Horizontal resize/move arrow shape
        RESIZE_NS,      // Vertical resize/move arrow shape
        RESIZE_NWSE,    // Top-left to bottom-right diagonal resize/move arrow shape
        RESIZE_NESW,    // The top-right to bottom-left diagonal resize/move arrow shape
        RESIZE_ALL,     // The omni-directional resize/move cursor shape
        NOT_ALLOWED     // The operation-not-allowed shape
    }

    [CCode (cname = "GamepadButton", cprefix = "GAMEPAD_BUTTON_", has_type_id = false)]
    public enum GamepadButton {
        UNKNOWN,             // Unknown button, just for error checking
        LEFT_FACE_UP,        // Gamepad left DPAD up button
        LEFT_FACE_RIGHT,     // Gamepad left DPAD right button
        LEFT_FACE_DOWN,      // Gamepad left DPAD down button
        LEFT_FACE_LEFT,      // Gamepad left DPAD left button
        RIGHT_FACE_UP,       // Gamepad right button up (i.e. PS3: Triangle, Xbox: Y)
        RIGHT_FACE_RIGHT,    // Gamepad right button right (i.e. PS3: Square, Xbox: X)
        RIGHT_FACE_DOWN,     // Gamepad right button down (i.e. PS3: Cross, Xbox: A)
        RIGHT_FACE_LEFT,     // Gamepad right button left (i.e. PS3: Circle, Xbox: B)
        LEFT_TRIGGER_1,      // Gamepad top/back trigger left (first), it could be a trailing button
        LEFT_TRIGGER_2,      // Gamepad top/back trigger left (second), it could be a trailing button
        RIGHT_TRIGGER_1,     // Gamepad top/back trigger right (one), it could be a trailing button
        RIGHT_TRIGGER_2,     // Gamepad top/back trigger right (second), it could be a trailing button
        MIDDLE_LEFT,         // Gamepad center buttons, left one (i.e. PS3: Select)
        MIDDLE,              // Gamepad center buttons, middle one (i.e. PS3: PS, Xbox: XBOX)
        MIDDLE_RIGHT,        // Gamepad center buttons, right one (i.e. PS3: Start)
        LEFT_THUMB,          // Gamepad joystick pressed button left
        RIGHT_THUMB          // Gamepad joystick pressed button right
    }

    [CCode (cname = "GamepadAxis", cprefix = "GAMEPAD_AXIS_", has_type_id = false)]
    public enum GamepadAxis {
        LEFT_X,            // Gamepad left stick X axis
        LEFT_Y,            // Gamepad left stick Y axis
        RIGHT_X,           // Gamepad right stick X axis
        RIGHT_Y,           // Gamepad right stick Y axis
        LEFT_TRIGGER,      // Gamepad back trigger left, pressure level: [1..-1]
        RIGHT_TRIGGER      // Gamepad back trigger right, pressure level: [1..-1]
    }

    [CCode (cname = "MaterialMapIndex", cprefix = "MATERIAL_MAP_", has_type_id = false)]
    public enum MaterialMapIndex {
        ALBEDO,            // Albedo material (same as: MATERIAL_MAP_DIFFUSE)
        METALNESS,         // Metalness material (same as: MATERIAL_MAP_SPECULAR)
        NORMAL,            // Normal material
        ROUGHNESS,         // Roughness material
        OCCLUSION,         // Ambient occlusion material
        EMISSION,          // Emission material
        HEIGHT,            // Heightmap material
        CUBEMAP,           // Cubemap material (NOTE: Uses GL_TEXTURE_CUBE_MAP)
        IRRADIANCE,        // Irradiance material (NOTE: Uses GL_TEXTURE_CUBE_MAP)
        PREFILTER,         // Prefilter material (NOTE: Uses GL_TEXTURE_CUBE_MAP)
        BRDF
    }

    [CCode (cname = "ShaderUniformDataType", cprefix = "SHADER_UNIFORM_", has_type_id = false)]
    public enum ShaderUniformDataType {
        FLOAT,           // Shader uniform type: float
        VEC2,            // Shader uniform type: vec2 (2 float)
        VEC3,            // Shader uniform type: vec3 (3 float)
        VEC4,            // Shader uniform type: vec4 (4 float)
        INT,             // Shader uniform type: int
        IVEC2,           // Shader uniform type: ivec2 (2 int)
        IVEC3,           // Shader uniform type: ivec3 (3 int)
        IVEC4,           // Shader uniform type: ivec4 (4 int)
        SAMPLER2D        // Shader uniform type: sampler2d
    }

    [CCode (cname = "ShaderAttributeDataType", cprefix = "SHADER_ATTRIB_", has_type_id = false)]
    public enum ShaderAttributeDataType {
        FLOAT,            // Shader attribute type: float
        VEC2,             // Shader attribute type: vec2 (2 float)
        VEC3,             // Shader attribute type: vec3 (3 float)
        VEC4              // Shader attribute type: vec4 (4 float)
    }

    [CCode (cname = "PixelFormat", cprefix = "PIXELFORMAT_", has_type_id = false)]
    public enum PixelFormat {
        UNCOMPRESSED_GRAYSCALE,         // 8 bit per pixel (no alpha)
        UNCOMPRESSED_GRAY_ALPHA,        // 8*2 bpp (2 channels)
        UNCOMPRESSED_R5G6B5,            // 16 bpp
        UNCOMPRESSED_R8G8B8,            // 24 bpp
        UNCOMPRESSED_R5G5B5A1,          // 16 bpp (1 bit alpha)
        UNCOMPRESSED_R4G4B4A4,          // 16 bpp (4 bit alpha)
        UNCOMPRESSED_R8G8B8A8,          // 32 bpp
        UNCOMPRESSED_R32,               // 32 bpp (1 channel - float)
        UNCOMPRESSED_R32G32B32,         // 32*3 bpp (3 channels - float)
        UNCOMPRESSED_R32G32B32A32,      // 32*4 bpp (4 channels - float)
        COMPRESSED_DXT1_RGB,            // 4 bpp (no alpha)
        COMPRESSED_DXT1_RGBA,           // 4 bpp (1 bit alpha)
        COMPRESSED_DXT3_RGBA,           // 8 bpp
        COMPRESSED_DXT5_RGBA,           // 8 bpp
        COMPRESSED_ETC1_RGB,            // 4 bpp
        COMPRESSED_ETC2_RGB,            // 4 bpp
        COMPRESSED_ETC2_EAC_RGBA,       // 8 bpp
        COMPRESSED_PVRT_RGB,            // 4 bpp
        COMPRESSED_PVRT_RGBA,           // 4 bpp
        COMPRESSED_ASTC_4x4_RGBA,       // 8 bpp                                                                        // vala-lint=naming-convention
        COMPRESSED_ASTC_8x8_RGBA        // 2 bpp                                                                        // vala-lint=naming-convention
    }

    [CCode (cname = "TextureFilter", cprefix = "TEXTURE_FILTER_", has_type_id = false)]
    public enum TextureFilter {
        POINT,                   // No filter, just pixel approximation
        BILINEAR,                // Linear filtering
        TRILINEAR,               // Trilinear filtering (linear with mipmaps)
        ANISOTROPIC_4X,          // Anisotropic filtering 4x
        ANISOTROPIC_8X,          // Anisotropic filtering 8x
        ANISOTROPIC_16X,         // Anisotropic filtering 16x
    }

    [CCode (cname = "TextureWrap", cprefix = "TEXTURE_WRAP_", has_type_id = false)]
    public enum TextureWrap {
        REPEAT,                    // Repeats texture in tiled mode
        CLAMP,                     // Clamps texture to edge pixel in tiled mode
        MIRROR_REPEAT,             // Mirrors and repeats the texture in tiled mode
        MIRROR_CLAMP               // Mirrors and clamps to border the texture in tiled mode
    }

    [CCode (cname = "CubemapLayout", cprefix = "CUBEMAP_LAYOUT_", has_type_id = false)]
    public enum CubemapLayout {
        AUTO_DETECT,             // Automatically detect layout type
        LINE_VERTICAL,           // Layout is defined by a vertical line with faces
        LINE_HORIZONTAL,         // Layout is defined by an horizontal line with faces
        CROSS_THREE_BY_FOUR,     // Layout is defined by a 3x4 cross with cubemap faces
        CROSS_FOUR_BY_THREE,     // Layout is defined by a 4x3 cross with cubemap faces
        PANORAMA                 // Layout is defined by a panorama image (equirectangular map)
    }

    [CCode (cname = "FontType", cprefix = "FONT_", has_type_id = false)]
    public enum FontType {
        DEFAULT,                 // Default font generation, anti-aliased
        BITMAP,                  // Bitmap font generation, no anti-aliasing
        SDF                      // SDF font generation, requires external shader
    }

    [CCode (cname = "BlendMode", cprefix = "BLEND_", has_type_id = false)]
    public enum BlendMode {
        ALPHA,                   // Blend textures considering alpha (default)
        ADDITIVE,                // Blend textures adding colors
        MULTIPLIED,              // Blend textures multiplying colors
        ADD_COLORS,              // Blend textures adding colors (alternative)
        SUBTRACT_COLORS,         // Blend textures subtracting colors (alternative)
        ALPHA_PREMULTIPLY,       // Blend premultiplied textures considering alpha
        CUSTOM                   // Blend textures using custom src/dst factors (use rlSetBlendMode())
    }

    [Flags]
    [CCode (cname = "Gesture", cprefix = "GESTURE_", has_type_id = false)]
    public enum Gesture {
        NONE,           // No gesture
        TAP,            // Tap gesture
        DOUBLETAP,      // Double tap gesture
        HOLD,           // Hold gesture
        DRAG,           // Drag gesture
        SWIPE_RIGHT,    // Swipe right gesture
        SWIPE_LEFT,     // Swipe left gesture
        SWIPE_UP,       // Swipe up gesture
        SWIPE_DOWN,     // Swipe down gesture
        PINCH_IN,       // Pinch in gesture
        PINCH_OUT       // Pinch out gesture
    }

    [CCode (cname = "CameraMode", cprefix = "CAMERA_", has_type_id = false)]
    public enum CameraMode {
        CUSTOM,                  // Custom camera
        FREE,                    // Free camera
        ORBITAL,                 // Orbital camera
        FIRST_PERSON,            // First person camera
        THIRD_PERSON             // Third person camera
    }

    [CCode (cname = "CameraProjection", cprefix = "CAMERA_", has_type_id = false)]
    public enum CameraProjection {
        PERSPECTIVE,             // Perspective projection
        ORTHOGRAPHIC             // Orthographic projection
    }

    [CCode (cname = "NPatchLayout", cprefix = "NPATCH_", has_type_id = false)]
    public enum NPatchLayout {
        NINE_PATCH,              // Npatch layout: 3x3 tiles
        THREE_PATCH_VERTICAL,    // Npatch layout: 1x3 tiles
        THREE_PATCH_HORIZONTAL   // Npatch layout: 3x1 tiles
    }

    // Callbacks to hook some internal functions
    // WARNING: This callbacks are intended for advance users
    [CCode (cname = "TraceLogCallback")]
    public delegate void TraceLogCallback (TraceLogLevel log_level, string text, va_list args);

    [CCode (cname = "LoadFileDataCallback")]
    public delegate uchar LoadFileDataCallback (string filename, out int bytes_read);

    [CCode (cname = "SaveFileDataCallback")]
    public delegate bool SaveFileDataCallback (string filename, void* data, uint bytes_to_write);

    [CCode (cname = "LoadFileTextCallback")]
    public delegate char LoadFileTextCallback (string filename);

    [CCode (cname = "SaveFileTextCallback")]
    public delegate bool SaveFileTextCallback (string filename, string text);

    //------------------------------------------------------------------------------------
    // Window and Graphics Device Functions (Module: core)
    //------------------------------------------------------------------------------------

    // Window-related functions
    [CCode (cname = "InitWindow")]
    public static void init_window (int width, int height, string title);

    [CCode (cname = "WindowShouldClose")]
    public static bool window_should_close ();

    [CCode (cname = "CloseWindow")]
    public static void close_window ();

    [CCode (cname = "IsWindowReady")]
    public static bool is_window_ready ();

    [CCode (cname = "IsWindowFullscreen")]
    public static bool is_window_fullscreen ();

    [CCode (cname = "IsWindowHidden")]
    public static bool is_window_hidden ();

    [CCode (cname = "IsWindowMinimized")]
    public static bool is_window_minimized ();

    [CCode (cname = "IsWindowMaximized")]
    public static bool is_window_maximized ();

    [CCode (cname = "IsWindowFocused")]
    public static bool is_window_focused ();

    [CCode (cname = "IsWindowResized")]
    public static bool is_window_resized ();

    [CCode (cname = "IsWindowState")]
    public static bool is_window_state (ConfigFlags flag);

    [CCode (cname = "SetWindowState")]
    public static void set_window_state (ConfigFlags flags);

    [CCode (cname = "ClearWindowState")]
    public static void clear_window_state (ConfigFlags flags);

    [CCode (cname = "ToggleFullscreen")]
    public static void toggle_fullscreen ();

    [CCode (cname = "MaximizeWindow")]
    public static void maximise_window ();

    [CCode (cname = "MinimizeWindow")]
    public static void minimize_window ();

    [CCode (cname = "RestoreWindow")]
    public static void restore_window ();

    [CCode (cname = "SetWindowIcon")]
    public static void set_window_icon (Image image);

    [CCode (cname = "SetWindowTitle")]
    public static void set_window_title (string title);

    [CCode (cname = "SetWindowPosition")]
    public static void set_window_position (int x, int y);

    [CCode (cname = "SetWindowMonitor")]
    public static void set_window_monitor (int monitor);

    [CCode (cname = "SetWindowMinSize")]
    public static void set_window_minimum_size (int width, int height);

    [CCode (cname = "SetWindowSize")]
    public static void set_window_size (int width, int height);

    [CCode (cname = "SetWindowOpacity")]
    public static void set_window_opacity (float opacity);

    [CCode (cname = "GetWindowHandle")]
    public static void* get_window_handle ();

    [CCode (cname = "GetScreenWidth")]
    public static int get_screen_width ();

    [CCode (cname = "GetScreenHeight")]
    public static int get_screen_height ();

    [CCode (cname = "GetRenderWidth")]
    public static int get_render_width ();

    [CCode (cname = "GetRenderHeight")]
    public static int get_render_height ();

    [CCode (cname = "GetCurrentMonitor")]
    public static int get_current_monitor ();

    [CCode (cname = "GetMonitorPosition")]
    public static Vector2 get_monitor_position (int monitor);

    [CCode (cname = "GetWindowPosition")]
    public static Vector2 get_window_position ();

    [CCode (cname = "GetWindowScaleDPI")]
    public static Vector2 get_window_scale_dpi ();

    [CCode (cname = "GetMonitorCount")]
    public static int get_monitor_count ();

    [CCode (cname = "GetMonitorWidth")]
    public static int get_monitor_width (int monitor);

    [CCode (cname = "GetMonitorHeight")]
    public static int get_hmonitor_eight (int monitor);

    [CCode (cname = "GetMonitorPhysicalWidth")]
    public static int get_monitor_physical_width (int monitor);

    [CCode (cname = "GetMonitorPhysicalHeight")]
    public static int get_monitor_physical_height (int monitor);

    [CCode (cname = "GetMonitorRefreshRate")]
    public static int get_monitor_refresh_rate (int monitor);

    [CCode (cname = "GetMonitorName")]
    public static string get_monitor_name (int monitor);

    [CCode (cname = "SetClipboardText")]
    public static void set_clipboard_text (string text);

    [CCode (cname = "GetClipboardText")]
    public static string get_clipboard_text ();

    [CCode (cname = "EnableEventWaiting")]
    public static void enable_event_waiting ();

    [CCode (cname = "DisableEventWaiting")]
    public static void disable_event_waiting ();

    // Custom frame control functions
    // NOTE: Those functions are intended for advance users that want full control over the frame processing
    [CCode (cname = "SwapScreenBuffer")]
    public static void swap_screen_buffer ();

    [CCode (cname = "PollInputEvents")]
    public static void poll_input_events ();

    [CCode (cname = "WaitTime")]
    public static void wait_time (double seconds);

    // Cursor-related functions
    [CCode (cname = "ShowCursor")]
    public static void show_cursor ();

    [CCode (cname = "HideCursor")]
    public static void hide_cursor ();

    [CCode (cname = "IsCursorHidden")]
    public static bool is_cursor_hidden ();

    [CCode (cname = "EnableCursor")]
    public static void enable_cursor ();

    [CCode (cname = "DisableCursor")]
    public static void disable_cursor ();

    [CCode (cname = "IsCursorOnScreen")]
    public static bool is_cursor_on_screen ();

    // Drawing-related functions
    [CCode (cname = "ClearBackground")]
    public static void clear_background (Color color);

    [CCode (cname = "BeginDrawing")]
    public static void begin_drawing ();

    [CCode (cname = "EndDrawing")]
    public static void end_drawing ();

    [CCode (cname = "BeginMode2D")]
    public static void begin_mode_2D (Camera2D camera);                                                                 // vala-lint=naming-convention

    [CCode (cname = "EndMode2D")]
    public static void end_mode_2D ();                                                                                  // vala-lint=naming-convention

    [CCode (cname = "BeginMode3D")]
    public static void begin_mode_3D (Camera3D camera);                                                                 // vala-lint=naming-convention

    [CCode (cname = "EndMode3D")]
    public static void end_mode_3D ();                                                                                  // vala-lint=naming-convention

    [CCode (cname = "BeginTextureMode")]
    public static void begin_texture_mode (RenderTexture2D target);

    [CCode (cname = "EndTextureMode")]
    public static void end_texture_mode ();

    [CCode (cname = "BeginShaderMode")]
    public static void begin_shader_mode (Shader shader);

    [CCode (cname = "EndShaderMode")]
    public static void end_shader_mode ();

    [CCode (cname = "BeginBlendMode")]
    public static void begin_blend_mode (BlendMode mode);

    [CCode (cname = "EndBlendMode")]
    public static void end_blend_mode ();

    [CCode (cname = "BeginScissorMode")]
    public static void begin_scissor_mode (int x, int y, int width, int height);

    [CCode (cname = "EndScissorMode")]
    public static void end_scissor_mode ();

    [CCode (cname = "BeginVrStereoMode")]
    public static void begin_vr_stereo_mode (VrStereoConfig config);

    [CCode (cname = "EndVrStereoMode")]
    public static void end_vr_stereo_mode ();

    // VR stereo config functions for VR simulator
    [CCode (cname = "LoadVrStereoConfig")]
    public static VrStereoConfig load_vr_stereo_config (VrDeviceInfo device);

    [CCode (cname = "UnloadVrStereoConfig")]
    public static void unload_vr_stereo_config (VrStereoConfig config);

    // Shader management functions
    // NOTE: Shader functionality is not available on OpenGL 1.1
    [CCode (cname = "LoadShader")]
    public static Shader load_shader (string vertex_filename, string fragment_filename);

    [CCode (cname = "LoadShaderFromMemory")]
    public static Shader load_shader_from_memory (string vertex_shader, string fragment_shader);

    [CCode (cname = "GetShaderLocation")]
    public int get_shader_location (Shader shader, string uniform_name);

    [CCode (cname = "GetShaderLocationAttrib")]
    public int get_shader_location_attribute (Shader shader, string attribute_name);

    [CCode (cname = "SetShaderValue")]
    public void set_shader_value (Shader shader, int location, void* value, ShaderUniformDataType type);

    [CCode (cname = "SetShaderValueV")]
    public void set_shader_value_vector (Shader shader, int location, void* value, ShaderUniformDataType type, int count);

    [CCode (cname = "SetShaderValueMatrix")]
    public void set_shader_value_matrix (Shader shader, int location, Matrix matrix);

    [CCode (cname = "SetShaderValueTexture")]
    public void set_shader_value_texture (Shader shader, int location, Texture2D texture);

    [CCode (cname = "UnloadShader")]
    public void unload_shader (Shader shader);

    //  Screen-space-related functions
    [CCode (cname = "GetMouseRay")]
    public static Ray get_mouse_ray (Vector2 mouse_position, Camera camera);

    [CCode (cname = "GetCameraMatrix")]
    public static Matrix get_camera_matrix (Camera camera);

    [CCode (cname = "GetCameraMatrix2D")]
    public static Matrix get_camera_matrix_2D (Camera2D camera);                                                        // vala-lint=naming-convention

    [CCode (cname = "GetWorldToScreen")]
    public static Vector2 get_world_to_screen (Vector3 position, Camera camera);

    [CCode (cname = "GetScreenToWorld2D")]
    public static Vector2 get_screen_to_world_2D (Vector2 position, Camera2D camera);                                   // vala-lint=naming-convention

    [CCode (cname = "GetWorldToScreenEx")]
    public static Vector2 get_get_world_to_screen_ext (Vector3 position, Camera camera, int width, int height);

    [CCode (cname = "GetWorldToScreen2D")]
    public static Vector2 get_world_to_screen_2D (Vector2 position, Camera2D camera);                                   // vala-lint=naming-convention

    //  Timing-related functions
    [CCode (cname = "SetTargetFPS")]
    public static void set_target_fps (int fps);

    [CCode (cname = "GetFPS")]
    public static int get_fps ();

    [CCode (cname = "GetFrameTime")]
    public static float get_frame_time ();

    [CCode (cname = "GetTime")]
    public static double get_time ();

    //  Misc. functions
    [CCode (cname = "GetRandomValue")]
    public static int get_random_value (int minimum, int maximum);

    [CCode (cname = "SetRandomSeed")]
    public static void set_random_seed (uint seed);

    [CCode (cname = "TakeScreenshot")]
    public static void take_screenshot (string filename);


    [CCode (cname = "SetConfigFlags")]
    public static void set_config_flags (ConfigFlags flags);

    [CCode (cname = "TraceLog")]
    public static void trace_log (TraceLogLevel level, string text, ...);

    [CCode (cname = "SetTraceLogLevel")]
    public static void set_trace_log_level (TraceLogLevel level);

    [CCode (cname = "MemAlloc")]
    public static void* memory_allocate (int size);

    [CCode (cname = "MemRealloc")]
    public static void* memory_realocate (void* pointer, int size);

    [CCode (cname = "MemFree")]
    public static void memory_free (void* pointer);

    [CCode (cname = "OpenURL")]
    public static void open_url (string url);

    // Set custom callbacks
    // WARNING: Callbacks setup is intended for advance users
    [CCode (cname = "SetTraceLogCallback")]
    public static void set_trace_log_callback (TraceLogCallback callback);

    [CCode (cname = "SetLoadFileDataCallback")]
    public static void set_load_file_data_callback (LoadFileDataCallback callback);

    [CCode (cname = "SetSaveFileDataCallback")]
    public static void set_save_file_data_callback (SaveFileDataCallback callback);

    [CCode (cname = "SetLoadFileTextCallback")]
    public static void set_load_file_text_callback (LoadFileTextCallback callback);

    [CCode (cname = "SetSaveFileTextCallback")]
    public static void set_save_file_text_callback (SaveFileTextCallback callback);

    //  File management functions
    //  TODO: Actually add this

    //------------------------------------------------------------------------------------
    // Input Handling Functions (Module: core)
    //------------------------------------------------------------------------------------
    [CCode (cname = "IsKeyPressed")]
    public static bool is_key_pressed (KeyboardKey key);

    [CCode (cname = "IsKeyDown")]
    public static bool is_key_down (KeyboardKey key);

    [CCode (cname = "IsKeyReleased")]
    public static bool is_key_released (KeyboardKey key);

    [CCode (cname = "IsKeyUp")]
    public static bool is_key_up (KeyboardKey key);

    [CCode (cname = "SetExitKey")]
    public static void set_exit_key (KeyboardKey key);

    [CCode (cname = "GetKeyPressed")]
    public static KeyboardKey get_key_pressed ();

    [CCode (cname = "GetCharPressed")]
    public static int get_char_pressed ();

    [CCode (cname = "IsGamepadAvailable")]
    public static bool is_gamepad_available (int gamepad);

    [CCode (cname = "GetGamepadName")]
    public static string get_gamepad_name (int gamepad);

    [CCode (cname = "IsGamepadButtonPressed")]
    public static bool is_gamepad_button_pressed (int gamepad, GamepadButton button);

    [CCode (cname = "IsGamepadButtonDown")]
    public static bool is_gamepad_button_down (int gamepad, GamepadButton button);

    [CCode (cname = "IsGamepadButtonReleased")]
    public static bool is_gamepad_button_released (int gamepad, GamepadButton button);

    [CCode (cname = "IsGamepadButtonUp")]
    public static bool is_gamepad_button_up (int gamepad, GamepadButton button);

    [CCode (cname = "GetGamepadButtonPressed")]
    public static GamepadButton get_gamepad_button_pressed ();

    [CCode (cname = "GetGamepadAxisCount")]
    public static int get_gamepad_axis_count (int gamepad);

    [CCode (cname = "GetGamepadAxisMovement")]
    public static float get_gamepad_axis_movement (int gamepad, GamepadAxis axis);

    [CCode (cname = "SetGamepadMappings")]
    public static int set_gamepad_mappings (string mappings);

    [CCode (cname = "IsMouseButtonPressed")]
    public static bool is_mouse_button_pressed (MouseButton button);

    [CCode (cname = "IsMouseButtonDown")]
    public static bool is_mouse_button_down (MouseButton button);

    [CCode (cname = "IsMouseButtonReleased")]
    public static bool is_mouse_button_released (MouseButton button);

    [CCode (cname = "IsMouseButtonUp")]
    public static bool is_mouse_button_up (MouseButton button);

    [CCode (cname = "GetMouseX")]
    public static int get_mouse_x ();

    [CCode (cname = "GetMouseY")]
    public static int get_mouse_y ();

    [CCode (cname = "GetMousePosition")]
    public static Vector2 get_mouse_position ();

    [CCode (cname = "GetMouseDelta")]
    public static Vector2 get_mouse_delta ();

    [CCode (cname = "SetMousePosition")]
    public static void set_mouse_position (int x, int y);

    [CCode (cname = "SetMouseOffset")]
    public static void set_mouse_offset (int offset_x, int offset_y);

    [CCode (cname = "SetMouseScale")]
    public static void set_mouse_scale (float scale_x, float scale_y);

    [CCode (cname = "GetMouseWheelMove")]
    public static float get_mouse_wheel_move ();

    [CCode (cname = "GetMouseWheelMoveV")]
    public static Vector2 get_mouse_wheel_move_vector ();

    [CCode (cname = "SetMouseCursor")]
    public static void set_mouse_cursor (MouseCursor cursor);

    [CCode (cname = "GetTouchX")]
    public static int get_touch_x ();

    [CCode (cname = "GetTouchY")]
    public static int get_touch_y ();

    [CCode (cname = "GetTouchPosition")]
    public static Vector2 get_touch_position (int index);

    [CCode (cname = "GetTouchPointId")]
    public static int get_touch_point_id (int index);

    [CCode (cname = "GetTouchPointCount")]
    public static int get_touch_point_count ();

    //------------------------------------------------------------------------------------
    // Gestures and Touch Handling Functions (Module: rgestures)
    //------------------------------------------------------------------------------------
    [CCode (cname = "SetGestureEnabled")]
    public static void set_gesture_enabled (Gesture flags);

    [CCode (cname = "IsGestureDetected")]
    public static bool is_gesture_detected (Gesture gesture);

    [CCode (cname = "GetGestureDetected")]
    public static Gesture get_gesture_detected ();

    [CCode (cname = "GetGestureHoldDuration")]
    public static float get_gesture_hold_duration ();

    [CCode (cname = "GetGestureDragVector")]
    public static Vector2 get_gesture_drag_duration ();

    [CCode (cname = "GetGestureDragAngle")]
    public static float get_gesture_drag_angle ();

    [CCode (cname = "GetGesturePinchVector")]
    public static Vector2 get_gesture_pinch_vector ();

    [CCode (cname = "GetGesturePinchAngle")]
    public static float get_gesture_pinch_angle ();

    //------------------------------------------------------------------------------------
    // Camera System Functions (Module: rcamera)
    //------------------------------------------------------------------------------------
    [CCode (cname = "SetCameraMode")]
    public static void set_camera_mode (Camera camera, CameraMode mode);

    [CCode (cname = "UpdateCamera")]
    public static void update_camera (Camera? camera);

    [CCode (cname = "SetCameraPanControls")]
    public static void set_camera_pan_control (KeyboardKey key);

    [CCode (cname = "SetCameraAltControl")]
    public static void set_camera_alt_control (KeyboardKey key);

    [CCode (cname = "SetCameraZoomControl")]
    public static void set_camera_zoom_control (KeyboardKey key);

    [CCode (cname = "SetCameraMoveControls")]
    public static void set_camera_move_controls (KeyboardKey front, KeyboardKey back, KeyboardKey right, KeyboardKey left, KeyboardKey up, KeyboardKey down);

    //------------------------------------------------------------------------------------
    // Basic Shapes Drawing Functions (Module: shapes)
    //------------------------------------------------------------------------------------
    [CCode (cname = "SetShapesTexture")]
    public static void set_shapes_texture (Texture2D texture, Rectangle source);

    [CCode (cname = "DrawPixel")]
    public static void draw_pixel (int x, int y, Color color);

    [CCode (cname = "DrawPixelV")]
    public static void draw_pixel_vector (Vector2 position, Color color);

    [CCode (cname = "DrawLine")]
    public static void draw_line (int start_x, int start_y, int end_x, int end_y, Color color);

    [CCode (cname = "DrawLineV")]
    public static void draw_line_vector (Vector2 start, Vector2 end, Color color);

    [CCode (cname = "DrawLineEx")]
    public static void draw_line_ext (Vector2 start, Vector2 end, float thickness, Color color);

    [CCode (cname = "DrawLineBezier")]
    public static void draw_line_bezier (Vector2 start, Vector2 end, float thick, Color color);

    [CCode (cname = "DrawLineBezierQuad")]
    public static void draw_line_bezier_quad (Vector2 start, Vector2 end, Vector2 control, float thick, Color color);

    [CCode (cname = "DrawLineBezierCubic")]
    public static void draw_line_bezier_cubic (Vector2 start, Vector2 end, Vector2 start_control, Vector2 end_control, float thickness, Color color);

    [CCode (cname = "DrawLineStrip")]
    public static void draw_line_strip (Vector2[] points, Color color);

    [CCode (cname = "DrawCircle")]
    public static void draw_circle (int center_x, int center_y, float radius, Color color);

    [CCode (cname = "DrawCircleSector")]
    public static void draw_circle_sector (Vector2 center, float radius, float start, float end, int segments, Color color);

    [CCode (cname = "DrawCircleSectorLines")]
    public static void draw_circle_sector_lines (Vector2 center, float radius, float start, float end, int segments, Color color);

    [CCode (cname = "DrawCircleGradient")]
    public static void draw_circle_gradient (int center_x, int center_y, float radius, Color color1, Color color2);

    [CCode (cname = "DrawCircleV")]
    public static void draw_circle_vector (Vector2 center, float radius, Color color);

    [CCode (cname = "DrawCircleLines")]
    public static void draw_circle_lines (int center_x, int center_y, float radius, Color color);

    [CCode (cname = "DrawEllipse")]
    public static void draw_ellipse (int center_x, int center_y, float radius_horizontal, float radius_vertical, Color color);

    [CCode (cname = "DrawEllipseLines")]
    public static void draw_ellipse_lines (int center_x, int center_y, float radius_horizontal, float radius_vertical, Color color);

    [CCode (cname = "DrawRing")]
    public static void draw_ring (Vector2 center, float inner_radius, float outer_radius, float start, float end, int segments, Color color);

    [CCode (cname = "DrawRingLines")]
    public static void draw_ring_lines (Vector2 center, float inner_radius, float outer_radius, float start, float end, int segments, Color color);

    [CCode (cname = "DrawRectangle")]
    public static void draw_rectangle (int x, int y, int width, int height, Color color);

    [CCode (cname = "DrawRectangleV")]
    public static void draw_rectangle_vector (Vector2 position, Vector2 size, Color color);

    [CCode (cname = "DrawRectangleRec")]
    public static void draw_rectangle_rect (Rectangle rectangle, Color color);

    [CCode (cname = "DrawRectanglePro")]
    public static void draw_rectangle_pro (Rectangle rectangle, Vector2 origin, float rotation, Color color);

    [CCode (cname = "DrawRectangleGradientV")]
    public static void draw_rectangle_gradient_vector (int x, int y, int width, int height, Color color1, Color color2);

    [CCode (cname = "DrawRectangleGradientH")]
    public static void draw_rectangle_gradient_horizontal (int x, int y, int width, int height, Color color1, Color color2);

    [CCode (cname = "DrawRectangleGradientEx")]
    public static void draw_rectangle_gradient_ext (Rectangle rectangle, Color color1, Color color2, Color color3, Color color4);

    [CCode (cname = "DrawRectangleLines")]
    public static void draw_rectangle_lines (int x, int y, int width, int height, Color color);

    [CCode (cname = "DrawRectangleLinesEx")]
    public static void draw_rectangle_lines_ext (Rectangle rectangle, float thickness, Color color);

    [CCode (cname = "DrawRectangleRounded")]
    public static void draw_rectangle_rounded (Rectangle rectangle, float roundness, int segments, Color color);

    [CCode (cname = "DrawRectangleRoundedLines")]
    public static void draw_rectangle_rounded_lines (Rectangle rectangle, float roundness, int segments, float thickness, Color color);

    [CCode (cname = "DrawTriangle")]
    public static void draw_triangle (Vector2 vector1, Vector2 vector2, Vector2 vector3, Color color);

    [CCode (cname = "DrawTriangleLines")]
    public static void draw_triangle_lines (Vector2 vector1, Vector2 vector2, Vector2 vector3, Color color);

    [CCode (cname = "DrawTriangleFan")]
    public static void draw_triangle_fan (Vector2[] points, Color color);

    [CCode (cname = "DrawTriangleStrip")]
    public static void draw_triangle_strip (Vector2[] points, Color color);

    [CCode (cname = "DrawPoly")]
    public static void draw_poly (Vector2 center, int sides, float radius, float rotation, Color color);

    [CCode (cname = "DrawPolyLines")]
    public static void draw_poly_lines (Vector2 center, int sides, float radius, float rotation, Color color);

    [CCode (cname = "DrawPolyLinesEx")]
    public static void draw_poly_lines_ext (Vector2 center, int sides, float radius, float rotation, float thickness, Color color);

    //  Basic shapes collision detection functions
    [CCode (cname = "CheckCollisionRecs")]
    public static bool check_collision_rectangles (Rectangle rectangle1, Rectangle rectangle2);

    [CCode (cname = "CheckCollisionCircles")]
    public static bool check_collision_circles (Vector2 center1, float radius1, Vector2 center2, float radius2);

    [CCode (cname = "CheckCollisionCircleRec")]
    public static bool check_collision_circle_rectangle (Vector2 center, float radius, Rectangle rectangle);

    [CCode (cname = "CheckCollisionPointRec")]
    public static bool check_collision_point_rectangle (Vector2 point, Rectangle rectangle);

    [CCode (cname = "CheckCollisionPointCircle")]
    public static bool check_collision_point_circle (Vector2 point, Vector2 center, float radius);

    [CCode (cname = "CheckCollisionPointTriangle")]
    public static bool check_collision_point_triangle (Vector2 point, Vector2 point1, Vector2 point2, Vector2 point3);

    [CCode (cname = "CheckCollisionLines")]
    public static bool check_collision_lines (Vector2 start1, Vector2 end1, Vector2 start2, Vector2 end2, Vector2[] collision_point);

    [CCode (cname = "CheckCollisionPointLine")]
    public static bool check_collision_point_line (Vector2 point, Vector2 start, Vector2 end, int threshold);

    [CCode (cname = "GetCollisionRec")]
    public static Rectangle get_collision_rectangle (Rectangle rectangle1, Rectangle rectangle2);

    //------------------------------------------------------------------------------------
    // Texture Loading and Drawing Functions (Module: textures)
    //------------------------------------------------------------------------------------

    // Image loading functions
    // NOTE: This functions do not require GPU access
    [CCode (cname = "LoadImage")]
    public static Image load_image (string filename);

    [CCode (cname = "LoadImageRaw")]
    public static Image load_image_raw (string filename, int width, int height, int format, int header_size);

    [CCode (cname = "LoadImageAnim")]
    public static Image load_image_animation (string filename, out int frames);

    [CCode (cname = "LoadImageFromMemory")]
    public static Image load_image_from_memory (string filename, uchar[] file_data);

    [CCode (cname = "LoadImageFromTexture")]
    public static Image load_image_from_texture (Texture2D texture);

    [CCode (cname = "LoadImageFromScreen")]
    public static Image load_image_from_screen ();

    [CCode (cname = "UnloadImage")]
    public static void unload_image (Image image);

    [CCode (cname = "ExportImage")]
    public static bool export_image (Image image, string filename);

    [CCode (cname = "ExportImageAsCode")]
    public static bool export_image_as_code (Image image, string filename);

    // Image generation functions
    [CCode (cname = "GenImageColor")]
    public static Image generate_image_color (int width, int height, Color color);

    [CCode (cname = "GenImageGradientV")]
    public static Image generate_image_gradient_vertical (int width, int height, Color top, Color bottom);

    [CCode (cname = "GenImageGradientH")]
    public static Image generate_image_gradient_horizontal (int width, int height, Color left, Color right);

    [CCode (cname = "GenImageGradientRadial")]
    public static Image generate_image_gradient_radial (int width, int height, float density, Color inner, Color outer);

    [CCode (cname = "GenImageChecked")]
    public static Image generate_image_checked (int width, int height, int checks_x, int checks_y, Color primary, Color secondary);

    [CCode (cname = "GenImageWhiteNoise")]
    public static Image generate_image_white_noise (int width, int height, float factor);

    [CCode (cname = "GenImageCellular")]
    public static Image generate_image_cellular (int width, int height, int tile_size);

    // Image manipulation functions
    [CCode (cname = "ImageCopy")]
    public static Image image_copy (Image image);

    [CCode (cname = "ImageFromImage")]
    public static Image image_from_image (Image image, Rectangle rectangle);

    [CCode (cname = "ImageText")]
    public static Image image_text (string text, int font_size, Color color);

    [CCode (cname = "ImageTextEx")]
    public static Image image_text_ext (Font font, string text, float font_size, float spacing, Color tint);

    [CCode (cname = "ImageFormat")]
    public static void image_format (Image? image, PixelFormat new_format);

    [CCode (cname = "ImageToPOT")]
    public static void image_to_power_of_two (Image? image, Color fill);

    [CCode (cname = "ImageCrop")]
    public static void image_crop (Image? image, Rectangle crop);

    [CCode (cname = "ImageAlphaCrop")]
    public static void image_alpha_crop (Image? image, float threshold);

    [CCode (cname = "ImageAlphaClear")]
    public static void image_clear_alpha (Image? image, Color color, float threshold);

    [CCode (cname = "ImageAlphaMask")]
    public static void image_alpha_mask (Image? image, Image alpha_mask);

    [CCode (cname = "ImageAlphaPremultiply")]
    public static void image_alpha_premultiply (Image? image);

    [CCode (cname = "ImageResize")]
    public static void image_resize (Image? image, int width, int height);

    [CCode (cname = "ImageResizeNN")]
    public static void image_resize_nearest_neighbour (Image? image, int width, int height);

    [CCode (cname = "ImageResizeCanvas")]
    public static void image_resize_canvas (Image? image, int width, int height, int offset_x, int offset_y, Color fill);

    [CCode (cname = "ImageMipmaps")]
    public static void image_mipmaps (Image? image);

    [CCode (cname = "ImageDither")]
    public static void image_dither (Image? image, int red_bpp, int green_bpp, int blue_bpp, int alpha_bpp);

    [CCode (cname = "ImageFlipVertical")]
    public static void image_flip_vertical (Image? image);

    [CCode (cname = "ImageFlipHorizontal")]
    public static void image_flip_horizontal (Image? image);

    [CCode (cname = "ImageRotateCW")]
    public static void image_rotate_clockwise (Image? image);

    [CCode (cname = "ImageRotateCCW")]
    public static void image_rotate_counter_clockwise (Image? image);

    [CCode (cname = "ImageColorTint")]
    public static void image_color_tint (Image? image, Color color);

    [CCode (cname = "ImageColorInvert")]
    public static void image_color_invert (Image? image);

    [CCode (cname = "ImageColorGrayscale")]
    public static void image_color_grayscale (Image? image);

    [CCode (cname = "ImageColorContrast")]
    public static void image_color_contrast (Image? image, float contrast);

    [CCode (cname = "ImageColorBrightness")]
    public static void image_color_brightness (Image? image, int brightness);

    [CCode (cname = "ImageColorReplace")]
    public static void image_color_replace (Image? image, Color color, Color replace);

    [CCode (cname = "LoadImageColors")]
    public static Color[] load_image_colors (Image image);

    [CCode (cname = "LoadImagePalette")]
    public static Color[] load_image_palette (Image image, int max_palette_size, out int color_count);

    [CCode (cname = "UnloadImageColors")]
    public static void unload_image_colors (Color[] colors);

    [CCode (cname = "UnloadImagePalette")]
    public static void unload_image_palette (Color[] colors);

    [CCode (cname = "GetImageAlphaBorder")]
    public static Rectangle get_image_alpha_border (Image image, float threshold);

    [CCode (cname = "GetImageColor")]
    public static Color get_image_color (Image image, int x, int y);

    // Image drawing functions
    // NOTE: Image software-rendering functions (CPU)

    [CCode (cname = "ImageClearBackground")]
    public static void image_clear_background (Image? image, Color color);

    [CCode (cname = "ImageDrawPixel")]
    public static void image_draw_pixel (Image? image, int x, int y, Color color);

    [CCode (cname = "ImageDrawPixelV")]
    public static void image_draw_pixel_vector (Image? image, Vector2 position, Color color);

    [CCode (cname = "ImageDrawLine")]
    public static void image_draw_line (Image? image, int start_x, int start_y, int end_x, int end_y, Color color);

    [CCode (cname = "ImageDrawLineV")]
    public static void image_draw_line_vector (Image? image, Vector2 start, Vector2 end, Color color);

    [CCode (cname = "ImageDrawCircle")]
    public static void image_draw_circle (Image? image, int x, int y, int radius, Color color);

    [CCode (cname = "ImageDrawCircleV")]
    public static void image_draw_circle_vector (Image? image, Vector2 center, int radius, Color color);

    [CCode (cname = "ImageDrawRectangle")]
    public static void image_draw_rectangle (Image? image, int x, int y, int width, int height, Color color);

    [CCode (cname = "ImageDrawRectangleV")]
    public static void image_draw_rectanglev (Image? image, Vector2 position, Vector2 size, Color color);

    [CCode (cname = "ImageDrawRectangleRec")]
    public static void image_draw_rectangle_rectangle (Image? image, Rectangle rectangle, Color color);

    [CCode (cname = "ImageDrawRectangleLines")]
    public static void image_draw_rectangle_lines (Image? image, Rectangle rectangle, int thickness, Color color);

    [CCode (cname = "ImageDraw")]
    public static void image_draw (Image? image, Image source, Rectangle source_rectangle, Rectangle destination_rectangle, Color tint);

    [CCode (cname = "ImageDrawText")]
    public static void image_draw_text (Image? image, string text, int x, int y, int font_size, Color color);

    [CCode (cname = "ImageDrawTextEx")]
    public static void image_draw_text_ext (Image? image, Font font, string text, Vector2 position, float font_size, float spacing, Color tint);

    // Texture loading functions
    // NOTE: These functions require GPU access
    [CCode (cname = "LoadTexture")]
    public static Texture2D load_texture (string filename);

    [CCode (cname = "LoadTextureFromImage")]
    public static Texture2D load_texture_from_image (Image image);

    [CCode (cname = "LoadTextureCubemap")]
    public static TextureCubemap load_texture_cubemap (Image image, CubemapLayout layout);

    [CCode (cname = "LoadRenderTexture")]
    public static RenderTexture2D load_render_texture (int width, int height);

    [CCode (cname = "UnloadTexture")]
    public static void unload_texture (Texture2D texture);

    [CCode (cname = "UnloadRenderTexture")]
    public static void unload_render_texture (RenderTexture2D target);

    [CCode (cname = "UpdateTexture")]
    public static void update_texture (Texture2D texture, void* pixels);

    [CCode (cname = "UpdateTextureRec")]
    public static void update_texture_rectangle (Texture2D texture, Rectangle rectangle, void* pixels);

    // Texture configuration functions
    [CCode (cname = "GenTextureMipmaps")]
    public static void generate_texture_mipmaps (Texture2D? texture);

    [CCode (cname = "SetTextureFilter")]
    public static void set_texture_filter (Texture2D texture, TextureFilter filter);

    [CCode (cname = "SetTextureWrap")]
    public static void set_texture_wrap (Texture2D texture, TextureWrap wrap);

    // Texture drawing functions
    [CCode (cname = "DrawTexture")]
    public static void draw_texture (Texture2D texture, int x, int y, Color tint);

    [CCode (cname = "DrawTextureV")]
    public static void draw_texture_vector (Texture2D texture, Vector2 position, Color tint);

    [CCode (cname = "DrawTextureEx")]
    public static void draw_texture_ext (Texture2D texture, Vector2 position, float rotation, float scale, Color tint);

    [CCode (cname = "DrawTextureRec")]
    public static void draw_texture_rectangle (Texture2D texture, Rectangle source, Vector2 position, Color tint);

    [CCode (cname = "DrawTextureQuad")]
    public static void draw_texture_quad (Texture2D texture, Vector2 tiling, Vector2 offset, Rectangle quad, Color tint);

    [CCode (cname = "DrawTextureTiled")]
    public static void draw_texture_tiled (Texture2D texture, Rectangle source, Rectangle dest, Vector2 origin, float rotation, float scale, Color tint);

    [CCode (cname = "DrawTexturePro")]
    public static void draw_texture_pro (Texture2D texture, Rectangle source, Rectangle destination, Vector2 origin, float rotation, Color tint);

    [CCode (cname = "DrawTextureNPatch")]
    public static void draw_texture_npatch (Texture2D texture, NPatchInfo info, Rectangle destination, Vector2 origin, float rotation, Color tint);

    [CCode (cname = "DrawTexturePoly")]
    public static void draw_texture_poly (Texture2D texture, Vector2 center, Vector2* points, Vector2* texcoords, int point_ount, Color tint);

    // Color/pixel related functions
    [CCode (cname = "Fade")]
    public static Color fade (Color color, float alpha);

    [CCode (cname = "ColorToInt")]
    public static int color_to_int (Color color);

    [CCode (cname = "ColorNormalize")]
    public static Vector4 color_normalize (Color color);

    [CCode (cname = "ColorFromNormalized")]
    public static Color color_from_normalized (Vector4 normalized);

    [CCode (cname = "ColorToHSV")]
    public static Vector3 color_to_hsv (Color color);

    [CCode (cname = "ColorFromHSV")]
    public static Color color_form_hsv (float hue, float saturation, float value);

    [CCode (cname = "ColorAlpha")]
    public static Color color_alpha (Color color, float alpha);

    [CCode (cname = "ColorAlphaBlend")]
    public static Color color_alpha_blend (Color destination, Color source, Color tint);

    [CCode (cname = "GetColor")]
    public static Color get_color (uint hex);

    [CCode (cname = "GetPixelColor")]
    public static Color get_pixel_color (void* source_pointer, int format);

    [CCode (cname = "SetPixelColor")]
    public static void set_pixel_color (void* destination_pointer, Color color, int format);

    [CCode (cname = "GetPixelDataSize")]
    public static int get_pixel_data_size (int width, int height, int format);

    //------------------------------------------------------------------------------------
    // Font Loading and Text Drawing Functions (Module: text)
    //------------------------------------------------------------------------------------

    // Font loading/unloading functions
    [CCode (cname = "GetFontDefault")]
    public static Font get_font_default ();

    [CCode (cname = "LoadFont")]
    public static Font load_font (string filename);

    [CCode (cname = "LoadFontEx")]
    public static Font load_font_ext (string filename, int font_size, int[] font_characters);

    [CCode (cname = "LoadFontFromImage")]
    public static Font load_font_from_image (Image image, Color key, int first_char);

    [CCode (cname = "LoadFontFromMemory")]
    public static Font load_font_from_memory (string file_type, uchar file_data, int font_size, int[] font_characters);

    [CCode (cname = "LoadFontData")]
    public static GlyphInfo? load_font_data (uchar[] file_data, int font_size, int[] font_characters, FontType type);

    [CCode (cname = "GenImageFontAtlas")]
    public static Image generate_image_font_atlas (GlyphInfo* characters, [CCode (array_length = false)] out Rectangle[] rectangles, int glyph_count, int font_size, int padding, int pack_method);

    [CCode (cname = "UnloadFontData")]
    public static void unload_font_data (GlyphInfo[] characters);

    [CCode (cname = "UnloadFont")]
    public static void unload_font (Font font);

    [CCode (cname = "ExportFontAsCode")]
    public static bool export_font_as_code (Font font, string filename);

    // Text drawing functions
    [CCode (cname = "DrawFPS")]
    public static void draw_fps (int x, int y);

    [CCode (cname = "DrawText")]
    public static void draw_text (string text, int x, int y, int font_size, Color color);

    [CCode (cname = "DrawTextEx")]
    public static void draw_text_ext (Font font, string text, Vector2 position, float font_size, float spacing, Color tint);

    [CCode (cname = "DrawTextPro")]
    public static void draw_text_pro (Font font, string text, Vector2 position, Vector2 origin, float rotation, float font_size, float spacing, Color tint);

    [CCode (cname = "DrawTextCodepoint")]
    public static void draw_text_codepoint (Font font, int codepoint, Vector2 position, float font_size, Color tint);

    [CCode (cname = "DrawTextCodepoints")]
    public static void draw_text_codepoints (Font font, int[] codepoints, Vector2 position, float font_size, float spacing, Color tint);

    // Text font info functions
    [CCode (cname = "MeasureText")]
    public static int measure_text (string text, int font_size);

    [CCode (cname = "MeasureTextEx")]
    public static Vector2 measure_text_ext (Font font, string text, float font_size, float spacing);

    [CCode (cname = "GetGlyphIndex")]
    public static int get_glyph_index (Font font, int codepoint);

    [CCode (cname = "GetGlyphInfo")]
    public static GlyphInfo get_glyph_info (Font font, int codepoint);

    [CCode (cname = "GetGlyphAtlasRec")]
    public static Rectangle get_glyph_atlas_rectangle (Font font, int codepoint);

    // Text codepoints management functions (unicode characters)
    [CCode (cname = "LoadCodepoints")]
    public static int[] load_codepoints (string text, out int count);

    [CCode (cname = "UnloadCodepoints")]
    public static void unload_codepoints (out int codepoints);

    [CCode (cname = "GetCodepointCount")]
    public static int get_codepoint_count (string text);

    [CCode (cname = "GetCodepoint")]
    public static int get_codepoint (string text, out int bytes_processed);

    [CCode (cname = "CodepointToUTF8")]
    public static string codepoint_to_utf8 (int codepoint, out int byte_size);

    [CCode (cname = "TextCodepointsToUTF8")]
    public static string text_codepoints_to_utf8 (int[] codepoints);

    // Text strings management functions (no UTF-8 strings, only byte chars)
    // NOTE: Some strings allocate memory internally for returned strings, just be careful!
    [CCode (cname = "TextCopy")]
    public static int text_copy (out string destination, string source);

    [CCode (cname = "TextIsEqual")]
    public static bool text_is_equal (string text1, string text2);

    [CCode (cname = "TextLength")]
    public static uint text_length (string text);

    [CCode (cname = "TextFormat")]
    public static string text_format (string text, ...);

    [CCode (cname = "TextSubtext")]
    public static string text_subtext (string text, int position, int length);

    [CCode (cname = "TextReplace")]
    public static string text_replace (out string text, string replace, string by);

    [CCode (cname = "TextInsert")]
    public static string text_insert (string text, string insert, int position);

    [CCode (cname = "TextJoin")]
    public static string text_join (string[] text_list, int count, string delimiter);

    [CCode (cname = "TextSplit")]
    public static string[] text_split (string text, char delimiter, out int count);

    [CCode (cname = "TextAppend")]
    public static void text_append (out string text, string append, out int position);

    [CCode (cname = "TextFindIndex")]
    public static int text_find_index (string text, string find);

    [CCode (cname = "TextToUpper")]
    public static string text_to_upper (string text);

    [CCode (cname = "TextToLower")]
    public static string text_to_lower (string text);

    [CCode (cname = "TextToPascal")]
    public static string text_to_pascal (string text);

    [CCode (cname = "TextToInteger")]
    public static int text_to_integer (string text);

    //------------------------------------------------------------------------------------
    // Basic 3d Shapes Drawing Functions (Module: models)
    //------------------------------------------------------------------------------------

    // Basic geometric 3D shapes drawing functions
    [CCode (cname = "DrawLine3D")]
    public static void draw_line_3D (Vector3 start, Vector3 end, Color color);                                                      // vala-lint=naming-convention

    [CCode (cname = "DrawPoint3D")]
    public static void draw_point_3D (Vector3 position, Color color);                                                               // vala-lint=naming-convention

    [CCode (cname = "DrawCircle3D")]
    public static void draw_circle_3D (Vector3 center, float radius, Vector3 rotation_axis, float rotation_angle, Color color);     // vala-lint=naming-convention

    [CCode (cname = "DrawTriangle3D")]
    public static void draw_triangle_3D (Vector3 vector1, Vector3 vector2, Vector3 vector3, Color color);                           // vala-lint=naming-convention

    [CCode (cname = "DrawTriangleStrip3D")]
    public static void draw_triangle_strip_3D (Vector3[] points, Color color);                                                      // vala-lint=naming-convention

    [CCode (cname = "DrawCube")]
    public static void draw_cube (Vector3 position, float width, float height, float length, Color color);

    [CCode (cname = "DrawCubeV")]
    public static void draw_cube_vector (Vector3 position, Vector3 size, Color color);

    [CCode (cname = "DrawCubeWires")]
    public static void draw_cube_wires (Vector3 position, float width, float height, float length, Color color);

    [CCode (cname = "DrawCubeWiresV")]
    public static void draw_cube_wires_vector (Vector3 position, Vector3 size, Color color);

    [CCode (cname = "DrawCubeTexture")]
    public static void draw_cube_texture (Texture2D texture, Vector3 position, float width, float height, float length, Color color);

    [CCode (cname = "DrawCubeTextureRec")]
    public static void draw_cube_texture_rectangle (Texture2D texture, Rectangle source, Vector3 position, float width, float height, float length, Color color);

    [CCode (cname = "DrawSphere")]
    public static void draw_sphere (Vector3 center_position, float radius, Color color);

    [CCode (cname = "DrawSphereEx")]
    public static void draw_sphere_ext (Vector3 center_position, float radius, int rings, int slices, Color color);

    [CCode (cname = "DrawSphereWires")]
    public static void draw_sphere_wires (Vector3 center_position, float radius, int rings, int slices, Color color);

    [CCode (cname = "DrawCylinder")]
    public static void draw_cylinder (Vector3 position, float radius_top, float radius_bottom, float height, int slices, Color color);

    [CCode (cname = "DrawCylinderEx")]
    public static void draw_cylinder_ext (Vector3 start, Vector3 end, float start_radius, float end_radius, int sides, Color color);

    [CCode (cname = "DrawCylinderWires")]
    public static void draw_cylinder_wires (Vector3 position, float radius_top, float radius_bottom, float height, int slices, Color color);

    [CCode (cname = "DrawCylinderWiresEx")]
    public static void draw_cylinder_wires_ext (Vector3 start, Vector3 end, float start_adius, float end_radius, int sides, Color color);

    [CCode (cname = "DrawPlane")]
    public static void draw_plane (Vector3 center, Vector2 size, Color color);

    [CCode (cname = "DrawRay")]
    public static void draw_ray (Ray ray, Color color);

    [CCode (cname = "DrawGrid")]
    public static void draw_grid (int slices, float spacing);

    //------------------------------------------------------------------------------------
    // Model 3d Loading and Drawing Functions (Module: models)
    //------------------------------------------------------------------------------------

    // Model management functions
    [CCode (cname = "LoadModel")]
    public static Model load_model (string filename);

    [CCode (cname = "LoadModelFromMesh")]
    public static Model load_model_from_mesh (Mesh mesh);

    [CCode (cname = "UnloadModel")]
    public static void unload_model (Model model);

    [CCode (cname = "UnloadModelKeepMeshes")]
    public static void unload_model_keep_meshes (Model model);

    [CCode (cname = "GetModelBoundingBox")]
    public static BoundingBox get_model_bounding_box (Model model);

    // Model drawing functions
    [CCode (cname = "DrawModel")]
    public static void draw_model (Model model, Vector3 position, float scale, Color tint);

    [CCode (cname = "DrawModelEx")]
    public static void draw_model_ext (Model model, Vector3 position, Vector3 rotation_axis, float rotation_angle, Vector3 scale, Color tint);

    [CCode (cname = "DrawModelWires")]
    public static void draw_model_wires (Model model, Vector3 position, float scale, Color tint);

    [CCode (cname = "DrawModelWiresEx")]
    public static void draw_model_wires_ext (Model model, Vector3 position, Vector3 rotation_axis, float rotation_angle, Vector3 scale, Color tint);

    [CCode (cname = "DrawBoundingBox")]
    public static void draw_bounding_box (BoundingBox box, Color color);

    [CCode (cname = "DrawBillboard")]
    public static void draw_billboard (Camera camera, Texture2D texture, Vector3 position, float size, Color tint);

    [CCode (cname = "DrawBillboardRec")]
    public static void draw_billboard_rectangle (Camera camera, Texture2D texture, Rectangle source, Vector3 position, Vector2 size, Color tint);

    [CCode (cname = "DrawBillboardPro")]
    public static void draw_billboard_pro (Camera camera, Texture2D texture, Rectangle source, Vector3 position, Vector3 up, Vector2 size, Vector2 origin, float rotation, Color tint);

    // Mesh management functions
    [CCode (cname = "UploadMesh")]
    public static void upload_mesh (Mesh? mesh, bool is_dynamic);

    [CCode (cname = "UpdateMeshBuffer")]
    public static void update_mesh_buffer (Mesh mesh, int index, void* data, int data_size, int offset);

    [CCode (cname = "UnloadMesh")]
    public static void unload_mesh (Mesh mesh);

    [CCode (cname = "DrawMesh")]
    public static void draw_mesh (Mesh mesh, Material material, Matrix transform);

    [CCode (cname = "DrawMeshInstanced")]
    public static void draw_mesh_instanced (Mesh mesh, Material material, Matrix[] transforms);

    [CCode (cname = "ExportMesh")]
    public static bool export_mesh (Mesh mesh, string filename);

    [CCode (cname = "GetMeshBoundingBox")]
    public static BoundingBox get_mesh_bounding_box (Mesh mesh);

    [CCode (cname = "generate_mesh_Tangents")]
    public static void generate_mesh_tangents (Mesh? mesh);

    // Mesh generation functions
    [CCode (cname = "GenMeshPoly")]
    public static Mesh generate_mesh_poly (int sides, float radius);

    [CCode (cname = "GenMeshPlane")]
    public static Mesh generate_mesh_plane (float width, float length, int x, int y);

    [CCode (cname = "GenMeshCube")]
    public static Mesh generate_mesh_cube (float width, float height, float length);

    [CCode (cname = "GenMeshSphere")]
    public static Mesh generate_mesh_sphere (float radius, int rings, int slices);

    [CCode (cname = "GenMeshHemiSphere")]
    public static Mesh generate_mesh_hemisphere (float radius, int rings, int slices);

    [CCode (cname = "GenMeshCylinder")]
    public static Mesh generate_mesh_cylinder (float radius, float height, int slices);

    [CCode (cname = "GenMeshCone")]
    public static Mesh generate_mesh_cone (float radius, float height, int slices);

    [CCode (cname = "GenMeshTorus")]
    public static Mesh generate_mesh_torus (float radius, float size, int segment_radius, int sides);

    [CCode (cname = "GenMeshKnot")]
    public static Mesh generate_mesh_knot (float radius, float size, int segment_radius, int sides);

    [CCode (cname = "GenMeshHeightmap")]
    public static Mesh generate_mesh_heightmap (Image heightmap, Vector3 size);

    [CCode (cname = "GenMeshCubicmap")]
    public static Mesh generate_mesh_cubicmap (Image cubicmap, Vector3 cube_size);

    // Material loading/unloading functions
    [CCode (cname = "LoadMaterials")]
    public static Material? load_materials (string filename, out int material_count);

    [CCode (cname = "LoadMaterialDefault")]
    public static Material load_material_default ();

    [CCode (cname = "UnloadMaterial")]
    public static void unload_material (Material material);

    [CCode (cname = "SetMaterialTexture")]
    public static void set_material_texture (Material? material, MaterialMap map_type, Texture2D texture);

    [CCode (cname = "SetModelMeshMaterial")]
    public static void set_model_mesh_material (Model? model, int mesh_id, int material_id);

    // Model animations loading/unloading functions
    [CCode (cname = "LoadModelAnimations")]
    public static ModelAnimation? load_model_animations (string filename, out uint animation_count);

    [CCode (cname = "UpdateModelAnimation")]
    public static void update_model_animations (Model model, ModelAnimation animation, int frame);

    [CCode (cname = "UnloadModelAnimation")]
    public static void unload_model_animation (ModelAnimation animation);

    [CCode (cname = "UnloadModelAnimations")]
    public static void unload_model_animations (ModelAnimation[] animations);

    [CCode (cname = "IsModelAnimationValid")]
    public static bool is_model_animation_valid (Model model, ModelAnimation animation);

    // Collision detection functions
    [CCode (cname = "CheckCollisionSpheres")]
    public static bool check_collision_spheres (Vector3 center1, float radius1, Vector3 center2, float radius2);

    [CCode (cname = "CheckCollisionBoxes")]
    public static bool check_collision_boxes (BoundingBox box1, BoundingBox box2);

    [CCode (cname = "CheckCollisionBoxSphere")]
    public static bool check_collision_box_sphere (BoundingBox box, Vector3 center, float radius);

    [CCode (cname = "GetRayCollisionSphere")]
    public static RayCollision get_ray_collision_sphere (Ray ray, Vector3 center, float radius);

    [CCode (cname = "GetRayCollisionBox")]
    public static RayCollision get_ray_collision_box (Ray ray, BoundingBox box);

    [CCode (cname = "GetRayCollisionMesh")]
    public static RayCollision get_ray_collision_mesh (Ray ray, Mesh mesh, Matrix transform);

    [CCode (cname = "GetRayCollisionTriangle")]
    public static RayCollision get_ray_collision_triangle (Ray ray, Vector3 point1, Vector3 point2, Vector3 point3);

    [CCode (cname = "GetRayCollisionQuad")]
    public static RayCollision get_ray_collision_quad (Ray ray, Vector3 point1, Vector3 point2, Vector3 point3, Vector3 point4);

    //------------------------------------------------------------------------------------
    // Audio Loading and Playing Functions (Module: audio)
    //------------------------------------------------------------------------------------
    [CCode (cname = "AudioCallback")]
    public delegate void AudioCallback (void* buffer_data, uint frames);

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
    public static void unload_music_stream (Music music);

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

    [CCode (cname = "SetAudioStreamCallback")]
    public static void set_audio_stream_callback (AudioStream stream, AudioCallback callback);


    [CCode (cname = "AttachAudioStreamProcessor")]
    public static void attach_audio_stream_processor (AudioStream stream, AudioCallback processor);

    [CCode (cname = "DetachAudioStreamProcessor")]
    public static void detach_audio_stream_processor (AudioStream stream, AudioCallback processor);
}
