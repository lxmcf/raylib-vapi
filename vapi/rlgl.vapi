[Version (experimental = true)]
[CCode (cprefix = "", cheader_filename = "rlgl.h")]
namespace Rlgl {
    [CCode (cname = "RLGL_VERSION")]
    public const string VERSION;

    //----------------------------------------------------------------------------------
    // Defines and Macros
    //----------------------------------------------------------------------------------

    // Default internal render batch elements limits
    [CCode (cname = "RL_DEFAULT_BATCH_BUFFER_ELEMENTS")]
    public const int DEFAULT_BATCH_BUFFER_ELEMENTS;

    // Default number of batch buffers (multi-buffering)
    [CCode (cname = "RL_DEFAULT_BATCH_BUFFERS")]
    public const int DEFAULT_BATCH_BUFFERS;

    // Default number of batch draw calls (by state changes: mode, texture)
    [CCode (cname = "RL_DEFAULT_BATCH_DRAWCALLS")]
    public const int DEFAULT_BATCH_DRAWCALLS;

    // Maximum number of textures units that can be activated on batch drawing (SetShaderValueTexture())
    [CCode (cname = "RL_DEFAULT_BATCH_MAX_TEXTURE_UNITS")]
    public const int DEFAULT_BATCH_MAX_TEXTURE_UNITS;


    // Internal Matrix stack
    [CCode (cname = "RL_MAX_MATRIX_STACK_SIZE")]
    public const int MAX_MATRIX_STACK_SIZE;

    // Shader limits
    [CCode (cname = "RL_MAX_SHADER_LOCATIONS")]
    public const int MAX_SHADER_LOCATIONS;

    // Projection matrix culling
    [CCode (cname = "RL_CULL_DISTANCE_NEAR")]
    public const float CULL_DISTANCE_NEAR;

    [CCode (cname = "RL_CULL_DISTANCE_FAR")]
    public const float RL_CULL_DISTANCE_FAR;


    // Texture parameters (equivalent to OpenGL defines)
    [CCode (cname = "RL_TEXTURE_WRAP_S")]
    public const int TEXTURE_WRAP_S;

    [CCode (cname = "RL_TEXTURE_WRAP_T")]
    public const int TEXTURE_WRAP_T;

    [CCode (cname = "RL_TEXTURE_MAG_FILTER")]
    public const int TEXTURE_MAG_FILTER;

    [CCode (cname = "RL_TEXTURE_MIN_FILTER")]
    public const int TEXTURE_MIN_FILTER;


    [CCode (cname = "RL_TEXTURE_FILTER_NEAREST")]
    public const int TEXTURE_FILTER_NEAREST;

    [CCode (cname = "RL_TEXTURE_FILTER_LINEAR")]
    public const int TEXTURE_FILTER_LINEAR;

    [CCode (cname = "RL_TEXTURE_FILTER_MIP_NEAREST")]
    public const int TEXTURE_FILTER_MIP_NEAREST;

    [CCode (cname = "RL_TEXTURE_FILTER_NEAREST_MIP_LINEAR")]
    public const int TEXTURE_FILTER_NEAREST_MIP_LINEAR;

    [CCode (cname = "RL_TEXTURE_FILTER_LINEAR_MIP_NEAREST")]
    public const int TEXTURE_FILTER_LINEAR_MIP_NEAREST;

    [CCode (cname = "RL_TEXTURE_FILTER_MIP_LINEAR")]
    public const int TEXTURE_FILTER_MIP_LINEAR;

    [CCode (cname = "RL_TEXTURE_FILTER_ANISOTROPIC")]
    public const int TEXTURE_FILTER_ANISOTROPIC;


    [CCode (cname = "RL_TEXTURE_WRAP_REPEAT")]
    public const int TEXTURE_WRAP_REPEAT;

    [CCode (cname = "RL_TEXTURE_WRAP_CLAMP")]
    public const int TEXTURE_WRAP_CLAMP;

    [CCode (cname = "RL_TEXTURE_WRAP_MIRROR_REPEAT")]
    public const int TEXTURE_WRAP_MIRROR_REPEAT;

    [CCode (cname = "RL_TEXTURE_WRAP_MIRROR_CLAMP")]
    public const int TEXTURE_WRAP_MIRROR_CLAMP;

    // Matrix modes (equivalent to OpenGL)
    [CCode (cname = "RL_MODELVIEW")]
    public const int MODELVIEW;

    [CCode (cname = "RL_PROJECTION")]
    public const int PROJECTION;

    [CCode (cname = "RL_TEXTURE")]
    public const int TEXTURE;

    // Primitive assembly draw modes
    [CCode (cname = "RL_LINES")]
    public const int LINES;

    [CCode (cname = "RL_TRIANGLES")]
    public const int TRIANGLES;

    [CCode (cname = "RL_QUADS")]
    public const int QUADS;

    [CCode (cname = "RL_UNSIGNED_BYTE")]
    public const int UNSIGNED_BYTE;

    [CCode (cname = "RL_FLOAT")]
    public const int FLOAT;

    // Buffer usage hint
    [CCode (cname = "RL_STREAM_DRAW")]
    public const int STREAM_DRAW;

    [CCode (cname = "RL_STREAM_READ")]
    public const int STREAM_READ;

    [CCode (cname = "RL_STREAM_COPY")]
    public const int STREAM_COPY;

    [CCode (cname = "RL_STATIC_DRAW")]
    public const int STATIC_DRAW;

    [CCode (cname = "RL_STATIC_READ")]
    public const int STATIC_READ;

    [CCode (cname = "RL_STATIC_COPY")]
    public const int STATIC_COPY;

    [CCode (cname = "RL_DYNAMIC_DRAW")]
    public const int DYNAMIC_DRAW;

    [CCode (cname = "RL_DYNAMIC_READ")]
    public const int DYNAMIC_READ;

    [CCode (cname = "RL_DYNAMIC_COPY")]
    public const int DYNAMIC_COPY;

    [CCode (cname = "RL_FRAGMENT_SHADER")]
    public const int RL_FRAGMENT_SHADER;

    [CCode (cname = "RL_VERTEX_SHADER")]
    public const int RL_VERTEX_SHADER;

    [CCode (cname = "RL_COMPUTE_SHADER")]
    public const int RL_COMPUTE_SHADER;

    //----------------------------------------------------------------------------------
    // Types and Structures Definition
    //----------------------------------------------------------------------------------

    [CCode (cname = "rlGlVersion", has_type_id = false)]
    public enum GLVersion {
        OPENGL_11,
        OPENGL_21,
        OPENGL_33,
        OPENGL_43,
        OPENGL_ES_20
    }

    [CCode (cname = "rlFramebufferAttachType", cprefix = "RL_ATTACHMENT_", has_type_id = false)]
    public enum FramebufferAttachType {
        COLOR_CHANNEL0,
        COLOR_CHANNEL1,
        COLOR_CHANNEL2,
        COLOR_CHANNEL3,
        COLOR_CHANNEL4,
        COLOR_CHANNEL5,
        COLOR_CHANNEL6,
        COLOR_CHANNEL7,
        DEPTH,
        STENCIL
    }

    [CCode (cname = "rlFramebufferAttachTextureType", cprefix = "RL_ATTACHMENT_", has_type_id = false)]
    public enum RLFramebufferAttachTextureType {
        CUBEMAP_POSITIVE_X,
        CUBEMAP_NEGATIVE_X,
        CUBEMAP_POSITIVE_Y,
        CUBEMAP_NEGATIVE_Y,
        CUBEMAP_POSITIVE_Z,
        CUBEMAP_NEGATIVE_Z,
        TEXTURE2D,
        RENDERBUFFER
    }

    [SimpleType]
    [CCode (cname = "rlVertexBuffer")]
    public struct VertexBuffer {
        int elementCount;                   // Number of elements in the buffer (QUADS)                                 // vala-lint=naming-convention

        unowned float[] vertices;           // Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
        unowned float[] texcoords;          // Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
        unowned uchar[] colors;             // Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
        unowned uint[] indices;             // Vertex indices (in case vertex data comes indexed) (6 indices per quad)
        uint vaoId;                         // OpenGL Vertex Array Object id                                            // vala-lint=naming-convention
        uint vboId[4];                      // OpenGL Vertex Buffer Objects id (4 types of vertex data)                 // vala-lint=naming-convention
    }

    [SimpleType]
    [CCode (cname = "rlDrawCall")]
    public struct DrawCall {
        int mode;                   // Drawing mode: LINES, TRIANGLES, QUADS
        int vertexCount;            // Number of vertex of the draw                                                     // vala-lint=naming-convention
        int vertexAlignment;        // Number of vertex required for index alignment (LINES, TRIANGLES)                 // vala-lint=naming-convention
        uint textureId;             // Texture id to be used on the draw -> Use to create new draw call if changes      // vala-lint=naming-convention
    }

    [SimpleType]
    [CCode (cname = "rlRenderBatch")]
    public struct RenderBatch {
        int bufferCount;                        // Number of vertex buffers (multi-buffering support)                   // vala-lint=naming-convention
        int currentBuffer;                      // Current buffer tracking in case of multi-buffering                   // vala-lint=naming-convention
        unowned VertexBuffer[] vertexBuffer;    // Dynamic buffer(s) for vertex data                                    // vala-lint=naming-convention

        unowned DrawCall[] draws;               // Draw calls array, depends on textureId
        int drawCounter;                        // Draw calls counter                                                   // vala-lint=naming-convention
        float currentDepth;                     // Current depth value for next draw                                    // vala-lint=naming-convention
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

    [CCode (cname = "rlTraceLogLevel", cprefix = "RL_LOG_", has_type_id = false)]
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

    [CCode (cname = "rlPixelFormat", cprefix = "RL_PIXELFORMAT_", has_type_id = false)]
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

    [CCode (cname = "rlTextureFilter", cprefix = "RL_TEXTURE_FILTER_", has_type_id = false)]
    public enum TextureFilter {
        POINT,                   // No filter, just pixel approximation
        BILINEAR,                // Linear filtering
        TRILINEAR,               // Trilinear filtering (linear with mipmaps)
        ANISOTROPIC_4X,          // Anisotropic filtering 4x
        ANISOTROPIC_8X,          // Anisotropic filtering 8x
        ANISOTROPIC_16X,         // Anisotropic filtering 16x
    }

    [CCode (cname = "rlBlendMode", cprefix = "RL_BLEND_", has_type_id = false)]
    public enum BlendMode {
        ALPHA,                   // Blend textures considering alpha (default)
        ADDITIVE,                // Blend textures adding colors
        MULTIPLIED,              // Blend textures multiplying colors
        ADD_COLORS,              // Blend textures adding colors (alternative)
        SUBTRACT_COLORS,         // Blend textures subtracting colors (alternative)
        ALPHA_PREMULTIPLY,       // Blend premultiplied textures considering alpha
        CUSTOM                   // Blend textures using custom src/dst factors (use rlSetBlendMode())
    }

    [CCode (cname = "rlShaderLocationIndex", cprefix = "RL_SHADER_LOC_", has_type_id = false)]
    public enum ShaderLocationIndex {
        VERTEX_POSITION = 0,        // Shader location: vertex attribute: position
        VERTEX_TEXCOORD01,          // Shader location: vertex attribute: texcoord01
        VERTEX_TEXCOORD02,          // Shader location: vertex attribute: texcoord02
        VERTEX_NORMAL,              // Shader location: vertex attribute: normal
        VERTEX_TANGENT,             // Shader location: vertex attribute: tangent
        VERTEX_COLOR,               // Shader location: vertex attribute: color
        MATRIX_MVP,                 // Shader location: matrix uniform: model-view-projection
        MATRIX_VIEW,                // Shader location: matrix uniform: view (camera transform)
        MATRIX_PROJECTION,          // Shader location: matrix uniform: projection
        MATRIX_MODEL,               // Shader location: matrix uniform: model (transform)
        MATRIX_NORMAL,              // Shader location: matrix uniform: normal
        VECTOR_VIEW,                // Shader location: vector uniform: view
        COLOR_DIFFUSE,              // Shader location: vector uniform: diffuse color
        COLOR_SPECULAR,             // Shader location: vector uniform: specular color
        COLOR_AMBIENT,              // Shader location: vector uniform: ambient color
        MAP_ALBEDO,                 // Shader location: sampler2d texture: albedo (same as: RL_SHADER_LOC_MAP_DIFFUSE)
        MAP_METALNESS,              // Shader location: sampler2d texture: metalness (same as: RL_SHADER_LOC_MAP_SPECULAR)
        MAP_NORMAL,                 // Shader location: sampler2d texture: normal
        MAP_ROUGHNESS,              // Shader location: sampler2d texture: roughness
        MAP_OCCLUSION,              // Shader location: sampler2d texture: occlusion
        MAP_EMISSION,               // Shader location: sampler2d texture: emission
        MAP_HEIGHT,                 // Shader location: sampler2d texture: height
        MAP_CUBEMAP,                // Shader location: samplerCube texture: cubemap
        MAP_IRRADIANCE,             // Shader location: samplerCube texture: irradiance
        MAP_PREFILTER,              // Shader location: samplerCube texture: prefilter
        MAP_BRDF                    // Shader location: sampler2d texture: brdf
    }

    [CCode (cname = "rlShaderUniformDataType", cprefix = "RL_SHADER_UNIFORM_", has_type_id = false)]
    public enum ShaderUniformDatatype {
        FLOAT = 0,                  // Shader uniform type: float
        VEC2,                       // Shader uniform type: vec2 (2 float)
        VEC3,                       // Shader uniform type: vec3 (3 float)
        VEC4,                       // Shader uniform type: vec4 (4 float)
        INT,                        // Shader uniform type: int
        IVEC2,                      // Shader uniform type: ivec2 (2 int)
        IVEC3,                      // Shader uniform type: ivec3 (3 int)
        IVEC4,                      // Shader uniform type: ivec4 (4 int)
        SAMPLER2D                   // Shader uniform type: sampler2d
    }

    [CCode (cname = "rlShaderAttributeDataType", cprefix = "RL_SHADER_ATTRIB_", has_type_id = false)]
    public enum ShaderAttributeDataType {
        FLOAT = 0,                  // Shader attribute type: float
        VEC2,                       // Shader attribute type: vec2 (2 float)
        VEC3,                       // Shader attribute type: vec3 (3 float)
        VEC4                        // Shader attribute type: vec4 (4 float)
    }

    //------------------------------------------------------------------------------------
    // Functions Declaration - Matrix operations
    //------------------------------------------------------------------------------------
    [CCode (cname = "rlMatrixMode")]
    public static void matrix_mode (int mode);

    [CCode (cname = "rlPushMatrix")]
    public static void push_matrix ();

    [CCode (cname = "rlPopMatrix")]
    public static void pop_matrix ();

    [CCode (cname = "rlLoadIdentity")]
    public static void load_identity ();

    [CCode (cname = "rlTranslatef")]
    public static void translatef (float x, float y, float z);

    [CCode (cname = "rlRotatef")]
    public static void rotatef (float angle, float x, float y, float z);

    [CCode (cname = "rlScalef")]
    public static void scalef (float angle, float x, float y, float z);

    [CCode (cname = "rlMultiMatrixf")]
    public static void multiply_matrixf (float[] matrix);

    [CCode (cname = "rlFrustum")]
    public static void frustum (double left, double right, double bottom, double top, double znear, double zfar);

    [CCode (cname = "rlOrtho")]
    public static void ortho (double left, double right, double bottom, double top, double znear, double zfar);

    [CCode (cname = "rlViewport")]
    public static void viewport (int x, int y, int width, int height);


    //------------------------------------------------------------------------------------
    // Functions Declaration - Vertex level operations
    //------------------------------------------------------------------------------------
    [CCode (cname = "rlBegin")]
    public static void begin (int mode);

    [CCode (cname = "rlEnd")]
    public static void end ();

    [CCode (cname = "rlVertex2i")]
    public static void vertex2i (int x, int y);

    [CCode (cname = "rlVertex2f")]
    public static void vertex2f (float x, float y);

    [CCode (cname = "rlVertex3f")]
    public static void vertex3f (float x, float y, float z);

    [CCode (cname = "rlTexCoord2f")]
    public static void texture_coordinates2f (float x, float y);

    [CCode (cname = "rlNormal3f")]
    public static void normal3f (float x, float y, float z);

    [CCode (cname = "rlColor4ub")]
    public static void color4ub (uchar r, uchar g, uchar b, uchar a);

    [CCode (cname = "rlColor3f")]
    public static void color3f (float r, float g, float b);

    [CCode (cname = "rlColor4f")]
    public static void color4f (float r, float g, float b, float a);

    //------------------------------------------------------------------------------------
    // Functions Declaration - OpenGL style functions (common to 1.1, 3.3+, ES2)
    // NOTE: This functions are used to completely abstract raylib code from OpenGL layer,
    // some of them are direct wrappers over OpenGL calls, some others are custom
    //------------------------------------------------------------------------------------
    [CCode (cname = "rlEnableVertexArray")]
    public static bool enable_vertex_array (uint vertex_array_object);

    [CCode (cname = "rlDisableVertexArray")]
    public static void disable_vertex_array ();

    [CCode (cname = "rlEnableVertexBuffer")]
    public static void enable_vertex_buffer (uint id);

    [CCode (cname = "rlDisableVertexBuffer")]
    public static void disable_vertex_buffer ();

    [CCode (cname = "rlEnableVertexBufferElement")]
    public static void enable_vertex_buffer_element (uint id);

    [CCode (cname = "rlDisableVertexBufferElement")]
    public static void disable_vertex_buffer_element ();

    [CCode (cname = "rlEnableVertexAttribute")]
    public static void enable_vertex_attribute (uint index);

    [CCode (cname = "rlDisableVertexAttribute")]
    public static void disable_vertex_attribute (uint index);

    #if GRAPHICS_API_OPENGL_11
        [CCode (cname = "rlEnableStatePointer")]
        public static void enable_state_pointer (int vertex_attribute_type, void* buffer);

        [CCode (cname = "rlDisableStatePointer")]
        public static disable_state_pointer (int vertex_attribute_type);
    #endif

    // Textures state
    [CCode (cname = "rlActiveTextureSlot")]
    public static void active_texture_slot (int slot);

    [CCode (cname = "rlEnableTexture")]
    public static void enable_texture (uint id);

    [CCode (cname = "rlDisableTexture")]
    public static void disable_texture ();

    [CCode (cname = "rlEnableTextureCubemap")]
    public static void enable_texture_cubemap (uint id);

    [CCode (cname = "rlDisableTextureCubemap")]
    public static void disable_texture_cubemap ();

    [CCode (cname = "rlTextureParameters")]
    public static void texture_parameters (uint id, int param, int value);

    // Shader stat
    [CCode (cname = "rlEnableShader")]
    public static void enable_shader (uint id);

    [CCode (cname = "rlDisableShader")]
    public static void disable_shader ();

    // Framebuffer state
    [CCode (cname = "rlEnableFramebuffer")]
    public static void enable_framebuffer (uint id);

    [CCode (cname = "rlDisableFramebuffer")]
    public static void disable_framebuffer ();

    [CCode (cname = "rlActiveDrawBuffers")]
    public static void active_draw_buffers (int count);

    // General render state
    [CCode (cname = "rlEnableColorBlend")]
    public static void enable_color_blend ();

    [CCode (cname = "rlDisableColorBlend")]
    public static void disable_color_blend ();

    [CCode (cname = "rlEnableDepthTest")]
    public static void enable_depth_test ();

    [CCode (cname = "rlDisableDepthTest")]
    public static void disable_depth_test ();

    [CCode (cname = "rlEnableDepthMask")]
    public static void enable_depth_mask ();

    [CCode (cname = "rlDisableDepthMask")]
    public static void disable_depth_mask ();

    [CCode (cname = "rlEnableBackfaceCulling")]
    public static void enable_backface_culling ();

    [CCode (cname = "rlDisableBackfaceCulling")]
    public static void disable_backface_culling ();

    [CCode (cname = "rlEnableScissorTest")]
    public static void enable_scissor_test ();

    [CCode (cname = "rlDisableScissorTest")]
    public static void disable_scissor_test ();

    [CCode (cname = "rlScissor")]
    public static void scissor (int x, int y, int width, int height);

    [CCode (cname = "rlEnableWireMode")]
    public static void enable_wire_mode ();

    [CCode (cname = "rlDisableWireMode")]
    public static void disable_wire_mode ();

    [CCode (cname = "rlSetLineWidth")]
    public static void set_line_wdith (float width);

    [CCode (cname = "rlGetLineWidth")]
    public static float get_line_width ();

    [CCode (cname = "rlEnableSmoothLines")]
    public static void enable_smooth_lines ();

    [CCode (cname = "rlDisableSmoothLines")]
    public static void disables_smooth_lines ();

    [CCode (cname = "rlEnableStereoRender")]
    public static void enable_stereo_render ();

    [CCode (cname = "rlDisableStereoRender")]
    public static void disable_stereo_render ();

    [CCode (cname = "rlIsStereoRenderEnabled")]
    public static bool is_stereo_enabled ();


    [CCode (cname = "ClearColor")]
    public static void clear_colour (uchar r, uchar g, uchar b, uchar a);

    [CCode (cname = "ClearScreenBuffers")]
    public static void clear_screen_buffers ();

    [CCode (cname = "CheckErrors")]
    public static void check_errors ();

    [CCode (cname = "SetBlendMode")]
    public static void set_blend_mode (int mode);

    [CCode (cname = "SetBlendFactors")]
    public static void set_blend_factors (int source, int destination, int equation);

    //------------------------------------------------------------------------------------
    // Functions Declaration - rlgl functionality
    //------------------------------------------------------------------------------------
    // rlgl initialization functions
    [CCode (cname = "rlglInit")]
    public static void gl_init (int width, int height);

    [CCode (cname = "rlglClose")]
    public static void gl_close ();

    [CCode (cname = "rlLoadExtensions")]
    public static void load_extensions (void* loader);

    [CCode (cname = "rlGetVersion")]
    public static int get_version ();

    [CCode (cname = "rlSetFramebufferWidth")]
    public static void set_frame_buffer_width (int width);

    [CCode (cname = "rlGetFramebufferWidth")]
    public static int get_framebuffer_width ();

    [CCode (cname = "rlSetFramebufferHeight")]
    public static void set_framebuffer_height (int height);

    [CCode (cname = "rlGetFramebufferHeight")]
    public static int get_framebuffer_height ();


    [CCode (cname = "rlGetTextureIdDefault")]
    public static uint get_texture_id_default ();

    [CCode (cname = "rlGetShaderIdDefault")]
    public static uint get_shader_id_default ();

    [CCode (cname = "rlGetShaderLocsDefault")]
    public static int[] get_shader_locations_default ();

    // Render batch management
    // NOTE: rlgl provides a default render batch to behave like OpenGL 1.1 immediate mode
    // but this render batch API is exposed in case of custom batches are required
    [CCode (cname = "rlLoadRenderBatch")]
    public static RenderBatch load_render_batch (int number_buffers, int buffer_elements);

    [CCode (cname = "rlUnloadRenderBatch")]
    public static void unload_render_batch (RenderBatch batch);

    [CCode (cname = "rlDrawRenderBatch")]
    public static void draw_render_batch (RenderBatch? batch);

    [CCode (cname = "rlSetRenderBatchActive")]
    public static void set_render_batch_active (RenderBatch? batch);

    [CCode (cname = "rlDrawRenderBatchActive")]
    public static void draw_render_batch_active ();

    [CCode (cname = "rlCheckRenderBatchLimit")]
    public static bool check_render_batch_limit (int count);

    [CCode (cname = "rlSetTexture")]
    public static void set_texture (uint id);

    // Vertex buffers management
    [CCode (cname = "rlLoadVertexArray")]
    public static uint load_vertex_array ();

    [CCode (cname = "rlLoadVertexBuffer")]
    public static uint load_vertex_buffer (void* buffer, int size, bool is_dynamic);

    [CCode (cname = "rlLoadVertexBufferElement")]
    public static uint load_vertex_buffer_element (void* buffer, int size, bool is_dynamic);

    [CCode (cname = "rlUpdateVertexBuffer")]
    public static void update_vertex_buffer (uint buffer_id, void* data, int data_size, int offset);

    [CCode (cname = "rlUpdateVertexBufferElements")]
    public static void update_vertex_buffer_elements (uint id, void* data, int data_size, int offset);

    [CCode (cname = "rlUnloadVertexArray")]
    public static void unload_vertex_array (uint vao_id);

    [CCode (cname = "rlUnloadVertexBuffer")]
    public static void unload_vertex_buffer (uint vbo_id);

    [CCode (cname = "rlSetVertexAttribute")]
    public static void set_vertex_attribute (uint index, int comp_size, int type, bool normalized, int stride, void* pointer);

    [CCode (cname = "rlSetVertexAttributeDivisor")]
    public static void set_vertex_attribute_divisor (uint index, int divisor);

    [CCode (cname = "rlSetVertexAttributeDefault")]
    public static void set_vertex_attribute_default (int location_index, void* value, int attribute_type, int count);

    [CCode (cname = "rlDrawVertexArray")]
    public static void draw_vertex_array (int offset, int count);

    [CCode (cname = "rlDrawVertexArrayElements")]
    public static void draw_vertex_array_elements (int offset, int count, void* buffer);

    [CCode (cname = "rlDrawVertexArrayInstanced")]
    public static void draw_vertex_array_instanced (int offset, int count, int instances);

    [CCode (cname = "rlDrawVertexArrayElementsInstanced")]
    public static void draw_vertex_array_elements_instanced (int offset, int count, void* buffer, int instances);

    // Textures management

    [CCode (cname = "rlLoadTexture")]
    public static uint load_texture (void* data, int width, int height, int format, int mipmapCount);

    [CCode (cname = "rlLoadTextureDepth")]
    public static uint load_texture_depth (int width, int height, bool use_render_buffer);

    [CCode (cname = "rlLoadTextureCubemap")]
    public static uint load_texture_cubemap (void* data, int size, int format);

    [CCode (cname = "rlUpdateTexture")]
    public static void update_texture (uint id, int offset_x, int offset_y, int width, int height, int format, void* data);

    [CCode (cname = "rlGetGlTextureFormats")]
    public static void get_gl_texture_formats (int format, out uint internal_format, out uint gl_format, out uint type);

    [CCode (cname = "rlGetPixelFormatName")]
    public static char[] get_pixel_format_name (uint format);

    [CCode (cname = "rlUnloadTexture")]
    public static void unload_texture (uint id);

    [CCode (cname = "rlGenTextureMipmaps")]
    public static void generate_texture_mipmaps (uint id, int width, int height, int format, int *mipmaps);

    [CCode (cname = "rlReadTexturePixels")]
    public static void[] read_texture_pixels (uint id, int width, int height, int format);

    [CCode (cname = "rlReadScreenPixels")]
    public static uchar[] read_screen_pixels (int width, int height);


    // Framebuffer management (fbo)
    [CCode (cname = "rlLoadFramebuffer")]
    public static uint load_frame_buffer (int width, int height);

    [CCode (cname = "rlFramebufferAttach")]
    public static void frame_buffer_attach (uint fbo_id, uint texture_id, int attach_type, int texure_type, int mip_level);

    [CCode (cname = "rlFramebufferComplete")]
    public static bool framebuffer_complete (uint id);

    [CCode (cname = "rlUnloadFramebuffer")]
    public static void unload_framebuffer (uint id);


    // Shaders management
    [CCode (cname = "rlLoadShaderCode")]
    public static uint load_shader_code (string vertex_shader, string fragment_shader);

    [CCode (cname = "rlCompileShader")]
    public static uint compile_shader (string shader, int type);

    [CCode (cname = "rlLoadShaderProgram")]
    public static uint load_shader_program (uint vertex_shader_id, int fragment_shader_id);

    [CCode (cname = "rlUnloadShaderProgram")]
    public static void unload_shader_program (uint id);

    [CCode (cname = "rlGetLocationUniform")]
    public static int get_location_uniform (uint shader_id, string uniform_name);

    [CCode (cname = "rlGetLocationAttrib")]
    public static int get_location_attribute (uint shader_id, string attribute_name);

    [CCode (cname = "rlSetUniform")]
    public static void set_uniform (int location_index, void* value, int uniform_type, int count);

    [CCode (cname = "rlSetUniformMatrix")]
    public static void set_uniform_matrix (int location_index, Matrix matrix);

    [CCode (cname = "rlSetUniformSampler")]
    public static void set_uniform_sampler (int location_index, uint texture_id);

    [CCode (cname = "rlSetShader")]
    public static void set_shader (uint id, out int locationss);

    // Compute shader management
    [CCode (cname = "rlLoadComputeShaderProgram")]
    public static uint load_compute_shader_program (uint shader_id);

    [CCode (cname = "rlComputeShaderDispatch")]
    public static void compute_shader_dispatch (uint group_x, uint group_y, uint group_z);

    // Shader buffer storage object management (ssbo)
    [CCode (cname = "rlLoadShaderBuffer")]
    public static uint load_shader_buffer (ulong size, void* data, int usage_hint);

    [CCode (cname = "rlUnloadShaderBuffer")]
    public static void unload_shader_buffer (uint ssbo_id);

    [CCode (cname = "rlUpdateShaderBufferElements")]
    public static void update_shader_buffer_elements (uint id, void* data, ulong data_size, ulong offset);

    [CCode (cname = " rlGetShaderBufferSize")]
    public static ulong get_shader_buffer_size (uint id);

    [CCode (cname = "rlReadShaderBufferElements")]
    public static void read_shader_buffer_elements (uint id, void* destination, ulong count, ulong offset);

    [CCode (cname = "rlBindShaderBuffer")]
    public static void bind_shader_buffer (uint id, uint index);

    // Buffer management
    [CCode (cname = "rlCopyBuffersElements")]
    public static void copy_buffer_elements (uint destination_id, uint source_id, ulong dest_offset, ulong source_offset, ulong count);

    [CCode (cname = "rlBindImageTexture")]
    public static void bind_imafe_texture (uint id, uint index, uint format, int readonly);


    // Matrix state management
    [CCode (cname = "rlGetMatrixModelview")]
    public static Matrix get_matrix_model_view ();

    [CCode (cname = "rlGetMatrixProjection")]
    public static Matrix get_matrix_projection ();

    [CCode (cname = "rlGetMatrixTransform")]
    public static Matrix get_matrix_transform ();

    [CCode (cname = "rlGetMatrixProjectionStereo")]
    public static Matrix get_matrix_projection_stereo (int eye);

    [CCode (cname = "rlGetMatrixViewOffsetStereo")]
    public static Matrix get_matrix_view_offset_stereo (int eye);

    [CCode (cname = "rlSetMatrixProjection")]
    public static void set_matrix_projection (Matrix proj);

    [CCode (cname = "rlSetMatrixModelview")]
    public static void set_matrix_model_view (Matrix view);

    [CCode (cname = "rlSetMatrixProjectionStereo")]
    public static void set_matrix_projection_stereo (Matrix right, Matrix left);

    [CCode (cname = "rlSetMatrixViewOffsetStereo")]
    public static void set_matrix_view_offset_stereo (Matrix right, Matrix left);

    // Quick and dirty cube/quad buffers load->draw->unload
    [CCode (cname = "rlLoadDrawCube")]
    public static void load_draw_cube ();

    [CCode (cname = "rlLoadDrawQuad")]
    public static void load_draw_quad ();
}
