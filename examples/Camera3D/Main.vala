using Raylib;

public const int MAX_COLUMNS = 20;
public const int SCREEN_WIDTH = 800;
public const int SCREEN_HEIGHT = 450;

public static int main (string[] args) {
    init_window (SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [core] example - 3d camera first person");

    Camera camera = { };
    camera.position = { 4.0f, 2.0f, 4.0f };
    camera.target = { 0.0f, 1.8f, 0.0f };
    camera.up = { 0.0f, 1.0f, 0.0f };
    camera.fovy = 60.0f;
    camera.projection = CameraProjection.PERSPECTIVE;

    float heights[MAX_COLUMNS];
    Vector3 positions[MAX_COLUMNS];
    Color colors[MAX_COLUMNS];

    for (int i = 0; i < MAX_COLUMNS; i++) {
        heights[i] = (float)get_random_value (1, 12);
        positions[i] = { (float)get_random_value (-15, 15), heights[i] / 2.0f, (float)get_random_value (-15, 15) };
        colors[i] = { (uchar)get_random_value (20, 255), (uchar)get_random_value (10, 55), 30, 255 };
    }

    set_target_fps (60);

    // Main game loop
    while (!window_should_close ()) {
        update_camera (camera, CameraMode.FIRST_PERSON);

        begin_drawing ();

            clear_background (RAYWHITE);

            begin_mode_3D (camera);

                draw_plane ({ 0.0f, 0.0f, 0.0f }, { 32.0f, 32.0f }, { 200, 200, 200, 255 });
                draw_cube ({ -16.0f, 2.5f, 0.0f }, 1.0f, 5.0f, 32.0f, BLUE);
                draw_cube ({ 16.0f, 2.5f, 0.0f }, 1.0f, 5.0f, 32.0f, LIME);
                draw_cube ({ 0.0f, 2.5f, 16.0f }, 32.0f, 5.0f, 1.0f, GOLD);

                // Draw some cubes around
                for (int i = 0; i < MAX_COLUMNS; i++) {
                    draw_cube (positions[i], 2.0f, heights[i], 2.0f, colors[i]);
                    draw_cube_wires (positions[i], 2.0f, heights[i], 2.0f, MAROON);
                }

            end_mode_3D ();

            draw_rectangle ( 10, 10, 220, 70, fade (SKYBLUE, 0.5f));
            draw_rectangle_lines ( 10, 10, 220, 70, BLUE);

            draw_text ("First person camera default controls:", 20, 20, 10, BLACK);
            draw_text ("- Move with keys: W, A, S, D", 40, 40, 10, DARKGRAY);
            draw_text ("- Mouse move to look around", 40, 60, 10, DARKGRAY);

        end_drawing ();
    }

    close_window ();

    return 0;
}
