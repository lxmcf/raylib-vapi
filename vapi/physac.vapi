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

    [CCode (cname = "PHYSAC_PENETRATION_ALLOWANCE")]
    public const float PENETRATION_ALLOWANCE;

    [CCode (cname = "PHYSAC_PENETRATION_CORRECTION")]
    public const float PENETRATION_CORRECTION;

    [CCode (cname = "PHYSAC_PI")]
    public const double PI;

    [CCode (cname = "PHYSAC_DEG2RAD")]
    public const float DEG2RAD;


    [CCode (cname = "PhysicsShapeType", cprefix = "PHYSICS_", has_type_id = false)]
    public enum ShapeType {
        CIRCLE,
        POLYGON
    }

    [CCode (cname = "PhysicsBody")]
    public struct PhysicsBody {
        uint id;                                    // Reference unique identifier
        bool enabled;                               // Enabled dynamics state (collisions are calculated anyway)
        Raylib.Vector2 position;                    // Physics body shape pivot
        Raylib.Vector2 velocity;                    // Current linear velocity applied to position
        Raylib.Vector2 force;                       // Current linear force (reset to 0 every step)
        float angularVelocity;                      // Current angular velocity applied to orient
        float torque;                               // Current angular force (reset to 0 every step)
        float orient;                               // Rotation in radians
        float inertia;                              // Moment of inertia
        float inverseInertia;                       // Inverse value of inertia
        float mass;                                 // Physics body mass
        float inverseMass;                          // Inverse value of mass
        float staticFriction;                       // Friction when the body has not movement (0 to 1)
        float dynamicFriction;                      // Friction when the body has movement (0 to 1)
        float restitution;                          // Restitution coefficient of the body (0 to 1)
        bool useGravity;                            // Apply gravity force to dynamics
        bool isGrounded;                            // Physics grounded on other body state
        bool freezeOrient;                          // Physics rotation constraint
        PhysicsShape shape;                         // Physics body shape information (type, radius, vertices, normals)
    }

    [SimpleType]
    [CCode (cname = "Mat2")]
    public struct Matrix2 {
        public float m00;
        public float m01;
        public float m10;
        public float m11;
    } // Mat2 type (used for polygon shape rotation matrix)

    [SimpleType]
    [CCode (cname = "PolygonData")]
    public struct PolygonData {
        public uint vertexCount;                                                // Current used vertex and normals count
        public unowned Raylib.Vector2 positions[MAX_VERTICES];                  // Polygon vertex positions vectors
        public unowned Raylib.Vector2 normals[MAX_VERTICES];                    // Polygon vertex normals vectors
    }


    [CCode (cname = "PhysicsShape")]
    public struct PhysicsShape {
        public ShapeType type;                             // Physics shape type (circle or polygon)
        public PhysicsBody body;                           // Shape physics body reference
        public float radius;                               // Circle shape radius (used for circle shapes)
        public Matrix2 transform;                          // Vertices transform matrix 2x2
        public PolygonData vertexData;                     // Polygon shape vertices position and normals data (just used for polygon shapes)
    }

    [CCode (cname = "InitPhysics")]
    public static void init_physics ();                                                                           // Initializes physics values, pointers and creates physics loop thread

    [CCode (cname = "RunPhysicsStep")]
    public static void run_physics_step ();                                                                        // Run physics step, to be used if PHYSICS_NO_THREADS is set in your main loop

    [CCode (cname = "SetPhysicsTimeStep")]
    public static void set_physics_time_step (double delta);                                                            // Sets physics fixed time step in milliseconds. 1.666666 by default

    [CCode (cname = "IsPhysicsEnabled")]
    public static bool is_physics_enabled ();                                                                      // Returns true if physics thread is currently enabled

    [CCode (cname = "SetPhysicsGravity")]
    public static void set_physics_gravity (float x, float y);                                                         // Sets physics global gravity force

    [CCode (cname = "CreatePhysicsBodyCircle")]
    public static PhysicsBody create_physics_body_circle (Raylib.Vector2 pos, float radius, float density);                    // Creates a new circle physics body with generic parameters

    [CCode (cname = "CreatePhysicsBodyRectangle")]
    public static PhysicsBody create_physics_body_rectangle (Raylib.Vector2 pos, float width, float height, float density);    // Creates a new rectangle physics body with generic parameters

    [CCode (cname = "CreatePhysicsBodyPolygon")]
    public static PhysicsBody create_physics_body_polygon (Raylib.Vector2 pos, float radius, int sides, float density);        // Creates a new polygon physics body with generic parameters

    [CCode (cname = "PhysicsAddForce")]
    public static void physics_add_force (PhysicsBody body, Raylib.Vector2 force);                                            // Adds a force to a physics body

    [CCode (cname = "PhysicsAddTorque")]
    public static void physics_add_torque (PhysicsBody body, float amount);                                            // Adds an angular force to a physics body

    [CCode (cname = "PhysicsShatter")]
    public static void physics_shatter (PhysicsBody body, Raylib.Vector2 position, float force);                             // Shatters a polygon shape physics body to little physics bodies with explosion force

    [CCode (cname = "GetPhysicsBodiesCount")]
    public static int get_physics_bodies_count ();                                                                  // Returns the current amount of created physics bodies

    [CCode (cname = "GetPhysicsBody")]
    public static PhysicsBody get_physics_body (int index);                                                            // Returns a physics body of the bodies pool at a specific index

    [CCode (cname = "GetPhysicsShapeType")]
    public static int get_physics_shape_type (int index);                                                               // Returns the physics body shape type (PHYSICS_CIRCLE or PHYSICS_POLYGON)

    [CCode (cname = "GetPhysicsShapeVerticesCount")]
    public static int get_physics_shape_vertices_count (int index);                                                      // Returns the amount of vertices of a physics body shape

    [CCode (cname = "GetPhysicsShapeVertex")]
    public static Raylib.Vector2 get_physics_shape_vertex (PhysicsBody body, int vertex);                                      // Returns transformed position of a body shape (body position + vertex transformed position)

    [CCode (cname = "SetPhysicsBodyRotation")]
    public static void set_physics_body_rotation (PhysicsBody body, float radians);                                     // Sets physics body shape transform based on radians parameter

    [CCode (cname = "DestroyPhysicsBody")]
    public static void destroy_physics_body (PhysicsBody body);                                                        // Unitializes and destroy a physics body

    [CCode (cname = "ClosePhysics")]
    public static void close_physics ();                                                                          // Unitializes physics pointers and closes physics loop thread
}
