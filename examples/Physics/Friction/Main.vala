using Raylib;
using Physac;

public static int main () {
    // Initialization
    //--------------------------------------------------------------------------------------
    const int SCREEN_WIDTH = 800;
    const int SCREEN_HEIGHT = 450;

    set_config_flags (ConfigFlags.MSAA_4X_HINT);
    init_window (SCREEN_WIDTH, SCREEN_HEIGHT, "Vala raylib [physac] example - physics demo");

    // Physac logo drawing position
    int logo_x = SCREEN_WIDTH - measure_text ("Physac", 30) - 10;
    int logo_y = 15;

    Vector2 rectangle_body_pos = { SCREEN_WIDTH / 2.0f, SCREEN_HEIGHT };
    Vector2 circle_body_pos = { SCREEN_WIDTH / 2.0f, SCREEN_HEIGHT / 2.0f };

    // Initialize physics and default physics bodies
    init_physics ();

    // Create floor rectangle physics body
    var floor = create_physics_body_rectangle (rectangle_body_pos, 500, 100, 10);
    floor.enabled = false; // Disable body state to convert it to static (no dynamics, but collisions)

    // Create obstacle circle physics body
    var circle = create_physics_body_circle (circle_body_pos, 45, 10);
    circle.enabled = false; // Disable body state to convert it to static (no dynamics, but collisions)

    set_target_fps (60); // Set our game to run at 60 frames-per-second
    //--------------------------------------------------------------------------------------

    // Main game loop
    while (!window_should_close ()) { // Detect window close button or ESC key
        // Update
        //----------------------------------------------------------------------------------
        update_physics (); // Update physics system

        if (is_key_pressed (KeyboardKey.R)) { // Reset physics system
            reset_physics ();
            floor = create_physics_body_rectangle (rectangle_body_pos, 500, 100, 10);
            floor.enabled = false;

            circle = create_physics_body_circle (circle_body_pos, 45, 10);
            circle.enabled = false;
        }

        // Physics body creation inputs
        if (is_mouse_button_pressed (MouseButton.LEFT)) {
            create_physics_body_polygon (get_mouse_position (), get_random_value (20, 80), get_random_value (3, 8), 10);
        } else if (is_mouse_button_pressed (MouseButton.RIGHT)) {
            create_physics_body_circle (get_mouse_position (), get_random_value (10, 45), 10);
        }

        // Destroy falling physics bodies
        int bodies_count = get_physics_bodies_count ();
        for (int i = bodies_count - 1; i >= 0; i--) {
            var body = get_physics_body (i);
            if (body != null && (body.position.y > SCREEN_HEIGHT * 2)) {
                destroy_physics_body (body);
            }
        }
        //----------------------------------------------------------------------------------

        // Draw
        //----------------------------------------------------------------------------------
        begin_drawing ();

        clear_background (BLACK);

        draw_fps (SCREEN_WIDTH - 90, SCREEN_HEIGHT - 30);

        // Draw created physics bodies
        bodies_count = get_physics_bodies_count ();
        for (int i = 0; i < bodies_count; i++)
        {
            var body = get_physics_body (i);
            if (body != null) {
                int vertex_count = get_physics_shape_vertices_count (i);
                for (int j = 0; j < vertex_count; j++) {
                    // Get physics bodies shape vertices to draw lines
                    // Note: get_physics_shape_vertex () already calculates rotation transformations
                    Vector2 vertex_a = get_physics_shape_vertex (body, j);

                    int jj = (((j + 1) < vertex_count) ? (j + 1) : 0);   // Get next vertex or first to close the shape
                    Vector2 vertex_b = get_physics_shape_vertex(body, jj);

                    draw_line_vector (vertex_a, vertex_b, GREEN); // Draw a line between two vertex positions
                }
            }
        }

        draw_text ("Left mouse button to create a polygon", 10, 10, 10, WHITE);
        draw_text ("Right mouse button to create a circle", 10, 25, 10, WHITE);
        draw_text ("Press 'R' to reset example", 10, 40, 10, WHITE);

        draw_text ("Physac", logo_x, logo_y, 30, WHITE);
        draw_text ("Powered by", logo_x + 50, logo_y - 7, 10, WHITE);

        end_drawing();
        //----------------------------------------------------------------------------------
    }

    // De-Initialization
    //--------------------------------------------------------------------------------------
    close_physics (); // Unitialize physics
    close_window(); // Close window and OpenGL context
    //--------------------------------------------------------------------------------------
    return 0;
}
