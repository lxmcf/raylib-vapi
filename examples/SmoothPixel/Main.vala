using Raylib;

public const int SCREEN_WIDTH = 800;
public const int SCREEN_HEIGHT = 450;

public const int VIRTUAL_SCREEN_WIDTH = 160;
public const int VIRTUAL_SCREEN_HEIGHT = 90;

const float VIRTUAL_RATIO = (float)SCREEN_WIDTH / (float)VIRTUAL_SCREEN_WIDTH;

public static int main () {
    init_window (SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [core] example - smooth pixel-perfect camera");

    Camera2D world_space_camera = { };
    world_space_camera.zoom = 1.0f;

    Camera2D screen_space_camera = { };
    screen_space_camera.zoom = 1.0f;

    RenderTexture2D target = load_render_texture (VIRTUAL_SCREEN_WIDTH, VIRTUAL_SCREEN_HEIGHT);

    Rectangle rec01 = { 70.0f, 35.0f, 20.0f, 20.0f };
    Rectangle rec02 = { 90.0f, 55.0f, 30.0f, 10.0f };
    Rectangle rec03 = { 80.0f, 65.0f, 15.0f, 25.0f };

    Rectangle source_rectangle = { 0.0f, 0.0f, target.texture.width, -target.texture.height };
    Rectangle destination_rectangle = { -VIRTUAL_RATIO, -VIRTUAL_RATIO, SCREEN_WIDTH + (VIRTUAL_RATIO * 2), SCREEN_HEIGHT + (VIRTUAL_RATIO * 2) };

    Vector2 origin = { 0.0f, 0.0f };

    float rotation = 0.0f;
    float time = 0.0f;

    float camera_x = 0.0f;
    float camera_y = 0.0f;

    set_target_fps (60);

    // Main game loop
    while (!window_should_close ()) {
        rotation += 60.0f * get_frame_time ();

        time = (float)get_time ();

        camera_x = (sinf (time) * 50.0f) - 10.0f;
        camera_y = cosf (time) * 30.0f;

        screen_space_camera.target = { camera_x, camera_y };

        world_space_camera.target.x = (int)screen_space_camera.target.x;
        screen_space_camera.target.x -= world_space_camera.target.x;
        screen_space_camera.target.x *= VIRTUAL_RATIO;

        world_space_camera.target.y = (int)screen_space_camera.target.y;
        screen_space_camera.target.y -= world_space_camera.target.y;
        screen_space_camera.target.y *= VIRTUAL_RATIO;

        begin_texture_mode (target);
            clear_background (RAYWHITE);

            begin_mode_2D (world_space_camera);
                draw_rectangle_pro (rec01, origin, rotation, BLACK);
                draw_rectangle_pro (rec02, origin, -rotation, RED);
                draw_rectangle_pro (rec03, origin, rotation + 45.0f, BLUE);
            end_mode_2D ();
        end_texture_mode();

        begin_drawing ();
            clear_background (RED);

            begin_mode_2D (screen_space_camera);
                draw_texture_pro (target.texture, source_rectangle, destination_rectangle, origin, 0.0f, WHITE);
            end_mode_2D ();

            draw_text (@"Screen resolution: $(SCREEN_WIDTH)x$(SCREEN_HEIGHT)", 10, 10, 20, DARKBLUE);
            draw_text (@"World resolution: $(VIRTUAL_SCREEN_WIDTH)x$(VIRTUAL_SCREEN_HEIGHT)", 10, 40, 20, DARKGREEN);
            draw_fps ( get_screen_width () - 95, 10);
        end_drawing ();
    }

    unload_render_texture (target);

    close_window ();

    return 0;
}
