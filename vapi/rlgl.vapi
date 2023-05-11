[Version (experimental = true)]
[CCode (cprefix = "", cheader_filename = "rlgl.h")]
namespace Rlgl {
    [CCode (cname = "RLGL_VERSION")]
    public const string VERSION;

    //----------------------------------------------------------------------------------
    // Defines and Macros
    //----------------------------------------------------------------------------------

    [CCode (cname = "RL_DEFAULT_BATCH_BUFFER_ELEMENTS")]
    public const int DEFAULT_BATCH_BUFFER_ELEMENTS;        // Default internal render batch elements limits

    [CCode (cname = "RL_DEFAULT_BATCH_BUFFERS")]
    public const int DEFAULT_BATCH_BUFFERS;                // Default number of batch buffers (multi-buffering)

    [CCode (cname = "RL_DEFAULT_BATCH_DRAWCALLS")]
    public const int DEFAULT_BATCH_DRAWCALLS;              // Default number of batch draw calls (by state changes: mode, texture)

    [CCode (cname = "RL_DEFAULT_BATCH_MAX_TEXTURE_UNITS")]
    public const int DEFAULT_BATCH_MAX_TEXTURE_UNITS;      // Maximum number of textures units that can be activated on batch drawing (SetShaderValueTexture())


    // Internal Matrix stack
    [CCode (cname = "RL_MAX_MATRIX_STACK_SIZE")]
    public const int MAX_MATRIX_STACK_SIZE;                // Maximum size of Matrix stack


    // Shader limits
    [CCode (cname = "RL_MAX_SHADER_LOCATIONS")]
    public const int MAX_SHADER_LOCATIONS;                 // Maximum number of shader locations supported


    // Projection matrix culling
    [CCode (cname = "RL_CULL_DISTANCE_NEAR")]
    public const int CULL_DISTANCE_NEAR;                   // Default near cull distance

    [CCode (cname = "RL_CULL_DISTANCE_FAR")]
    public const int CULL_DISTANCE_FAR;                    // Default far cull distance


    // Texture parameters (equivalent to OpenGL defines)
    [CCode (cname = "RL_TEXTURE_WRAP_S")]
    public const int TEXTURE_WRAP_S;                       // GL_TEXTURE_WRAP_S

    [CCode (cname = "RL_TEXTURE_WRAP_T")]
    public const int TEXTURE_WRAP_T;                       // GL_TEXTURE_WRAP_T

    [CCode (cname = "RL_TEXTURE_MAG_FILTER")]
    public const int TEXTURE_MAG_FILTER;                   // GL_TEXTURE_MAG_FILTER

    [CCode (cname = "RL_TEXTURE_MIN_FILTER")]
    public const int TEXTURE_MIN_FILTER;                   // GL_TEXTURE_MIN_FILTER


    [CCode (cname = "RL_TEXTURE_FILTER_NEAREST")]
    public const int TEXTURE_FILTER_NEAREST;               // GL_NEAREST

    [CCode (cname = "RL_TEXTURE_FILTER_LINEAR")]
    public const int TEXTURE_FILTER_LINEAR;                // GL_LINEAR

    [CCode (cname = "RL_TEXTURE_FILTER_MIP_NEAREST")]
    public const int TEXTURE_FILTER_MIP_NEAREST;           // GL_NEAREST_MIPMAP_NEAREST

    [CCode (cname = "RL_TEXTURE_FILTER_NEAREST_MIP_LINEAR")]
    public const int TEXTURE_FILTER_NEAREST_MIP_LINEAR;    // GL_NEAREST_MIPMAP_LINEAR

    [CCode (cname = "RL_TEXTURE_FILTER_LINEAR_MIP_NEAREST")]
    public const int TEXTURE_FILTER_LINEAR_MIP_NEAREST;    // GL_LINEAR_MIPMAP_NEAREST

    [CCode (cname = "RL_TEXTURE_FILTER_MIP_LINEAR")]
    public const int TEXTURE_FILTER_MIP_LINEAR;            // GL_LINEAR_MIPMAP_LINEAR

    [CCode (cname = "RL_TEXTURE_FILTER_ANISOTROPIC")]
    public const int TEXTURE_FILTER_ANISOTROPIC;           // Anisotropic filter (custom identifier)

    [CCode (cname = "RL_TEXTURE_MIPMAP_BIAS_RATIO")]
    public const int TEXTURE_MIPMAP_BIAS_RATIO;            // Texture mipmap bias, percentage ratio (custom identifier)


    [CCode (cname = "RL_TEXTURE_WRAP_REPEAT")]
    public const int TEXTURE_WRAP_REPEAT;                  // GL_REPEAT

    [CCode (cname = "RL_TEXTURE_WRAP_CLAMP")]
    public const int TEXTURE_WRAP_CLAMP;                   // GL_CLAMP_TO_EDGE

    [CCode (cname = "RL_TEXTURE_WRAP_MIRROR_REPEAT")]
    public const int TEXTURE_WRAP_MIRROR_REPEAT;           // GL_MIRRORED_REPEAT

    [CCode (cname = "RL_TEXTURE_WRAP_MIRROR_CLAMP")]
    public const int TEXTURE_WRAP_MIRROR_CLAMP;            // GL_MIRROR_CLAMP_EXT

    // Matrix modes (equivalent to OpenGL)
    [CCode (cname = "RL_MODELVIEW")]
    public const int MODELVIEW;                            // GL_MODELVIEW

    [CCode (cname = "RL_PROJECTION")]
    public const int PROJECTION;                           // GL_PROJECTION

    [CCode (cname = "RL_TEXTURE")]
    public const int TEXTURE;                              // GL_TEXTURE

    // Primitive assembly draw modes
    [CCode (cname = "RL_LINES")]
    public const int LINES;                                // GL_LINES

    [CCode (cname = "RL_TRIANGLES")]
    public const int TRIANGLES;                            // GL_TRIANGLES

    [CCode (cname = "RL_QUADS")]
    public const int QUADS;                                // GL_QUADS

    // GL equivalent data types
    [CCode (cname = "RL_UNSIGNED_BYTE")]
    public const int UNSIGNED_BYTE;                        // GL_UNSIGNED_BYTE

    [CCode (cname = "RL_FLOAT")]
    public const int FLOAT;                                // GL_FLOAT

    // GL buffer usage hint
    [CCode (cname = "RL_STREAM_DRAW")]
    public const int STREAM_DRAW;                          // GL_STREAM_DRAW

    [CCode (cname = "RL_STREAM_READ")]
    public const int STREAM_READ;                          // GL_STREAM_READ

    [CCode (cname = "RL_STREAM_COPY")]
    public const int STREAM_COPY;                          // GL_STREAM_COPY

    [CCode (cname = "RL_STATIC_DRAW")]
    public const int STATIC_DRAW;                          // GL_STATIC_DRAW

    [CCode (cname = "RL_STATIC_READ")]
    public const int STATIC_READ;                          // GL_STATIC_READ

    [CCode (cname = "RL_STATIC_COPY")]
    public const int STATIC_COPY;                          // GL_STATIC_COPY

    [CCode (cname = "RL_DYNAMIC_DRAW")]
    public const int DYNAMIC_DRAW;                         // GL_DYNAMIC_DRAW

    [CCode (cname = "RL_DYNAMIC_READ")]
    public const int DYNAMIC_READ;                         // GL_DYNAMIC_READ

    [CCode (cname = "RL_DYNAMIC_COPY")]
    public const int DYNAMIC_COPY;                         // GL_DYNAMIC_COPY

    // GL Shader type
    [CCode (cname = "RL_FRAGMENT_SHADER")]
    public const int FRAGMENT_SHADER;                      // GL_FRAGMENT_SHADER

    [CCode (cname = "RL_VERTEX_SHADER")]
    public const int VERTEX_SHADER;                        // GL_VERTEX_SHADER

    [CCode (cname = "RL_COMPUTE_SHADER")]
    public const int COMPUTE_SHADER;                       // GL_COMPUTE_SHADER

    // GL blending factors
    [CCode (cname = "RL_ZERO")]
    public const int ZERO;                                 // GL_ZERO

    [CCode (cname = "RL_ONE")]
    public const int ONE;                                  // GL_ONE

    [CCode (cname = "RL_SRC_COLOR")]
    public const int SRC_COLOR;                            // GL_SRC_COLOR

    [CCode (cname = "RL_ONE_MINUS_SRC_COLOR")]
    public const int ONE_MINUS_SRC_COLOR;                  // GL_ONE_MINUS_SRC_COLOR

    [CCode (cname = "RL_SRC_ALPHA")]
    public const int SRC_ALPHA;                            // GL_SRC_ALPHA

    [CCode (cname = "RL_ONE_MINUS_SRC_ALPHA")]
    public const int ONE_MINUS_SRC_ALPHA;                  // GL_ONE_MINUS_SRC_ALPHA

    [CCode (cname = "RL_DST_ALPHA")]
    public const int DST_ALPHA;                            // GL_DST_ALPHA

    [CCode (cname = "RL_ONE_MINUS_DST_ALPHA")]
    public const int ONE_MINUS_DST_ALPHA;                  // GL_ONE_MINUS_DST_ALPHA

    [CCode (cname = "RL_DST_COLOR")]
    public const int DST_COLOR;                            // GL_DST_COLOR

    [CCode (cname = "RL_ONE_MINUS_DST_COLOR")]
    public const int ONE_MINUS_DST_COLOR;                  // GL_ONE_MINUS_DST_COLOR

    [CCode (cname = "RL_SRC_ALPHA_SATURATE")]
    public const int SRC_ALPHA_SATURATE;                   // GL_SRC_ALPHA_SATURATE

    [CCode (cname = "RL_CONSTANT_COLOR")]
    public const int CONSTANT_COLOR;                       // GL_CONSTANT_COLOR

    [CCode (cname = "RL_ONE_MINUS_CONSTANT_COLOR")]
    public const int ONE_MINUS_CONSTANT_COLOR;             // GL_ONE_MINUS_CONSTANT_COLOR

    [CCode (cname = "RL_CONSTANT_ALPHA")]
    public const int CONSTANT_ALPHA;                       // GL_CONSTANT_ALPHA

    [CCode (cname = "RL_ONE_MINUS_CONSTANT_ALPHA")]
    public const int ONE_MINUS_CONSTANT_ALPHA;             // GL_ONE_MINUS_CONSTANT_ALPHA

    // GL blending functions/equations
    [CCode (cname = "RL_FUNC_ADD")]
    public const int FUNC_ADD;                             // GL_FUNC_ADD

    [CCode (cname = "RL_MIN")]
    public const int MIN;                                  // GL_MIN

    [CCode (cname = "RL_MAX")]
    public const int MAX;                                  // GL_MAX

    [CCode (cname = "RL_FUNC_SUBTRACT")]
    public const int FUNC_SUBTRACT;                        // GL_FUNC_SUBTRACT

    [CCode (cname = "RL_FUNC_REVERSE_SUBTRACT")]
    public const int FUNC_REVERSE_SUBTRACT;                // GL_FUNC_REVERSE_SUBTRACT

    [CCode (cname = "RL_BLEND_EQUATION")]
    public const int BLEND_EQUATION;                       // GL_BLEND_EQUATION

    [CCode (cname = "RL_BLEND_EQUATION_RGB")]
    public const int BLEND_EQUATION_RGB;                   // GL_BLEND_EQUATION_RGB   // (Same as BLEND_EQUATION)

    [CCode (cname = "RL_BLEND_EQUATION_ALPHA")]
    public const int BLEND_EQUATION_ALPHA;                 // GL_BLEND_EQUATION_ALPHA

    [CCode (cname = "RL_BLEND_DST_RGB")]
    public const int BLEND_DST_RGB;                        // GL_BLEND_DST_RGB

    [CCode (cname = "RL_BLEND_SRC_RGB")]
    public const int BLEND_SRC_RGB;                        // GL_BLEND_SRC_RGB

    [CCode (cname = "RL_BLEND_DST_ALPHA")]
    public const int BLEND_DST_ALPHA;                      // GL_BLEND_DST_ALPHA

    [CCode (cname = "RL_BLEND_SRC_ALPHA")]
    public const int BLEND_SRC_ALPHA;                      // GL_BLEND_SRC_ALPHA

    [CCode (cname = "RL_BLEND_COLOR")]
    public const int BLEND_COLOR;                          // GL_BLEND_COLOR

    //----------------------------------------------------------------------------------
    // Types and Structures Definition
    //----------------------------------------------------------------------------------
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

    // Dynamic vertex buffers (position + texcoords + colors + indices arrays)
    [SimpleType]
    [CCode (cname = "rlVertexBuffer")]
    public struct VertexBuffer {
        public int elementCount;                    // Number of elements in the buffer (QUADS)

        public unowned float[] vertices;            // Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
        public unowned float[] texcoords;           // Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
        public unowned uchar[] colors;              // Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
        public unowned ushort[] indices;            // Vertex indices (in case vertex data comes indexed) (6 indices per quad)

        public uint vaoId;                          // OpenGL Vertex Array Object id
        public unowned uint vboId[4];               // OpenGL Vertex Buffer Objects id (4 types of vertex data)
    }

    // Draw call type
    [SimpleType]
    [CCode (cname = "rlDrawCall")]
    public struct DrawCall {
        public int mode;                            // Drawing mode: LINES, TRIANGLES, QUADS
        public int vertexCount;                     // Number of vertex of the draw
        public int vertexAlignment;                 // Number of vertex required for index alignment (LINES, TRIANGLES)
        public uint textureId;                      // Texture id to be used on the draw -> Use to create new draw call if changes
    }

    // rlRenderBatch type
    [SimpleType]
    [CCode (cname = "rlRenderBatch")]
    public struct RenderBatch {
        public int bufferCount;                     // Number of vertex buffers (multi-buffering support)
        public int currentBuffer;                   // Current buffer tracking in case of multi-buffering
        public unowned VertexBuffer[] vertexBuffer; // Dynamic buffer(s) for vertex data

        public unowned DrawCall[] draws;            // Draw calls array, depends on textureId
        public int drawCounter;                     // Draw calls counter
        public float currentDepth;                  // Current depth value for next draw
    }

    // OpenGL version
    [CCode (cname = "rlGlVersion", has_type_id = false, cprefix="RL_")]
    public enum GlVersion {
        OPENGL_11,                                  // OpenGL 1.1
        OPENGL_21,                                  // OpenGL 2.1 (GLSL 120)
        OPENGL_33,                                  // OpenGL 3.3 (GLSL 330)
        OPENGL_43,                                  // OpenGL 4.3 (using GLSL 330)
        OPENGL_ES_20                                // OpenGL ES 2.0 (GLSL 100)
    }

    // Trace log level
    [CCode (cname = "rlTraceLogLevel", has_type_id = false, cprefix="RL_")]
    public enum TraceLogLevel {
        LOG_ALL,                                    // Display all logs
        LOG_TRACE,                                  // Trace logging, intended for internal use only
        LOG_DEBUG,                                  // Debug logging, used for internal debugging, it should be disabled on release builds
        LOG_INFO,                                   // Info logging, used for program execution info
        LOG_WARNING,                                // Warning logging, used on recoverable failures
        LOG_ERROR,                                  // Error logging, used on unrecoverable failures
        LOG_FATAL,                                  // Fatal logging, used to abort program: exit(EXIT_FAILURE)
        LOG_NONE                                    // Disable logging
    }

    // Texture pixel formats
    [CCode (cname = "rlPixelFormat", has_type_id = false, cprefix="RL_")]
    public enum PixelFormat {
        PIXELFORMAT_UNCOMPRESSED_GRAYSCALE,         // 8 bit per pixel (no alpha)
        PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA,        // 8*2 bpp (2 channels)
        PIXELFORMAT_UNCOMPRESSED_R5G6B5,            // 16 bpp
        PIXELFORMAT_UNCOMPRESSED_R8G8B8,            // 24 bpp
        PIXELFORMAT_UNCOMPRESSED_R5G5B5A1,          // 16 bpp (1 bit alpha)
        PIXELFORMAT_UNCOMPRESSED_R4G4B4A4,          // 16 bpp (4 bit alpha)
        PIXELFORMAT_UNCOMPRESSED_R8G8B8A8,          // 32 bpp
        PIXELFORMAT_UNCOMPRESSED_R32,               // 32 bpp (1 channel - float)
        PIXELFORMAT_UNCOMPRESSED_R32G32B32,         // 32*3 bpp (3 channels - float)
        PIXELFORMAT_UNCOMPRESSED_R32G32B32A32,      // 32*4 bpp (4 channels - float)
        PIXELFORMAT_COMPRESSED_DXT1_RGB,            // 4 bpp (no alpha)
        PIXELFORMAT_COMPRESSED_DXT1_RGBA,           // 4 bpp (1 bit alpha)
        PIXELFORMAT_COMPRESSED_DXT3_RGBA,           // 8 bpp
        PIXELFORMAT_COMPRESSED_DXT5_RGBA,           // 8 bpp
        PIXELFORMAT_COMPRESSED_ETC1_RGB,            // 4 bpp
        PIXELFORMAT_COMPRESSED_ETC2_RGB,            // 4 bpp
        PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA,       // 8 bpp
        PIXELFORMAT_COMPRESSED_PVRT_RGB,            // 4 bpp
        PIXELFORMAT_COMPRESSED_PVRT_RGBA,           // 4 bpp
        PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA,       // 8 bpp
        PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA        // 2 bpp
    }

    // Texture parameters: filter mode
    [CCode (cname = "rlTextureFilter", has_type_id = false, cprefix="RL_")]
    public enum TextureFilter {
        TEXTURE_FILTER_POINT,                       // No filter, just pixel approximation
        TEXTURE_FILTER_BILINEAR,                    // Linear filtering
        TEXTURE_FILTER_TRILINEAR,                   // Trilinear filtering (linear with mipmaps)
        TEXTURE_FILTER_ANISOTROPIC_4X,              // Anisotropic filtering 4x
        TEXTURE_FILTER_ANISOTROPIC_8X,              // Anisotropic filtering 8x
        TEXTURE_FILTER_ANISOTROPIC_16X              // Anisotropic filtering 16x
    }

    // Color blending modes (pre-defined)
    [CCode (cname = "rlBlendMode", has_type_id = false, cprefix="RL_")]
    public enum BlendMode {
        BLEND_ALPHA,                                // Blend textures considering alpha (default)
        BLEND_ADDITIVE,                             // Blend textures adding colors
        BLEND_MULTIPLIED,                           // Blend textures multiplying colors
        BLEND_ADD_COLORS,                           // Blend textures adding colors (alternative)
        BLEND_SUBTRACT_COLORS,                      // Blend textures subtracting colors (alternative)
        BLEND_ALPHA_PREMULTIPLY,                    // Blend premultiplied textures considering alpha
        BLEND_CUSTOM,                               // Blend textures using custom src/dst factors (use rlSetBlendFactors())
        BLEND_CUSTOM_SEPARATE                       // Blend textures using custom src/dst factors (use rlSetBlendFactorsSeparate())
    }

    // Shader location point type
    [CCode (cname = "rlShaderLocationIndex", has_type_id = false, cprefix="RL_")]
    public enum ShaderLocationIndex {
        SHADER_LOC_VERTEX_POSITION,                 // Shader location: vertex attribute: position
        SHADER_LOC_VERTEX_TEXCOORD01,               // Shader location: vertex attribute: texcoord01
        SHADER_LOC_VERTEX_TEXCOORD02,               // Shader location: vertex attribute: texcoord02
        SHADER_LOC_VERTEX_NORMAL,                   // Shader location: vertex attribute: normal
        SHADER_LOC_VERTEX_TANGENT,                  // Shader location: vertex attribute: tangent
        SHADER_LOC_VERTEX_COLOR,                    // Shader location: vertex attribute: color
        SHADER_LOC_MATRIX_MVP,                      // Shader location: matrix uniform: model-view-projection
        SHADER_LOC_MATRIX_VIEW,                     // Shader location: matrix uniform: view (camera transform)
        SHADER_LOC_MATRIX_PROJECTION,               // Shader location: matrix uniform: projection
        SHADER_LOC_MATRIX_MODEL,                    // Shader location: matrix uniform: model (transform)
        SHADER_LOC_MATRIX_NORMAL,                   // Shader location: matrix uniform: normal
        SHADER_LOC_VECTOR_VIEW,                     // Shader location: vector uniform: view
        SHADER_LOC_COLOR_DIFFUSE,                   // Shader location: vector uniform: diffuse color
        SHADER_LOC_COLOR_SPECULAR,                  // Shader location: vector uniform: specular color
        SHADER_LOC_COLOR_AMBIENT,                   // Shader location: vector uniform: ambient color
        SHADER_LOC_MAP_ALBEDO,                      // Shader location: sampler2d texture: albedo (same as: RL_SHADER_LOC_MAP_DIFFUSE)
        SHADER_LOC_MAP_METALNESS,                   // Shader location: sampler2d texture: metalness (same as: RL_SHADER_LOC_MAP_SPECULAR)
        SHADER_LOC_MAP_NORMAL,                      // Shader location: sampler2d texture: normal
        SHADER_LOC_MAP_ROUGHNESS,                   // Shader location: sampler2d texture: roughness
        SHADER_LOC_MAP_OCCLUSION,                   // Shader location: sampler2d texture: occlusion
        SHADER_LOC_MAP_EMISSION,                    // Shader location: sampler2d texture: emission
        SHADER_LOC_MAP_HEIGHT,                      // Shader location: sampler2d texture: height
        SHADER_LOC_MAP_CUBEMAP,                     // Shader location: samplerCube texture: cubemap
        SHADER_LOC_MAP_IRRADIANCE,                  // Shader location: samplerCube texture: irradiance
        SHADER_LOC_MAP_PREFILTER,                   // Shader location: samplerCube texture: prefilter
        SHADER_LOC_MAP_BRDF                         // Shader location: sampler2d texture: brdf
    }


    [CCode (cname = "RL_SHADER_LOC_MAP_DIFFUSE")]
    public const int SHADER_LOC_MAP_DIFFUSE;

    [CCode (cname = "RL_SHADER_LOC_MAP_SPECULAR")]
    public const int SHADER_LOC_MAP_SPECULAR;


    // Shader uniform data type
    [CCode (cname = "rlShaderUniformDataType", has_type_id = false)]
    public enum ShaderUniformDataType {
        SHADER_UNIFORM_FLOAT,                       // Shader uniform type: float
        SHADER_UNIFORM_VEC2,                        // Shader uniform type: vec2 (2 float)
        SHADER_UNIFORM_VEC3,                        // Shader uniform type: vec3 (3 float)
        SHADER_UNIFORM_VEC4,                        // Shader uniform type: vec4 (4 float)
        SHADER_UNIFORM_INT,                         // Shader uniform type: int
        SHADER_UNIFORM_IVEC2,                       // Shader uniform type: ivec2 (2 int)
        SHADER_UNIFORM_IVEC3,                       // Shader uniform type: ivec3 (3 int)
        SHADER_UNIFORM_IVEC4,                       // Shader uniform type: ivec4 (4 int)
        SHADER_UNIFORM_SAMPLER2D                    // Shader uniform type: sampler2d
    }

    // Shader attribute data types
    [CCode (cname = "rlShaderAttributeDataType", has_type_id = false)]
    public enum ShaderAttributeDataType {
        SHADER_ATTRIB_FLOAT,                        // Shader attribute type: float
        SHADER_ATTRIB_VEC2,                         // Shader attribute type: vec2 (2 float)
        SHADER_ATTRIB_VEC3,                         // Shader attribute type: vec3 (3 float)
        SHADER_ATTRIB_VEC4                          // Shader attribute type: vec4 (4 float)
    }

    // Framebuffer attachment type
    [CCode (cname = "rlFramebufferAttachType", has_type_id = false)]
    public enum FramebufferAttachType {
        ATTACHMENT_COLOR_CHANNEL0,                  // Framebuffer attachment type: color 0
        ATTACHMENT_COLOR_CHANNEL1,                  // Framebuffer attachment type: color 1
        ATTACHMENT_COLOR_CHANNEL2,                  // Framebuffer attachment type: color 2
        ATTACHMENT_COLOR_CHANNEL3,                  // Framebuffer attachment type: color 3
        ATTACHMENT_COLOR_CHANNEL4,                  // Framebuffer attachment type: color 4
        ATTACHMENT_COLOR_CHANNEL5,                  // Framebuffer attachment type: color 5
        ATTACHMENT_COLOR_CHANNEL6,                  // Framebuffer attachment type: color 6
        ATTACHMENT_COLOR_CHANNEL7,                  // Framebuffer attachment type: color 7
        ATTACHMENT_DEPTH,                           // Framebuffer attachment type: depth
        ATTACHMENT_STENCIL                          // Framebuffer attachment type: stencil
    }

    // Framebuffer texture attachment type
    [CCode (cname = "rlFramebufferAttachTextureType", has_type_id = false)]
    public enum FramebufferAttachTextureType {
        ATTACHMENT_CUBEMAP_POSITIVE_X,              // Framebuffer texture attachment type: cubemap, +X side
        ATTACHMENT_CUBEMAP_NEGATIVE_X,              // Framebuffer texture attachment type: cubemap, -X side
        ATTACHMENT_CUBEMAP_POSITIVE_Y,              // Framebuffer texture attachment type: cubemap, +Y side
        ATTACHMENT_CUBEMAP_NEGATIVE_Y,              // Framebuffer texture attachment type: cubemap, -Y side
        ATTACHMENT_CUBEMAP_POSITIVE_Z,              // Framebuffer texture attachment type: cubemap, +Z side
        ATTACHMENT_CUBEMAP_NEGATIVE_Z,              // Framebuffer texture attachment type: cubemap, -Z side
        ATTACHMENT_TEXTURE2D,                       // Framebuffer texture attachment type: texture2d
        ATTACHMENT_RENDERBUFFER                     // Framebuffer texture attachment type: renderbuffer
    }

    // Face culling mode
    [CCode (cname = "rlCullMode", has_type_id = false)]
    public enum CullMode {
        RL_CULL_FACE_FRONT,
        RL_CULL_FACE_BACK
    }

    //------------------------------------------------------------------------------------
    // Functions Declaration - Matrix operations
    //------------------------------------------------------------------------------------
    [CCode (cname = "rlMatrixMode")]
    public static void rl_matrix_mode (int mode);                             // Choose the current matrix to be transformed

    [CCode (cname = "rlPushMatrix")]
    public static void rl_push_matrix ();                                     // Push the current matrix to stack

    [CCode (cname = "rlPopMatrix")]
    public static void rl_pop_matrix ();                                      // Pop latest inserted matrix from stack

    [CCode (cname = "rlLoadIdentity")]
    public static void rl_load_identity ();                                   // Reset current matrix to identity matrix

    [CCode (cname = "rlTranslatef")]
    public static void rl_translatef (float x, float y, float z);             // Multiply the current matrix by a translation matrix

    [CCode (cname = "rlRotatef")]
    public static void rl_rotatref (float angle, float x, float y, float z);  // Multiply the current matrix by a rotation matrix

    [CCode (cname = "rlScalef")]
    public static void rl_scalef (float x, float y, float z);                 // Multiply the current matrix by a scaling matrix

    [CCode (cname = "rlMultMatrixf")]
    public static void rl_multiply_matrixf (float[] matrixf);                 // Multiply the current matrix by another matrix

    [CCode (cname = "rlFrustum")]
    public static void rl_frustum (double left, double right, double bottom, double top, double znear, double zfar);

    [CCode (cname = "rlOrtho")]
    public static void rl_ortho (double left, double right, double bottom, double top, double znear, double zfar);

    [CCode (cname = "rlViewport")]
    public static void rl_viewport (int x, int y, int width, int height);     // Set the viewport area

    //------------------------------------------------------------------------------------
    // Functions Declaration - Vertex level operations
    //------------------------------------------------------------------------------------
    [CCode (cname = "rlBegin")]
    public static void rl_begin (int mode);                                  // Initialize drawing mode (how to organize vertex)

    [CCode (cname = "rlEnd")]
    public static void rl_end ();                                            // Finish vertex providing

    [CCode (cname = "rlVertex2i")]
    public static void rl_vertex2i (int x, int y);                           // Define one vertex (position) - 2 int

    [CCode (cname = "rlVertex2f")]
    public static void rl_vertex2f (float x, float y);                       // Define one vertex (position) - 2 float

    [CCode (cname = "rlVertex3f")]
    public static void rl_vertex3f (float x, float y, float z);              // Define one vertex (position) - 3 float

    [CCode (cname = "rlTexCoord2f")]
    public static void rl_tex_coord2f (float x, float y);                    // Define one vertex (texture coordinate) - 2 float

    [CCode (cname = "rlNormal3f")]
    public static void rl_normal3f (float x, float y, float z);              // Define one vertex (normal) - 3 float

    [CCode (cname = "rlColor4ub")]
    public static void rl_color4ub (uchar r, uchar g, uchar b, uchar a);     // Define one vertex (color) - 4 byte

    [CCode (cname = "rlColor3f")]
    public static void rl_color3f (float x, float y, float z);               // Define one vertex (color) - 3 float

    [CCode (cname = "rlColor4f")]
    public static void rl_color4f (float x, float y, float z, float w);      // Define one vertex (color) - 4 float

    //------------------------------------------------------------------------------------
    // Functions Declaration - OpenGL style functions (common to 1.1, 3.3+, ES2)
    // NOTE: This functions are used to completely abstract raylib code from OpenGL layer,
    // some of them are direct wrappers over OpenGL calls, some others are custom
    //------------------------------------------------------------------------------------

    // Vertex buffers state
    [CCode (cname = "rlEnableVertexArray")]
    public static bool rl_enable_vertex_array (uint vaoId);     // Enable vertex array (VAO, if supported)

    [CCode (cname = "rlDisableVertexArray")]
    public static void rl_disable_vertex_array ();                  // Disable vertex array (VAO, if supported)

    [CCode (cname = "rlEnableVertexBuffer")]
    public static void rl_enable_vertex_buffer (uint id);       // Enable vertex buffer (VBO)

    [CCode (cname = "rlDisableVertexBuffer")]
    public static void rl_disable_vertex_buffer ();                 // Disable vertex buffer (VBO)

    [CCode (cname = "rlEnableVertexBufferElement")]
    public static void rl_enable_vertex_buffer_element (uint id);// Enable vertex buffer element (VBO element)

    [CCode (cname = "rlDisableVertexBufferElement")]
    public static void rl_disable_vertex_buffer_element ();          // Disable vertex buffer element (VBO element)

    [CCode (cname = "rlEnableVertexAttribute")]
    public static void rl_enable_vertex_attribute (uint index); // Enable vertex attribute index

    [CCode (cname = "rlDisableVertexAttribute")]
    public static void rl_disable_vertex_attribute (uint index);// Disable vertex attribute index
#if GRAPHICS_API_OPENGL_11
    [CCode (cname = "rlEnableStatePointer")]
    public static void rl_enable_state_pointer (int attribute_type, void* buffer);    // Enable attribute state pointer

    [CCode (cname = "rlDisableStatePointer")]
    public static void rl_disable_state_pointer (int attribute_type);                 // Disable attribute state pointer
#endif

    // Textures state
    [CCode (cname = "rlActiveTextureSlot")]
    public static void rl_active_texture_slot (int slot);               // Select and active a texture slot

    [CCode (cname = "rlEnableTexture")]
    public static void rl_enable_texture (uint id);            // Enable texture

    [CCode (cname = "rlDisableTexture")]
    public static void rl_disable_texture ();                      // Disable texture

    [CCode (cname = "rlEnableTextureCubemap")]
    public static void rl_enable_texture_cubemap (uint id);     // Enable texture cubemap

    [CCode (cname = "rlDisableTextureCubemap")]
    public static void rl_disable_texture_cubemap ();               // Disable texture cubemap

    [CCode (cname = "rlTextureParameters")]
    public static void rl_texture_parameters (uint id, int parameter, int value); // Set texture parameters (filter, wrap)

    [CCode (cname = "rlCubemapParameters")]
    public static void rl_cubemap_parameters (uint id, int parameter, int value); // Set cubemap parameters (filter, wrap)

    // Shader state
    [CCode (cname = "rlEnableShader")]
    public static void rl_enable_shader (uint id);             // Enable shader program

    [CCode (cname = "rlDisableShader")]
    public static void rl_disable_shader ();                       // Disable shader program

    // Framebuffer state
    [CCode (cname = "rlEnableFramebuffer")]
    public static void rl_enable_framebuffer (uint id);        // Enable render texture (fbo)

    [CCode (cname = "rlDisableFramebuffer")]
    public static void rl_disable_framebuffer ();                  // Disable render texture (fbo), return to default framebuffer

    [CCode (cname = "rlActiveDrawBuffers")]
    public static void rl_active_draw_buffers (int count);              // Activate multiple draw color buffers

    // General render state
    [CCode (cname = "rlEnableColorBlend")]
    public static void rl_enable_color_blend ();                     // Enable color blending

    [CCode (cname = "rlDisableColorBlend")]
    public static void rl_disable_color_blend ();                   // Disable color blending

    [CCode (cname = "rlEnableDepthTest")]
    public static void rl_enable_depth_test ();                     // Enable depth test

    [CCode (cname = "rlDisableDepthTest")]
    public static void rl_disable_depth_test ();                    // Disable depth test

    [CCode (cname = "rlEnableDepthMask")]
    public static void rl_enable_depth_mask ();                     // Enable depth write

    [CCode (cname = "rlDisableDepthMask")]
    public static void rl_disable_depth_mask ();                    // Disable depth write

    [CCode (cname = "rlEnableBackfaceCulling")]
    public static void rl_enable_backface_culling ();               // Enable backface culling

    [CCode (cname = "rlDisableBackfaceCulling")]
    public static void rl_disable_backface_culling ();              // Disable backface culling

    [CCode (cname = "rlSetCullFace")]
    public static void rl_set_cull_face (int mode);                     // Set face culling mode

    [CCode (cname = "rlEnableScissorTest")]
    public static void rl_enable_scissor_test ();                   // Enable scissor test

    [CCode (cname = "rlDisableScissorTest")]
    public static void rl_disable_scissor_test ();                  // Disable scissor test

    [CCode (cname = "rlScissor")]
    public static void rl_scissor (int x, int y, int width, int height); // Scissor test

    [CCode (cname = "rlEnableWireMode")]
    public static void rl_enable_wire_mode ();                      // Enable wire mode

    [CCode (cname = "rlDisableWireMode")]
    public static void rl_disable_wire_mode ();                     // Disable wire mode

    [CCode (cname = "rlSetLineWidth")]
    public static void rl_set_line_width (float width);                 // Set the line drawing width

    [CCode (cname = "rlGetLineWidth")]
    public static float rl_get_line_width ();                       // Get the line drawing width

    [CCode (cname = "rlEnableSmoothLines")]
    public static void rl_enable_smooth_lines ();                   // Enable line aliasing

    [CCode (cname = "rlDisableSmoothLines")]
    public static void rl_disable_smooth_lines ();                  // Disable line aliasing

    [CCode (cname = "rlEnableStereoRender")]
    public static void rl_enable_stereo_render ();                  // Enable stereo rendering

    [CCode (cname = "rlDisableStereoRender")]
    public static void rl_disable_stereo_render ();                 // Disable stereo rendering

    [CCode (cname = "rlIsStereoRenderEnabled")]
    public static bool rl_is_stereo_render_enabled ();               // Check if stereo render is enabled


    [CCode (cname = "rlClearColor")]
    public static void rl_clear_color (uchar r, uchar g, uchar b, uchar a); // Clear color buffer with color

    [CCode (cname = "rlClearScreenBuffers")]
    public static void rl_clear_screen_buffers ();                  // Clear used screen buffers (color and depth)

    [CCode (cname = "rlCheckErrors")]
    public static void rl_check_errors ();                         // Check and log OpenGL error codes

    [CCode (cname = "rlSetBlendMode")]
    public static void rl_set_blend_mode (int mode);                    // Set blending mode

    [CCode (cname = "rlSetBlendFactors")]
    public static void rl_set_blend_factors (int source_factor, int desitination_factor, int equation); // Set blending mode factor and equation (using OpenGL factors)

    [CCode (cname = "rlSetBlendFactorsSeparate")]
    public static void rl_set_blend_factors_separate (int source_rgb, int destination_rgb, int source_alpha, int desitination_alpha, int eq_rgb, int eq_alpha); // Set blending mode factors and equations separately (using OpenGL factors)

    //------------------------------------------------------------------------------------
    // Functions Declaration - rlgl functionality
    //------------------------------------------------------------------------------------
    // rlgl initialization functions
    [CCode (cname = "rlglInit")]
    public static void rlgl_init (int width, int height);               // Initialize rlgl (buffers, shaders, textures, states)

    [CCode (cname = "rlglClose")]
    public static void rlgl_close ();                                   // De-initialize rlgl (buffers, shaders, textures)

    [CCode (cname = "rlLoadExtensions")]
    public static void rl_load_extensions (void* loader);               // Load OpenGL extensions (loader function required)

    [CCode (cname = "rlGetVersion")]
    public static int get_version ();                                // Get current OpenGL version

    [CCode (cname = "rlSetFramebufferWidth")]
    public static void rl_set_framebuffer_width (int width);            // Set current framebuffer width

    [CCode (cname = "rlGetFramebufferWidth")]
    public static int get_framebuffer_width ();                      // Get default framebuffer width

    [CCode (cname = "rlSetFramebufferHeight")]
    public static void rl_set_framebuffer_height (int height);          // Set current framebuffer height

    [CCode (cname = "rlGetFramebufferHeight")]
    public static int get_framebuffer_height ();                     // Get default framebuffer height


    [CCode (cname = "rlGetTextureIdDefault")]
    public static uint get_texture_id_default ();                    // Get default texture id

    [CCode (cname = "rlGetlocashader_idDefault")]
    public static uint get_shader_id_default ();                     // Get default shader id

    [CCode (cname = "rlGetShaderLocsDefault")]
    public static int[] rl_get_shader_locations_default ();             // Get default shader locations

    // Render batch management
    // NOTE: rlgl provides a default render batch to behave like OpenGL 1.1 immediate mode
    // but this render batch API is exposed in case of custom batches are required
    [CCode (cname = "rlLoadRenderBatch")]
    public static RenderBatch rl_load_render_batch (int buffer_count, int buffer_elements);     // Load a render batch system

    [CCode (cname = "rlUnloadRenderBatch")]
    public static void rl_unload_render_batch (RenderBatch batch);                              // Unload render batch system

    [CCode (cname = "rlDrawRenderBatch")]
    public static void rl_draw_render_batch (RenderBatch batch);                        // Draw render batch data (Update->Draw->Reset)

    [CCode (cname = "rlSetRenderBatchActive")]
    public static void rl_set_render_batch_active (RenderBatch batch);                  // Set the active render batch for rlgl (NULL for default internal)

    [CCode (cname = "rlDrawRenderBatchActive")]
    public static void rl_draw_render_batch_active ();                                          // Update and draw internal render batch

    [CCode (cname = "rlCheckRenderBatchLimit")]
    public static bool rl_check_render_batch_limit (int vertex_count);                          // Check internal buffer overflow for a given number of vertex


    [CCode (cname = "rlSetTexture")]
    public static void rl_set_texture (uint id);                                                // Set current texture for render batch and check buffers limits

    //------------------------------------------------------------------------------------------------------------------------
    // Vertex buffers management
    [CCode (cname = "rlLoadVertexArray")]
    public static uint load_vertex_array ();                               // Load vertex array (vao) if supported

    [CCode (cname = "rlLoadVertexBuffer")]
    public static uint load_vertex_buffer (void* buffer, int size, bool is_dynamic);            // Load a vertex buffer attribute

    [CCode (cname = "rlLoadVertexBufferElement")]
    public static uint load_vertex_buffer_element (void* buffer, int size, bool is_dynamic);     // Load a new attributes element buffer

    [CCode (cname = "rlUpdateVertexBuffer")]
    public static void rl_update_vertex_buffer (uint buffer_id, void* data, int data_size, int offset);     // Update GPU buffer with new data

    [CCode (cname = "rlUpdateVertexBufferElements")]
    public static void rl_update_vertex_buffer_elements (uint id, void* data, int data_size, int offset);   // Update vertex buffer elements with new data

    [CCode (cname = "rlUnloadVertexArray")]
    public static void rl_unload_vertex_array (uint vao_id);

    [CCode (cname = "rlUnloadVertexBuffer")]
    public static void rl_unload_vertex_buffer (uint vbo_id);

    [CCode (cname = "rlSetVertexAttribute")]
    public static void rl_set_vertex_attribute (uint index, int component_size, int type, bool is_normalized, int stride, void* pointer);

    [CCode (cname = "rlSetVertexAttributeDivisor")]
    public static void rl_set_vertex_attribute_divisor (uint index, int divisor);

    [CCode (cname = "rlSetVertexAttributeDefault")]
    public static void rl_set_vertex_attribute_default (int location_index, void* value, int attribute_type, int count); // Set vertex attribute default value

    [CCode (cname = "rlDrawVertexArray")]
    public static void rl_draw_vertex_array (int offset, int count);

    [CCode (cname = "rlDrawVertexArrayElements")]
    public static void rl_draw_vertex_array_elements (int offset, int count, void* buffer);

    [CCode (cname = "rlDrawVertexArrayInstanced")]
    public static void rl_draw_vertex_array_instanced (int offset, int count, int instances);

    [CCode (cname = "rlDrawVertexArrayElementsInstanced")]
    public static void rl_draw_vertex_array_elements_instanced (int offset, int count, void* buffer, int instances);

    // Textures management
    [CCode (cname = "rlLoadTexture")]
    public static uint rl_load_texture (void* data, int width, int height, int format, int mipmap_count); // Load texture in GPU

    [CCode (cname = "rlLoadTextureDepth")]
    public static uint rl_load_texture_depth (int width, int height, bool use_render_buffer);               // Load depth texture/renderbuffer (to be attached to fbo)

    [CCode (cname = "rlLoadTextureCubemap")]
    public static uint rl_load_texture_cubemap (void* data, int size, int format);                        // Load texture cubemap

    [CCode (cname = "rlUpdateTexture")]
    public static void rl_update_texture (uint id, int offset_x, int offset_y, int width, int height, int format, void* data);  // Update GPU texture with new data

    [CCode (cname = "rlGetGlTextureFormats")]
    public static void rl_get_gl_texture_formats (int format, out uint gl_internal_format, out uint gl_format, out uint gl_type);  // Get OpenGL internal formats

    [CCode (cname = "rlGetPixelFormatName")]
    public static string rl_get_pixel_format_name (uint format);              // Get name string for pixel format

    [CCode (cname = "rlUnloadTexture")]
    public static void rl_unload_texture (uint id);                              // Unload texture from GPU memory

    [CCode (cname = "rlGenTextureMipmaps")]
    public static void rl_gen_texture_mipmaps (uint id, int width, int height, int format, out int mipmaps); // Generate mipmap data for selected texture

    [CCode (cname = "rlReadTexturePixels")]
    public static void* rl_read_texture_pixels (uint id, int width, int height, int format);              // Read texture pixel data

    [CCode (cname = "rlReadScreenPixels")]
    public static uchar[] rl_read_screen_pixels (int width, int height);           // Read screen pixel data (color buffer)

    // Framebuffer management (fbo)
    [CCode (cname = "rlLoadFramebuffer")]
    public static uint rl_load_framebuffer (int width, int height);              // Load an empty framebuffer

    [CCode (cname = "rlFramebufferAttach")]
    public static void rl_framebuffer_attach (uint fbo_id, uint texture_id, int attach_type, int texture_type, int mipmap_level);  // Attach texture/renderbuffer to a framebuffer

    [CCode (cname = "rlFramebufferComplete")]
    public static bool rl_framebuffer_complete (uint id);                        // Verify framebuffer is complete

    [CCode (cname = "rlUnloadFramebuffer")]
    public static void rl_unload_framebuffer (uint id);                          // Delete framebuffer from GPU

    // Shaders management
    [CCode (cname = "rlLoadShaderCode")]
    public static uint rl_load_shader_code (string vertex_shader, string fragment_shader);    // Load shader from code strings

    [CCode (cname = "rlCompileShader")]
    public static uint rl_compile_shader (string shader_code, int type);           // Compile custom shader and return shader id (type: RL_VERTEX_SHADER, RL_FRAGMENT_SHADER, RL_COMPUTE_SHADER)

    [CCode (cname = "rlLoadShaderProgram")]
    public static uint rl_load_shader_program (uint vertex_shader_id, uint fragment_shader_id); // Load custom shader program

    [CCode (cname = "rlUnloadShaderProgram")]
    public static void rl_unload_shader_program (uint id);                              // Unload shader program

    [CCode (cname = "rlGetLocationUniform")]
    public static int rl_get_location_uniform (uint shader_location_id, string uniform_name); // Get shader location uniform

    [CCode (cname = "rlGetLocationAttrib")]
    public static int rl_get_location_attribute (uint shader_location_id, string attribute_name);   // Get shader location attribute

    [CCode (cname = "rlSetUniform")]
    public static void rl_set_uniform (int location_index, void* value, int uniform_type, int count);   // Set shader value uniform

    [CCode (cname = "rlSetUniformMatrix")]
    public static void rl_set_uniform_matrix (int location_index, Matrix matrix);                        // Set shader value matrix

    [CCode (cname = "rlSetUniformSampler")]
    public static void rl_set_uniform_sampler (int location_index, uint texture_id);           // Set shader value sampler

    [CCode (cname = "rlSetShader", array_length = false)]
    public static void rl_set_shader (uint id, int[] locs);                             // Set shader currently active (id and locations)

    // Compute shader management
    [CCode (cname = "rlLoadComputeShaderProgram")]
    public static uint rl_load_compute_shader_program (uint shader_location_id);           // Load compute shader program

    [CCode (cname = "rlComputeShaderDispatch")]
    public static void rl_compute_shader_dispatch (uint group_x, uint group_y, uint group_z);  // Dispatch compute shader (equivalent to *draw* for graphics pipeline)

    // Shader buffer storage object management (ssbo)
    [CCode (cname = "rlLoadShaderBuffer")]
    public static uint rl_load_shader_buffer (uint size, void* data, int usage_hint); // Load shader storage buffer object (SSBO)

    [CCode (cname = "rlUnloadShaderBuffer")]
    public static void rl_unload_shader_buffer (uint ssbo_id);                           // Unload shader storage buffer object (SSBO)

    [CCode (cname = "rlUpdateShaderBuffer")]
    public static void rl_update_shader_buffer (uint id, void* data, uint data_size, uint offset); // Update SSBO buffer data

    [CCode (cname = "rlBindShaderBuffer")]
    public static void rl_bind_shader_buffer (uint id, uint index);             // Bind SSBO buffer

    [CCode (cname = "rlReadShaderBuffer")]
    public static void rl_read_shader_buffer (uint id, void* destination, uint count, uint offset); // Read SSBO buffer data (GPU->CPU)

    [CCode (cname = "rlCopyShaderBuffer")]
    public static void rl_copy_shader_buffer (uint destination_id, uint src_id, uint destination_offset, uint src_offset, uint count); // Copy SSBO data between buffers

    [CCode (cname = "rlGetShaderBufferSize")]
    public static uint rl_get_shader_buffer_size (uint id);                      // Get SSBO buffer size

    // Buffer management
    [CCode (cname = "rlBindImageTexture")]
    public static void rl_bind_image_texture(uint id, uint index, int format, bool is_read_only);  // Bind image texture

    // Matrix state management
    [CCode (cname = "rlGetMatrixModelview")]
    public static Matrix rl_get_matrix_modelview ();                                  // Get internal modelview matrix

    [CCode (cname = "rlGetMatrixProjection")]
    public static Matrix rl_get_matrix_projection ();                                 // Get internal projection matrix

    [CCode (cname = "rlGetMatrixTransform")]
    public static Matrix rl_get_matrix_transform ();                                  // Get internal accumulated transform matrix

    [CCode (cname = "rlGetMatrixProjectionStereo")]
    public static Matrix rl_get_matrix_projection_stereo (int eye);                        // Get internal projection matrix for stereo render (selected eye)

    [CCode (cname = "rlGetMatrixViewOffsetStereo")]
    public static Matrix rl_get_matrix_view_offset_stereo (int eye);                        // Get internal view offset matrix for stereo render (selected eye)

    [CCode (cname = "rlSetMatrixProjection")]
    public static void rl_set_matrix_projection (Matrix projection);                            // Set a custom projection matrix (replaces internal projection matrix)

    [CCode (cname = "rlSetMatrixModelview")]
    public static void rl_set_matrix_modelview (Matrix view);                             // Set a custom modelview matrix (replaces internal modelview matrix)

    [CCode (cname = "rlSetMatrixProjectionStereo")]
    public static void rl_set_matrix_projection_stereo (Matrix right, Matrix left);        // Set eyes projection matrices for stereo rendering

    [CCode (cname = "rlSetMatrixViewOffsetStereo")]
    public static void rl_set_matrix_view_offset_stereo (Matrix right, Matrix left);        // Set eyes view offsets matrices for stereo rendering

    // Quick and dirty cube/quad buffers load->draw->unload
    [CCode (cname = "rlLoadDrawCube")]
    public static void rl_load_draw_cube ();     // Load and draw a cube

    [CCode (cname = "rlLoadDrawQuad")]
    public static void rl_load_draw_quad ();     // Load and draw a quad
}
