using Raylib;
using Raymath;

[CCode (cprefix = "", cheader_filename = "physac.h")]
namespace Physac {
    [CCode (cname = "PHYSAC_MAX_BODIES")]
    public const int MAX_BODIES;

    [CCode (cname = "PHYSAC_MAX_MANIFOLDS")]
    public const int MAX_MANIFOLDS;

    [CCode (cname = "PHYSAC_MAX_VERTICES")]
    public const int MAX_VERTICES;

    [CCode (cname = "PHYSAC_CIRCLE_VERTICES")]
    public const int CIRCLE_VERTICES;

    [CCode (cname = "PHYSAC_COLLISION_ITERATIONS")]
    public const int COLLISION_ITERATIONS;

    [CCode (cname = "PHYSAC_PI")]
    public const float PI;

    [CCode (cname = "PHYSAC_DEG2RAD")]
    public const float DEG2RAD;

    // Matrix2x2 type (used for polygon shape rotation matrix)
    [SimpleType]
    [CCode (cname = "Matrix2x2", has_type_id = false)]
    public struct Matrix2x2 {
        float m00;
        float m01;
        float m10;
        float m11;
    }

    [CCode (cname = "PhysicsShapeType", cprefix = "PHYSICS_", has_type_id = false)]
    public enum PhysicsShapeType {
        CIRCLE,
        POLYGON
    } // PhysicsShapeType

    [CCode (cname = "PhysicsVertexData", has_type_id = false)]
    public struct PhysicsVertexData {
        [CCode (cname = "vertexCount")]
        public uint vertex_count; // Vertex count (positions and normals)

        public Vector2 positions[MAX_VERTICES]; // Vertex positions vectors

        public Vector2 normals[MAX_VERTICES]; // Vertex normals vectors
    }

    [CCode (cname = "PhysicsShape", has_type_id = false)]
    public struct PhysicsShape {
        public PhysicsShapeType type; // Shape type (circle or polygon)

        public PhysicsBody body; // Shape physics body data pointer

        [CCode (cname = "vertexData")]
        public PhysicsVertexData vertex_data; // Shape vertices data (used for polygon shapes)

        public float radius; // Shape radius (used for circle shapes)

        public Matrix2x2 transform; // Vertices transform matrix 2x2
    }

    [CCode (cname = "PhysicsBodyData", has_type_id = false)]
    public class PhysicsBodyData {
        public uint id; // Unique identifier

        public bool enabled; // Enabled dynamics state (collisions are calculated anyway)

        public Vector2 position; // Physics body shape pivot

        public Vector2 velocity; // Current linear velocity applied to position

        public Vector2 force; // Current linear force (reset to 0 every step)

        [CCode (cname = "angularVelocity")]
        public float angular_velocity; // Current angular velocity applied to orient

        public float torque; // Current angular force (reset to 0 every step)

        public float orient; // Rotation in radians

        public float inertia; // Moment of inertia

        [CCode (cname = "inverseInertia")]
        public float inverse_inertia; // Inverse value of inertia

        public float mass; // Physics body mass

        [CCode (cname = "inverseMass")]
        public float inverse_mass; // Inverse value of mass

        [CCode (cname = "staticFriction")]
        public float static_friction; // Friction when the body has not movement (0 to 1)

        [CCode (cname = "dynamicFriction")]
        public float dynamic_friction; // Friction when the body has movement (0 to 1)

        public float restitution; // Restitution coefficient of the body (0 to 1)

        [CCode (cname = "useGravity")]
        public bool use_gravity; // Apply gravity force to dynamics

        [CCode (cname = "isGrounded")]
        public bool is_grounded; // Physics grounded on other body state

        [CCode (cname = "freezeOrient")]
        public bool freeze_orient; // Physics rotation constraint

        public PhysicsShape shape; // Physics body shape information (type, radius, vertices, transform)
    }

    [CCode (cname = "PhysicsBodyData", unref_function = "",
    has_type_id = false)]
    public class PhysicsBody : PhysicsBodyData {}

    [CCode (cname = "PhysicsManifoldData", has_type_id = false)]
    public struct PhysicsManifoldData {
        public uint id; // Unique identifier

        [CCode (cname = "bodyA")]
        public PhysicsBody body_a; // Manifold first physics body reference

        [CCode (cname = "bodyB")]
        public PhysicsBody body_b; // Manifold second physics body reference

        public float penetration; // Depth of penetration from collision

        public Vector2 normal; // Normal direction vector from 'a' to 'b'

        public Vector2 contacts[2]; // Points of contact during collision

        [CCode (cname = "contactsCount")]
        public uint contacts_count; // Current collision number of contacts

        public float restitution; // Mixed restitution during collision

        [CCode (cname = "dynamicFriction")]
        public float dynamic_friction; // Mixed dynamic friction during collision

        [CCode (cname = "staticFriction")]
        public float static_friction; // Mixed static friction during collision
    }

    //----------------------------------------------------------------------------------
    // Module Functions Declaration
    //----------------------------------------------------------------------------------

    // Physics system management
    [CCode (cname = "InitPhysics")]
    public static void init_physics (); // Initializes physics system

    [CCode (cname = "UpdatePhysics")]
    public static void update_physics (); // Update physics system

    [CCode (cname = "ResetPhysics")]
    public static void reset_physics(); // Reset physics system (global variables)

    [CCode (cname = "ClosePhysics")]
    public static void close_physics (); // Close physics system and unload used memory

    [CCode (cname = "SetPhysicsTimeStep")]
    public static void set_physics_time_step (double delta); // Sets physics fixed time step in milliseconds. 1.666666 by default

    [CCode (cname = "SetPhysicsGravity")]
    public static void set_physics_gravity (float x, float y); // Sets physics global gravity force

    // Physic body creation/destroy
    [CCode (cname = "CreatePhysicsBodyCircle")]
    public static PhysicsBody create_physics_body_circle (Vector2 pos, float radius, float density); // Creates a new circle physics body with generic parameters

    [CCode (cname = "CreatePhysicsBodyRectangle")]
    public static PhysicsBody create_physics_body_rectangle (Vector2 pos, float width, float height, float density); // Creates a new rectangle physics body with generic parameters

    [CCode (cname = "CreatePhysicsBodyPolygon")]
    public static PhysicsBody create_physics_body_polygon (Vector2 pos, float radius, int sides, float density); // Creates a new polygon physics body with generic parameters

    [CCode (cname = "DestroyPhysicsBody")]
    public static void destroy_physics_body (PhysicsBody body); // Destroy a physics body

    // Physic body forces
    [CCode (cname = "PhysicsAddForce")]
    public static void physics_add_force (PhysicsBody body, Vector2 force); // Adds a force to a physics body

    [CCode (cname = "PhysicsAddForce")]
    public static void physics_add_torque (PhysicsBody body, float amount); // Adds an angular force to a physics body

    [CCode (cname = "PhysicsShatter")]
    public static void physics_shatter (PhysicsBody body, Vector2 position, float force); // Shatters a polygon shape physics body to little physics bodies with explosion force

    [CCode (cname = "SetPhysicsBodyRotation")]
    public static void set_physics_body_rotation (PhysicsBody body, float radians); // Sets physics body shape transform based on radians parameter

    // Query physics info
    [CCode (cname = "GetPhysicsBody")]
    public static PhysicsBody get_physics_body (int index); // Returns a physics body of the bodies pool at a specific index

    [CCode (cname = "GetPhysicsBodiesCount")]
    public static int get_physics_bodies_count (); // Returns the current amount of created physics bodies

    [CCode (cname = "GetPhysicsShapeType")]
    public static PhysicsShapeType get_physics_shape_type (int index); // Returns the physics body shape type (PHYSICS_CIRCLE or PHYSICS_POLYGON)

    [CCode (cname = "GetPhysicsShapeVerticesCount")]
    public static int get_physics_shape_vertices_count (int index); // Returns the amount of vertices of a physics body shape

    [CCode (cname = "GetPhysicsShapeVertex")]
    public static Vector2 get_physics_shape_vertex (PhysicsBody body, int vertex); // Returns transformed position of a body shape (body position + vertex transformed position)}
}
