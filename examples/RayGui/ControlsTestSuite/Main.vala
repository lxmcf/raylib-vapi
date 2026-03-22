using Raylib;
using Raygui;

public static int main () {
    // Initialization
    //--------------------------------------------------------------------------------------
    const int SCREEN_WIDTH = 960;
    const int SCREEN_HEIGHT = 560;

    init_window (SCREEN_WIDTH, SCREEN_HEIGHT, "Vala raygui - controls test suite");
    set_exit_key (0);

    // GUI controls initialization
    //----------------------------------------------------------------------------------
    bool force_squared_checked = false;

    int spinner_001_value = 0;
    bool spinner_edit_mode = false;

    int value_box_002_value = 0;
    bool value_box_edit_mode = false;

    string text_box_text = "Text box";
    bool text_box_edit_mode = false;

    string text_box_multi_text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor "
                                 + "incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud "
                                 + "exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n\nDuis aute "
                                 + "irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla "
                                 + "pariatur."
                                 + "\n\nThisisastringlongerthanexpectedwithoutspacestotestcharbreaksforthosecases,"
                                 + "checkingifworkingasexpected.\n\nExcepteur sint occaecat cupidatat non proident, "
                                 + "sunt in culpa qui officia deserunt mollit anim id est laborum.";
    bool text_box_multi_edit_mode = false;

    int visual_style_active = 0;

    int dropdown_box_000_active = 0;
    bool dropdown_000_edit_mode = false;

    int dropdown_box_001_active = 0;
    bool dropdown_001_edit_mode = false;

    int list_view_scroll_index = 0;
    int list_view_active = -1;

    int list_view_ext_scroll_index = 0;
    int list_view_ext_active = 2;
    int list_view_ext_focus = -1;
    string[] list_view_ext_list = { "This", "is", "a", "list view", "with",
                                    "disable", "elements", "amazing!" };

    int toggle_group_active = 0;
    int toggle_slider_active = 0;

    Color color_picker_value = RED;

    float slider_value = 50.0f;
    float slider_bar_value = 60;
    float progress_value = 0.1f;

    Vector2 view_scroll = { 0, 0 };

    float alpha_value = 0.5f;

    string status_bar_text = "This is a status bar";
    //----------------------------------------------------------------------------------

    bool show_message_box = false;

    string text_input = "";
    string text_input_file_name = "";
    bool show_text_input_box = false;
    float alpha = 1.0f;

    bool exit_window = false;

    set_target_fps (60);
    //----------------------------------------------------------------------------------
    while (!exit_window) {
        // Update
        //----------------------------------------------------------------------------------
        exit_window = window_should_close ();

        if (is_key_pressed (KeyboardKey.ESCAPE)) {
            show_message_box = !show_message_box;
        }

        if (is_key_down (KeyboardKey.LEFT_CONTROL) && is_key_pressed (KeyboardKey.S)) {
            show_text_input_box = !show_text_input_box;
        }

        if (is_file_dropped ()) {
            FilePathList dropped_files = load_dropped_files ();
            if ((dropped_files.paths.length > 0) && is_file_extension (dropped_files.paths[0], ".rgs")) {
                gui_load_style (dropped_files.paths[0]);
            }
            unload_dropped_files (dropped_files);// Clear internal buffers
        }

        //alpha -= 0.002f;
        if (alpha < 0.0f) { alpha = 0.0f; }
        if (is_key_pressed (KeyboardKey.SPACE)) { alpha = 1.0f; }

        gui_set_alpha (alpha);

        //progress_value += 0.002f;
        if (is_key_pressed (KeyboardKey.LEFT)) {
            progress_value -= 0.1f;
        } else if (is_key_pressed (KeyboardKey.RIGHT)) {
            progress_value += 0.1f;
        }
        progress_value = Raymath.clamp (progress_value, 0.0f, 1.0f);

        gui_load_style_default ();
        begin_drawing ();
        {
            var bg_color_style = gui_get_style (Control.DEFAULT,
                                                (ControlProperty) DefaultProperty.BACKGROUND_COLOR);
            clear_background (get_color (bg_color_style));

            // First GUI column
            // Checkbox
            gui_check_box ({ 25, 108, 15, 15 }, "FORCE CHECK!", ref force_squared_checked);

            // Spinner box
            gui_set_style (Control.TEXT_BOX, ControlProperty.TEXT_ALIGNMENT, (int) TextAlignment.CENTER);
            var res = gui_spinner ({ 25, 135, 125, 30 }, null, ref spinner_001_value, 0, 100, spinner_edit_mode);
            if (res == 1) {
                spinner_edit_mode = !spinner_edit_mode;
            }
            // Value box
            res = gui_value_box ({ 25, 175, 125, 30 }, null, ref value_box_002_value, 0, 100, value_box_edit_mode);
            if (res == 1) {
                value_box_edit_mode = !value_box_edit_mode;
            }

            // Text box
            gui_set_style (Control.TEXT_BOX, ControlProperty.TEXT_ALIGNMENT, (int) TextAlignment.LEFT);
            res = gui_text_box ({ 25, 215, 125, 30 }, text_box_text, 64, text_box_edit_mode);
            if (res == 1) {
                text_box_edit_mode = !text_box_edit_mode;
            }

            // Button
            gui_set_style (Control.TEXT_BOX, ControlProperty.TEXT_ALIGNMENT, (int) TextAlignment.CENTER);
            res = gui_button ({ 25, 255, 125, 30 }, gui_icon_text (IconName.FILE_SAVE, "Save File"));
            if (res == 1) {
                show_text_input_box = true;
            }

            // Button states
            gui_group_box ({ 25, 310, 125, 150 }, "STATES");
            //lock ();
            gui_set_state (State.NORMAL);
            gui_button ({ 30, 320, 115, 30 }, "NORMAL");
            gui_set_state (State.FOCUSED);
            gui_button ({ 30, 355, 115, 30 }, "FOCUSED");
            gui_set_state (State.PRESSED);
            gui_button ({ 30, 390, 115, 30 }, "#15#PRESSED");
            gui_set_state (State.DISABLED);
            gui_button ({ 30, 425, 115, 30 }, "DISABLED");
            gui_set_state (State.NORMAL);
            //unlock ();

            // Combo Box
            gui_combo_box ({ 25, 480, 125, 30 },
                           "default;Jungle;Lavanda;Dark;Bluish;Cyber;Terminal;Candy;" +
                           "Cherry;Ashes;Enefete;Sunny;Amber;Genesis",
                           ref visual_style_active);

            // NOTE: GuiDropdownBox must draw after any other control that can be covered on unfolding
            if (dropdown_000_edit_mode || dropdown_001_edit_mode) {
                gui_unlock ();
            }
            if (show_text_input_box) {
                gui_lock (); // Stay locked
            }

            // Dropdown box 001
            gui_set_style (Control.DROPDOWN_BOX, ControlProperty.TEXT_PADDING, 4);
            gui_set_style (Control.DROPDOWN_BOX, ControlProperty.TEXT_ALIGNMENT, TextAlignment.LEFT);
            res = gui_dropdown_box ({ 25, 65, 125, 30 },
                                    "#01#ONE;#02#TWO;#03#THREE;#04#FOUR",
                                    ref dropdown_box_001_active,
                                    dropdown_001_edit_mode);
            if (res == 1) {
                dropdown_001_edit_mode = !dropdown_001_edit_mode;
            }

            // Dropdown box 000
            gui_set_style (Control.DROPDOWN_BOX, ControlProperty.TEXT_PADDING, 0);
            gui_set_style (Control.DROPDOWN_BOX, ControlProperty.TEXT_ALIGNMENT, TextAlignment.CENTER);
            res = gui_dropdown_box ({ 25, 25, 125, 30 },
                                   "ONE;TWO;THREE",
                                    ref dropdown_box_000_active,
                                    dropdown_000_edit_mode);
            if (res == 1) {
                dropdown_000_edit_mode = !dropdown_000_edit_mode;
            }

            // Second GUI column
            // List view
            //gui_set_style (Control.LIST_VIEW, ControlProperty.LIST_ITEMS_BORDER_NORMAL, 1);
            gui_list_view ({165, 25, 140, 124},
                           "Charmander;Bulbasaur;#18#Squirtel;Pikachu;Eevee;Pidgey",
                            ref list_view_scroll_index,
                            ref list_view_active);
            // List view extended
            gui_list_view_ext ({ 165, 162, 140, 184 },
                               list_view_ext_list,
                               ref list_view_ext_scroll_index,
                               ref list_view_ext_active, ref list_view_ext_focus);
            //gui_set_style (Control.LIST_VIEW, ControlProperty.LIST_ITEMS_BORDER_NORMAL, 0);

            // Toggle group
            gui_toggle_group ({ 165, 360, 140, 24 },
                              "#1#ONE\n#3#TWO\n#8#THREE\n#23#",
                              ref toggle_group_active);

            // Toggle Slider
            gui_set_style (Control.SLIDER, (ControlProperty) SliderProperty.SLIDER_PADDING, 2);
            gui_toggle_slider ({ 165, 480, 140, 30 }, "ON;OFF", ref toggle_slider_active);
            gui_set_style (Control.SLIDER, (ControlProperty) SliderProperty.SLIDER_PADDING, 0);

            // Color bar
            gui_color_bar_alpha ({ 320, 490, 200, 30 }, null, ref alpha_value);

            // Third GUI column
            // Panel
            gui_set_style (Control.DEFAULT, ControlProperty.TEXT_ALIGNMENT, TextAlignment.CENTER);
            gui_panel ({ 320, 25, 225, 140 }, "Panel Info");
            // Color picker
            gui_color_picker ({ 320, 185, 196, 192 }, null, ref color_picker_value);

            // Slider
            gui_slider ({ 355, 400, 165, 20 },
                        "TEST",
                        text_format ("%2.2f", slider_value),
                        ref slider_value,
                        -50,
                        100);
            // Slider bar
            gui_slider_bar ({ 320, 430, 200, 20 },
                            null,
                            text_format ("%i", (int)slider_bar_value),
                            ref slider_bar_value,
                            0,
                            100);

            // Progress bar
            gui_progress_bar ({ 320, 460, 200, 20 },
                              null,
                              text_format ("%i%%", (int) (progress_value * 100)),
                              ref progress_value,
                              0.0f,
                              1.0f);

            // Scroll panel
            // NOTE: View rectangle could be used to perform some scissor test
            Rectangle view = { 0 };
            gui_scroll_panel ({ 560, 25, 102, 354 },
                              null,
                              { 560, 25, 300, 1200 },
                              ref view_scroll,
                              ref view);

            Vector2 mouse_cell = { 0 };
            gui_grid ({ 560, 25 + 180 + 195, 100, 120 }, null, 20, 3, ref mouse_cell);

            gui_set_style (Control.DEFAULT,
                           (ControlProperty) DefaultProperty.TEXT_ALIGNMENT_VERTICAL,
                           TextAlignmentVertical.TOP);
            gui_set_style (Control.DEFAULT,
                           (ControlProperty) DefaultProperty.TEXT_WRAP_MODE,
                           TextWrapMode.WORD);
            res = gui_text_box ({ 678, 25, 258, 492 }, text_box_multi_text, 1024, text_box_multi_edit_mode);
            if (res == 1) {
                text_box_multi_edit_mode = !text_box_multi_edit_mode;
            }
            gui_set_style (Control.DEFAULT,
                           (ControlProperty) DefaultProperty.TEXT_ALIGNMENT_VERTICAL,
                           TextAlignmentVertical.MIDDLE);
            gui_set_style (Control.DEFAULT,
                           (ControlProperty) DefaultProperty.TEXT_WRAP_MODE,
                           TextWrapMode.NONE);

            gui_set_style (Control.DEFAULT, ControlProperty.TEXT_ALIGNMENT, TextAlignment.LEFT);
            gui_status_bar ({ 0, (float) get_screen_height () - 20, (float) get_screen_width (), 20 },
                            status_bar_text);
            gui_set_style (Control.DEFAULT, ControlProperty.TEXT_ALIGNMENT, TextAlignment.CENTER);

            // Elements outside columns
            if (show_message_box) {
                draw_rectangle (0, 0, get_screen_width (), get_screen_height (), color_alpha (RAYWHITE, 0.8f));
                Rectangle msg_box_rect = { (float) get_screen_width () / 2 - 125,
                                           (float) get_screen_height () / 2 - 50,
                                           250,
                                           100 };
                int result = gui_message_box (msg_box_rect,
                                              gui_icon_text (IconName.EXIT, "Close Window"),
                                              "Do you really want to exit?",
                                              "Yes;No");
                if ((result == 0) || (result == 2)) {
                    show_message_box = false;
                } else if (result == 1) {
                    exit_window = true;
                }
            }

            // Text input box
            if (show_text_input_box) {
                gui_unlock ();

                draw_rectangle (0, 0, get_screen_width (), get_screen_height (), color_alpha (RAYWHITE, 0.8f));
                Rectangle input_box_rect = { (float) get_screen_width () / 2 - 125,
                                             (float) get_screen_height () / 2 - 50,
                                             250,
                                             150 };
                int result = gui_text_input_box (input_box_rect,
                                                 gui_icon_text (IconName.FILE_SAVE, "Save file as:"),
                                                "Introduce output file name:",
                                                "Ok;Cancel",
                                                text_input,
                                                255, null);

                if (result == 1) {
                    text_input_file_name = text_input;
                    if (is_file_name_valid (text_input_file_name)) {
                        status_bar_text = "(Dummy message) File saved as: " + text_input_file_name;
                    } else {
                        status_bar_text = "(Dummy message) Couldn't save file: <Invalid filename>";
                    }
                    text_input = "";
                }

                if ((result == 0) || (result == 1) || (result == 2)) {
                    show_text_input_box = false;
                    text_input = "";
                }

            }
        }
        end_drawing ();
    }

    return 0;
}
