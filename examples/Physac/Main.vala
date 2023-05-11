using Raylib;
using Physac;

public const int WINDOW_WIDTH = 800;
public const int WINDOW_HEIGHT = 450;

public static int main (string[] args) {
    init_window (WINDOW_WIDTH, WINDOW_HEIGHT, "raylib [core] example - basic window");

    init_physics ();

    PhysicsBody floor = create_physics_body_rectangle ({ WINDOW_WIDTH / 2, WINDOW_HEIGHT }, 500.0f, 100.0f, 10);
    floor.enabled = false;

    PhysicsBody circle = create_physics_body_circle ({ WINDOW_WIDTH / 2, WINDOW_HEIGHT / 2 }, 45.0f, 10.0f);
    circle.enabled = false;

    set_target_fps (60);

    while (!window_should_close ()) {
        int body_count = get_physics_bodies_count ();

        for (int i = body_count - 1; i >= 0; i--) {
            PhysicsBody? body = get_physics_body (i);

            if ((body != null) && body.position.y > WINDOW_HEIGHT * 2) {
                destroy_physics_body (body);
            }
        }

        begin_drawing ();
            clear_background (RAYWHITE);

            draw_text ("Congrats! You created your first window!", 190, 200, 20, LIGHTGRAY);
        end_drawing ();
    }

    close_physics ();

    close_window ();

    return 0;
}
