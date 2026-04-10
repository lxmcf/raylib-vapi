[CCode (cprefix = "", cheader_filename = "raylib.h,raymath.h")]
namespace Raymath {
    //----------------------------------------------------------------------------------
    // Defines and Macros
    //----------------------------------------------------------------------------------
    [CCode (cname = "PI")]
    public const float PI;

    [CCode (cname = "EPSILON")]
    public const float EPSILON;

    [CCode (cname = "DEG2RAD")]
    public const float DEG2RAD;

    [CCode (cname = "RAD2DEG")]
    public const float RAD2DEG;

    [CCode (cname = "MatrixToFloat")]
    public static float matrix_to_float (Matrix mat);

    [CCode (cname = "Vector3ToFloat")]
    public static float vector3_to_float (Vector3 vec);

    //----------------------------------------------------------------------------------
    // Types and Structures Definition
    //----------------------------------------------------------------------------------

    [SimpleType]
    [CCode (cname = "float3", has_type_id = false)]
    public struct Float3 {
        public float v[3];
    }

    [SimpleType]
    [CCode (cname = "float16", has_type_id = false)]
    public struct Float16 {
        public float v[16];
    }

    //----------------------------------------------------------------------------------
    // Module Functions Definition - Utils math
    //----------------------------------------------------------------------------------

    [CCode (cname = "Clamp")]
    public static float clamp (float val, float min, float max);

    [CCode (cname = "Lerp")]
    public static float lerp (float start, float end, float amount);

    [CCode (cname = "Normalize")]
    public static float normalize (float val, float start, float end);

    [CCode (cname = "Remap")]
    public static float remap (float val, float input_start, float input_end, float output_start, float output_end);

    [CCode (cname = "Wrap")]
    public static float wrap (float val, float min, float max);

    [CCode (cname = "FloatEquals")]
    public static int float_equals (float x, float y);

    //----------------------------------------------------------------------------------
    // Module Functions Definition - Vector2 math
    //----------------------------------------------------------------------------------

    [SimpleType]
    [CCode (cname = "Vector2", has_type_id = false)]
    public struct Vector2 {
        public float x;
        public float y;

        public float length {
            [CCode (cname = "Vector2Length")] get;
        }

        public float length_squared {
            [CCode (cname = "Vector2LengthSqr")] get;
        }

        public Vector2 negated {
            [CCode (cname = "Vector2Negate")] get;
        }

        public Vector2 normalized {
            [CCode (cname = "Vector2Normalize")] get;
        }

        public Vector2 inverted {
            [CCode (cname = "Vector2Invert")] get;
        }

        [CCode (cname = "Vector2Zero")]
        public Vector2 ();

        [CCode (cname = "Vector2Zero")]
        public Vector2.zero ();

        [CCode (cname = "Vector2One")]
        public Vector2.one ();

        public Vector2.unit_x () { x = 1; y = 0; }

        public Vector2.unit_y () { x = 0; y = 1; }

        [CCode (cname = "Vector2Add")]
        public Vector2 add (Vector2 v);

        [CCode (cname = "Vector2AddValue")]
        public Vector2 add_value (float add);

        [CCode (cname = "Vector2Subtract")]
        public Vector2 subtract (Vector2 v);

        [CCode (cname = "Vector2SubtractValue")]
        public Vector2 subtract_value (float sub);

        [CCode (cname = "Vector2DotProduct")]
        public float dot (Vector2 v);

        [CCode (cname = "Vector2CrossProduct")]
        public float cross (Vector2 v);

        [CCode (cname = "Vector2Distance")]
        public Vector2 distance (Vector2 v);

        [CCode (cname = "Vector2DistanceSqr")]
        public Vector2 distance_squared (Vector2 v);

        [CCode (cname = "Vector2Angle")]
        public float angle (Vector2 v);

        [CCode (cname = "Vector2Scale")]
        public Vector2 scale (float scalar);

        [CCode (cname = "Vector2Multiply")]
        public Vector2 multiply (Vector2 v);

        [CCode (cname = "Vector2Divide")]
        public Vector2 divide (Vector2 v);

        [CCode (cname = "Vector2Transform")]
        public Vector2 transform (Matrix mat);

        [CCode (cname = "Vector2Reflect")]
        public Vector2 reflect (Vector2 normal);

        [CCode (cname = "Vector2Min")]
        public Vector2 minimum (Vector2 v);

        [CCode (cname = "Vector2Max")]
        public Vector2 maximum (Vector2 v);

        [CCode (cname = "Vector2Rotate")]
        public Vector2 rotate (float angle);

        [CCode (cname = "Vector2MoveTowards")]
        public Vector2 move_towards (Vector2 v, float max_distance);

        [CCode (cname = "Vector2Clamp")]
        public Vector2 clamp (Vector2 min, Vector2 max);

        [CCode (cname = "Vector2ClampValue")]
        public Vector2 clamp_magnitude (float min, float max);

        [CCode (cname = "Vector2Equals")]
        public bool equal_to (Vector2 v);

        public string to_string () {
            return "{%f, %f}".printf (x, y);
        }

        [CCode (cname = "Vector2Lerp")]
        public static Vector2 lerp (Vector2 v1, Vector2 v2, float t);

        [CCode (cname = "Vector2LineAngle")]
        public static float line_angle (Vector2 start, Vector2 end);

        [CCode (cname = "Vector2Refract")]
        public static Vector2 refract (Vector2 direction, Vector2 normal, float ratio);
    }

    //----------------------------------------------------------------------------------
    // Module Functions Definition - Vector3 math
    //----------------------------------------------------------------------------------

    [SimpleType]
    [CCode (cname = "Vector3", has_type_id = false)]
    public struct Vector3 {
        public float x;
        public float y;
        public float z;

        public float length {
            [CCode (cname = "Vector3Length")] get;
        }

        public float length_squared {
            [CCode (cname = "Vector3LengthSqr")] get;
        }

        public Vector3 negated {
            [CCode (cname = "Vector3Negate")] get;
        }

        public Vector3 normalized {
            [CCode (cname = "Vector3Normalize")] get;
        }

        public Vector3 inverted {
            [CCode (cname = "Vector3Invert")] get;
        }

        [CCode (cname = "Vector3Zero")]
        public Vector3 ();

        [CCode (cname = "Vector3Zero")]
        public Vector3.zero ();

        [CCode (cname = "Vector3One")]
        public Vector3.one ();

        public Vector3.unit_x () { x = 1; y = 0; z = 0; }

        public Vector3.unit_y () { x = 0; y = 1; z = 0; }

        public Vector3.unit_z () { x = 0; y = 0; z = 1; }

        [CCode (cname = "Vector3Add")]
        public Vector3 add (Vector3 v);

        [CCode (cname = "Vector3AddValue")]
        public Vector3 add_value (float add);

        [CCode (cname = "Vector3Subtract")]
        public Vector3 subtract (Vector3 v);

        [CCode (cname = "Vector3SubtractValue")]
        public Vector3 subtract_value (float sub);

        [CCode (cname = "Vector3Scale")]
        public Vector3 scale (float scalar);

        [CCode (cname = "Vector3Multiply")]
        public Vector3 multiply (Vector3 v);

        [CCode (cname = "Vector3CrossProduct")]
        public Vector3 cross (Vector3 v2);

        [CCode (cname = "Vector3Perpendicular")]
        public Vector3 perpendicular (Vector3 v2);

        [CCode (cname = "Vector3DotProduct")]
        public float dot (Vector3 v);

        [CCode (cname = "Vector3Distance")]
        public Vector3 distance (Vector3 v);

        [CCode (cname = "Vector3DistanceSqr")]
        public Vector3 distance_squared (Vector3 v);

        [CCode (cname = "Vector3Angle")]
        public float angle (Vector3 v);

        [CCode (cname = "Vector3Divide")]
        public Vector3 divide (Vector3 v);

        [CCode (cname = "Vector3Project")]
        public Vector3 project (Vector3 v);

        [CCode (cname = "Vector3Reject")]
        public Vector3 reject (Vector3 v);

        [CCode (cname = "Vector3Transform")]
        public Vector3 transform (Matrix m);

        [CCode (cname = "Vector3RotateByQuaternion")]
        public Vector3 rotate_by_quaternion (Quaternion q);

        [CCode (cname = "Vector3RotateByAxisAngle")]
        public Vector3 rotate_by_axis_angle (Vector3 axis, float angle);

        [CCode (cname = "Vector3MoveTowards")]
        public Vector3 move_towards (Vector3 target, float max_distance);

        [CCode (cname = "Vector3Reflect")]
        public Vector3 reflect (Vector3 normal);

        [CCode (cname = "Vector3Min")]
        public Vector3 minimum (Vector3 v);

        [CCode (cname = "Vector2Max")]
        public Vector3 maximum (Vector3 v);

        [CCode (cname = "Vector3ToFloatV")]
        public Float3 to_float3 ();

        [CCode (cname = "Vector3Clamp")]
        public Vector3 clamp (Vector3 min, Vector3 max);

        [CCode (cname = "Vector3ClampValue")]
        public Vector3 clamp_magnitude (float min, float max);

        [CCode (cname = "Vector3Equals")]
        public bool equal_to (Vector3 v);

        public string to_string () {
            return "{%f, %f, %f}".printf (x, y, z);
        }

        [CCode (cname = "Vector3OrthoNormalize")]
        public static void ortho_normalize (ref Vector3 v1, ref Vector3 v2);

        [CCode (cname = "Vector3CubicHermite")]
        public static Vector3 cubic_hermite (Vector3 v1, Vector3 tangent1, Vector3 v2, Vector3 tangent2, float t);

        [CCode (cname = "Vector3Lerp")]
        public static Vector3 lerp (Vector3 v1, Vector3 v2, float t);

        [CCode (cname = "Vector3Barycenter")]
        public static Vector3 barycenter (Vector3 p, Vector3 a, Vector3 b, Vector3 c);

        [CCode (cname = "Vector3Unproject")]
        public static Vector3 unproject (Vector3 source, Matrix projection, Matrix view);

        [CCode (cname = "Vector3Refract")]
        public static Vector3 refract (Vector3 direction, Vector3 normal, float ratio);
    }

    //----------------------------------------------------------------------------------
    // Module Functions Definition - Vector4 math
    //----------------------------------------------------------------------------------

    [SimpleType]
    [CCode (cname = "Vector4", has_type_id = false)]
    public struct Vector4 {
        public float x;
        public float y;
        public float z;
        public float w;

        public float length {
            [CCode (cname = "Vector4Length")] get;
        }

        public float length_squared {
            [CCode (cname = "Vector4LengthSqr")] get;
        }

        public Vector4 negated {
            [CCode (cname = "Vector4Negate")] get;
        }

        public Vector4 normalized {
            [CCode (cname = "Vector4Normalize")] get;
        }

        public Vector4 inverted {
            [CCode (cname = "Vector4Invert")] get;
        }

        [CCode (cname = "Vector4Zero")]
        public Vector4 ();

        [CCode (cname = "Vector4Zero")]
        public Vector4.zero ();

        [CCode (cname = "Vector4One")]
        public Vector4.one ();

        public Vector4.unit_x () { x = 1; y = 0; z = 0; w = 0; }

        public Vector4.unit_y () { x = 0; y = 1; z = 0; w = 0; }

        public Vector4.unit_z () { x = 0; y = 0; z = 1; w = 0; }

        public Vector4.unit_w () { x = 0; y = 0; z = 0; w = 1; }

        [CCode (cname = "Vector4Add")]
        public Vector4 add (Vector4 v);

        [CCode (cname = "Vector4AddValue")]
        public Vector4 add_value (float add);

        [CCode (cname = "Vector4Subtract")]
        public Vector4 subtract (Vector3 v);

        [CCode (cname = "Vector4SubtractValue")]
        public Vector4 subtract_value (float sub);

        [CCode (cname = "Vector4DotProduct")]
        public float dot (Vector4 v);

        [CCode (cname = "Vector4Distance")]
        public Vector4 distance (Vector4 v);

        [CCode (cname = "Vector4DistanceSqr")]
        public Vector4 distance_squared (Vector4 v);

        [CCode (cname = "Vector4Scale")]
        public Vector4 scale (float scalar);

        [CCode (cname = "Vector4Multiply")]
        public Vector4 multiply (Vector4 v);

        [CCode (cname = "Vector4Divide")]
        public Vector4 divide (Vector4 v);

        [CCode (cname = "Vector4Min")]
        public Vector4 minimum (Vector4 v);

        [CCode (cname = "Vector4Max")]
        public Vector4 maximum (Vector4 v);

        [CCode (cname = "Vector4MoveTowards")]
        public Vector4 move_towards (Vector4 target, float max_distance);

        [CCode (cname = "Vector4Equals")]
        public bool equal_to (Vector4 v);

        public string to_string () {
            return "{%f, %f, %f, %f}".printf (x, y, z, w);
        }

        [CCode (cname = "Vector4Lerp")]
        public static Vector4 lerp (Vector4 v1, Vector4 v2, float t);
    }

    //----------------------------------------------------------------------------------
    // Module Functions Definition - Matrix math
    //----------------------------------------------------------------------------------

    [SimpleType]
    [CCode (cname = "Matrix", has_type_id = false)]
    public struct Matrix {
        // Row 1
        public float m0;
        public float m4;
        public float m8;
        public float m12;

        // Row 2
        public float m1;
        public float m5;
        public float m9;
        public float m13;

        // Row 3
        public float m2;
        public float m6;
        public float m10;
        public float m14;

        // Row 4
        public float m3;
        public float m7;
        public float m11;
        public float m15;

        public float determinant {
            [CCode (cname = "MatrixDeterminant")] get;
        }

        public float trace {
            [CCode (cname = "MatrixTrace")] get;
        }

        public float transposed {
            [CCode (cname = "MatrixTranspose")] get;
        }

        public float inverted {
            [CCode (cname = "MatrixInvert")] get;
        }

        [CCode (cname = "MatrixIdentity")]
        public Matrix.identity ();

        [CCode (cname = "MatrixTranslate")]
        public Matrix.translation (float x, float y, float z);

        [CCode (cname = "MatrixRotate")]
        public Matrix.rotation (Vector3 axis, float angle);

        [CCode (cname = "MatrixRotateX")]
        public Matrix.rotation_x (float angle);

        [CCode (cname = "MatrixRotateY")]
        public Matrix.rotation_y (float angle);

        [CCode (cname = "MatrixRotateZ")]
        public Matrix.rotation_z (float angle);

        [CCode (cname = "MatrixRotateXYZ")]
        public Matrix.rotation_xyz (Vector3 angle);

        [CCode (cname = "MatrixRotateZYX")]
        public Matrix.rotation_zxy (Vector3 angle);

        [CCode (cname = "MatrixFrustum")]
        public Matrix.frustum (double left, double right, double bottom, double top, double near_plane,
                               double far_plane);

        [CCode (cname = "MatrixPerspective")]
        public Matrix.perspective (double fov, double aspec, double near_plane, double far_plane);

        [CCode (cname = "MatrixOrtho")]
        public Matrix.orthographic (double left, double right, double bottom, double top, double near_plane,
                                    double far_plane);

        [CCode (cname = "MatrixLookAt")]
        public Matrix.look_at (Vector3 eye, Vector3 target, Vector3 up);

        [CCode (cname = "MatrixScale")]
        public Matrix.scale (float x, float y, float z);

        [CCode (cname = "MatrixCompose")]
        public Matrix.compose (Vector3 translation, Quaternion rotation, Vector3 scale);

        [CCode (cname = "MatrixAdd")]
        public Matrix add (Matrix m);

        [CCode (cname = "MatrixSubtract")]
        public Matrix subtract (Matrix m);

        [CCode (cname = "MatrixMultiply")]
        public Matrix multiply (Matrix m);

        [CCode (cname = "MatrixMultiplyValue")]
        public Matrix multiply_value (float val);

        [CCode (cname = "MatrixToFloatV")]
        public Float16 to_float16 ();

        [CCode (cname = "MatrixDecompose")]
        public Matrix decompose (out Vector3 translation, out Quaternion rotation, out Vector3 scale);

        public string to_string () {
            return ("{%f, %f, %f, %f}\n" +
                    "{%f, %f, %f, %f}\n" +
                    "{%f, %f, %f, %f}\n" +
                    "{%f, %f, %f, %f}").printf (m0, m4, m8, m12,
                                                m1, m5, m9, m13,
                                                m2, m6, m10, m14,
                                                m3, m7, m11, m15);
        }
    }

    //----------------------------------------------------------------------------------
    // Module Functions Definition - Quaternion math
    //----------------------------------------------------------------------------------

    [SimpleType]
    [CCode (cname = "Quaternion", has_type_id = false)]
    public struct Quaternion {
        public float x;
        public float y;
        public float z;
        public float w;

        public float length {
            [CCode (cname = "QuaternionLength")] get;
        }

        public Quaternion normalized {
            [CCode (cname = "QuaternionNormalize")] get;
        }

        public Quaternion inverted {
            [CCode (cname = "QuaternionInvert")] get;
        }

        public Quaternion.zero () { x = 0; y = 0; z = 0; w = 0; }

        public Quaternion.one () { x = 1; y = 1; z = 1; w = 1; }

        [CCode (cname = "QuaternionIdentity")]
        public Quaternion.identity ();

        [CCode (cname = "QuaternionFromVector3ToVector3")]
        public Quaternion.from_vector3_to_vector3 (Vector3 from, Vector3 to);

        [CCode (cname = "QuaternionFromMatrix")]
        public Quaternion.from_matrix (Matrix mat);

        [CCode (cname = "QuaternionFromAxisAngle")]
        public Quaternion.from_axis_angle (Vector3 axis, float angle);

        [CCode (cname = "QuaternionFromEuler")]
        public Quaternion.from_euler (float pitch, float yaw, float roll);

        [CCode (cname = "QuaternionAdd")]
        public Quaternion add (Quaternion q);

        [CCode (cname = "QuaternionAddValue")]
        public Quaternion add_value (float add);

        [CCode (cname = "QuaternionSubtract")]
        public Quaternion subtract (Quaternion q);

        [CCode (cname = "QuaternionSubtractValue")]
        public Quaternion subtract_value (float sub);

        [CCode (cname = "QuaternionMultiply")]
        public Quaternion multiply (Quaternion q);

        [CCode (cname = "QuaternionScale")]
        public Quaternion scale (float scalar);

        [CCode (cname = "QuaternionDivide")]
        public Quaternion divide (Quaternion q);

        [CCode (cname = "QuaternionToMatrix")]
        public Matrix to_matrix ();

        [CCode (cname = "QuaternionToAxisAngle")]
        public void to_axis_angle (out Vector3 axis, out float angle);

        [CCode (cname = "QuaternionToEuler")]
        public Vector3 to_euler ();

        [CCode (cname = "QuaternionTransform")]
        public Quaternion transform (Matrix mat);

        [CCode (cname = "QuaternionEquals")]
        public int equal_to (Quaternion q);

        public string to_string () {
            return "{%f, %f, %f, %f}".printf (x, y, z, w);
        }

        [CCode (cname = "QuaternionLerp")]
        public static Quaternion lerp (Quaternion q1, Quaternion q2, float amount);

        [CCode (cname = "QuaternionNLerp")]
        public static Quaternion nlerp (Quaternion q1, Quaternion q2, float amount);

        [CCode (cname = "QuaternionSLerp")]
        public static Quaternion slerp (Quaternion q1, Quaternion q2, float amount);

        [CCode (cname = "QuaternionCubicHermiteSpline")]
        public static Quaternion cubic_hermite_spline (Quaternion q1, Quaternion tangent1, Quaternion q2,
                                                       Quaternion angent2, float t);
    }
}

