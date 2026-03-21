using Raylib;

public static int main () {
    // Initialization
    //--------------------------------------------------------------------------------------
    const int SCREEN_WIDTH = 800;
    const int SCREEN_HEIGHT = 450;

    init_window (SCREEN_WIDTH, SCREEN_HEIGHT, "Vala raylib [core] example - basic window");

    set_target_fps (60); // Set our game to run at 60 frames-per-second
    //--------------------------------------------------------------------------------------

    // Main game loop
    while (!window_should_close ()) { // Detect window close button or ESC key
        // Update
        //----------------------------------------------------------------------------------

        // Update your variables here

        //----------------------------------------------------------------------------------

        // Draw
        //----------------------------------------------------------------------------------
        begin_drawing ();
        {
            clear_background (RAYWHITE);
            draw_text ("Congrats! You created your first window!", 190, 200, 20, LIGHTGRAY);
        }
        end_drawing();
        //----------------------------------------------------------------------------------
    }

    // De-Initialization
    //--------------------------------------------------------------------------------------
    close_window(); // Close window and OpenGL context
    //--------------------------------------------------------------------------------------
    return 0;
}
