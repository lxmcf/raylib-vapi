using Raylib;

[CCode (cprefix = "", cheader_filename = "raygui.h")]
namespace Raygui {
    [CCode (cname = "RAYGUI_VERSION_MAJOR")]
    public const string GUI_VERSION_MAJOR;

    [CCode (cname = "RAYGUI_VERSION_MINOR")]
    public const string GUI_VERSION_MINOR;

    [CCode (cname = "RAYGUI_VERSION_PATCH")]
    public const string GUI_VERSION_PATCH;

    [CCode (cname = "RAYGUI_VERSION")]
    public const string GUI_VERSION;

    [CCode (cname = "GUI_BUTTON_DOWN")]
    public static bool gui_button_down ();

    [CCode (cname = "GUI_BUTTON_DOWN_ALT")]
    public static bool gui_button_down_alt ();

    [CCode (cname = "GUI_BUTTON_PRESSED")]
    public static bool gui_button_pressed ();

    [CCode (cname = "GUI_BUTTON_RELEASED")]
    public static bool gui_button_released ();

    [CCode (cname = "GUI_SCROLL_DELTA")]
    public static float gui_scroll_delta ();

    [CCode (cname = "GUI_POINTER_POSITION")]
    public static Vector2 gui_pointer_position ();

    [CCode (cname = "GUI_KEY_DOWN")]
    public static bool gui_key_down (KeyboardKey key);

    [CCode (cname = "GUI_KEY_PRESSED")]
    public static bool gui_key_pressed (KeyboardKey key);

    [CCode (cname = "GUI_INPUT_KEY")]
    public static char gui_input_key ();

    // Style property
    // NOTE: Used when exporting style as code for convenience
    [SimpleType]
    [CCode (cname = "GuiStyleProp", has_type_id = false)]
    public struct StyleProp {
        [CCode (cname = "controlId")]
        public ushort control_id;

        [CCode (cname = "propertyId")]
        public ushort property_id;

        [CCode (cname = "propertyValue")]
        public int property_value;
    } // StyleProp

    // RayGui control state
    [CCode (cname = "GuiState", cprefix = "STATE_", has_type_id = false)]
    public enum State {
        NORMAL,
        FOCUSED,
        PRESSED,
        DISABLED;
    } // State

    // RayGui control text alignment
    [CCode (cname = "GuiTextAlignment", cprefix = "TEXT_ALIGN_", has_type_id = false)]
    public enum TextAlignment {
        LEFT,
        CENTER,
        RIGHT
    } // TextAlignment

    // RayGui control text alignment vertical
    // NOTE: Text vertical position inside the text bounds
    [CCode (cname = "GuiTextAlignmentVertical", cprefix = "TEXT_ALIGN_", has_type_id = false)]
    public enum TextAlignmentVertical {
        TOP,
        MIDDLE,
        BOTTOM
    } // TextAlignmentVertical

    // RayGui control text wrap mode
    // NOTE: Useful for multiline text
    [CCode (cname = "GuiTextWrapMode", cprefix = "TEXT_WRAP_", has_type_id = false)]
    public enum TextWrapMode {
        NONE,
        CHAR,
        WORD
    } // TextWrapMode

    // RayGui controls
    [CCode (cname = "GuiControl", cprefix = "", has_type_id = false)]
    public enum Control {
        // Default -> populates to all controls when set
        DEFAULT,

        // Basic controls
        LABEL, // Used also for: LABELBUTTON
        BUTTON,
        TOGGLE, // Used also for: TOGGLEGROUP
        SLIDER, // Used also for: SLIDERBAR, TOGGLESLIDER
        [CCode (cname = "PROGRESSBAR")]
        PROGRESS_BAR,
        [CCode (cname = "CHECKBOX")]
        CHECK_BOX,
        [CCode (cname = "COMBOBOX")]
        COMBO_BOX,
        [CCode (cname = "DROPDOWNBOX")]
        DROPDOWN_BOX,
        [CCode (cname = "TEXTBOX")]
        TEXT_BOX, // Used also for: TEXTBOXMULTI
        [CCode (cname = "VALUEBOX")]
        VALUE_BOX,
        CONTROL11,
        [CCode (cname = "LISTVIEW")]
        LIST_VIEW,
        [CCode (cname = "COLORPICKER")]
        COLOR_PICKER,
        [CCode (cname = "SCROLLBAR")]
        SCROLL_BAR,
        [CCode (cname = "STATUSBAR")]
        STATUS_BAR
    } // Control

    // RayGui base properties for every control
    // NOTE: RAYGUI_MAX_PROPS_BASE properties (by default 16 properties)
    [CCode (cname = "GuiControlProperty", cprefix = "", has_type_id = false)]
    public enum ControlProperty {
        BORDER_COLOR_NORMAL,        // Control border color in STATE_NORMAL
        BASE_COLOR_NORMAL,          // Control base color in STATE_NORMAL
        TEXT_COLOR_NORMAL,          // Control text color in STATE_NORMAL
        BORDER_COLOR_FOCUSED,       // Control border color in STATE_FOCUSED
        BASE_COLOR_FOCUSED,         // Control base color in STATE_FOCUSED
        TEXT_COLOR_FOCUSED,         // Control text color in STATE_FOCUSED
        BORDER_COLOR_PRESSED,       // Control border color in STATE_PRESSED
        BASE_COLOR_PRESSED,         // Control base color in STATE_PRESSED
        TEXT_COLOR_PRESSED,         // Control text color in STATE_PRESSED
        BORDER_COLOR_DISABLED,      // Control border color in STATE_DISABLED
        BASE_COLOR_DISABLED,        // Control base color in STATE_DISABLED
        TEXT_COLOR_DISABLED,        // Control text color in STATE_DISABLED
        BORDER_WIDTH,               // Control border size, 0 for no border
        TEXT_PADDING,               // Control text padding, not considering border
        TEXT_ALIGNMENT,             // Control text horizontal alignment inside control text bound (after border and padding)
    } // ControlProperty

    // RayGui extended properties depend on control
    // NOTE: RAYGUI_MAX_PROPS_EXTENDED properties (by default, max 8 properties)
    //----------------------------------------------------------------------------------
    // DEFAULT extended properties
    // NOTE: Those properties are common to all controls or global
    // WARNING: Only 8 slots vailable for those properties by default
    [CCode (cname = "GuiDefaultProperty", cprefix = "", has_type_id = false)]
    public enum DefaultProperty {
        TEXT_SIZE,             // Text size (glyphs max height)
        TEXT_SPACING,               // Text spacing between glyphs
        LINE_COLOR,                 // Line control color
        BACKGROUND_COLOR,           // Background color
        TEXT_LINE_SPACING,          // Text spacing between lines
        TEXT_ALIGNMENT_VERTICAL,    // Text vertical alignment inside text bounds (after border and padding)
        TEXT_WRAP_MODE              // Text wrap-mode inside text bounds
    } // DefaultProperty

    // Toggle/ToggleGroup
    [CCode (cname = "GuiToggleProperty", cprefix = "", has_type_id = false)]
    public enum ToggleProperty {
        GROUP_PADDING,              // ToggleGroup separation between toggles
    } // ToggleProperty

    // Slider/SliderBar
    [CCode (cname = "GuiSliderProperty", cprefix = "", has_type_id = false)]
    public enum SliderProperty {
        SLIDER_WIDTH,               // Slider size of internal bar
        SLIDER_PADDING              // Slider/SliderBar internal bar padding
    } // SliderProperty

    // ProgressBar
    [CCode (cname = "GuiProgressBarProperty", cprefix = "", has_type_id = false)]
    public enum ProgressBarProperty {
        PROGRESS_PADDING,           // ProgressBar internal padding
        PROGRESS_SIDE,              // ProgressBar increment side: 0-left->right, 1-right-left
    } // ProgressBarProperty

    // ScrollBar
    [CCode (cname = "GuiScrollBarProperty", cprefix = "", has_type_id = false)]
    public enum ScrollBarProperty {
        ARROWS_SIZE,                // ScrollBar arrows size
        ARROWS_VISIBLE,             // ScrollBar arrows visible
        SCROLL_SLIDER_PADDING,      // ScrollBar slider internal padding
        SCROLL_SLIDER_SIZE,         // ScrollBar slider size
        SCROLL_PADDING,             // ScrollBar scroll padding from arrows
        SCROLL_SPEED,               // ScrollBar scrolling speed
    } // ScrollBarProperty

    // CheckBox
    [CCode (cname = "GuiCheckBoxProperty", cprefix = "", has_type_id = false)]
    public enum GuiCheckBoxProperty {
        CHECK_PADDING               // CheckBox internal check padding
    } // GuiCheckBoxProperty

    // ComboBox
    [CCode (cname = "GuiComboBoxProperty", has_type_id = false)]
    public enum ComboBoxProperty {
        COMBO_BUTTON_WIDTH ,        // ComboBox right button width
        COMBO_BUTTON_SPACING        // ComboBox button separation
    } //ComboBoxProperty

    // DropdownBox
    [CCode (cname = "GuiDropdownBoxProperty", cprefix = "", has_type_id = false)]
    public enum DropdownBoxProperty {
        ARROW_PADDING,              // DropdownBox arrow separation from border and items
        DROPDOWN_ITEMS_SPACING,     // DropdownBox items separation
        DROPDOWN_ARROW_HIDDEN,      // DropdownBox arrow hidden
        DROPDOWN_ROLL_UP            // DropdownBox roll up flag (default rolls down)
    } // DropdownBoxProperty

    // TextBox/TextBoxMulti/ValueBox/Spinner
    [CCode (cname = "GuiTextBoxProperty", cprefix = "", has_type_id = false)]
    public enum TextBoxProperty {
        TEXT_READONLY,              // TextBox in read-only mode: 0-text editable, 1-text no-editable
    } // TextBoxProperty

    // ValueBox/Spinner
    [CCode (cname = "GuiValueBoxProperty", cprefix = "", has_type_id = false)]
    public enum ValueBoxProperty {
        SPINNER_BUTTON_WIDTH,       // Spinner left/right buttons width
        SPINNER_BUTTON_SPACING,     // Spinner buttons separation
    } // ValueBoxProperty

    // ListView
    [CCode (cname = "GuiListViewProperty", cprefix = "", has_type_id = false)]
    public enum ListViewProperty {
        LIST_ITEMS_HEIGHT,          // ListView items height
        LIST_ITEMS_SPACING,         // ListView items separation
        SCROLLBAR_WIDTH,            // ListView scrollbar size (usually width)
        SCROLLBAR_SIDE,             // ListView scrollbar side (0-SCROLLBAR_LEFT_SIDE, 1-SCROLLBAR_RIGHT_SIDE)
        LIST_ITEMS_BORDER_NORMAL,   // ListView items border enabled in normal state
        LIST_ITEMS_BORDER_WIDTH     // ListView items border width
    } // ListViewProperty

    // ColorPicker
    [CCode (cname = "GuiControlProperty", cprefix = "", has_type_id = false)]
    public enum ColorPickerProperty {
        COLOR_SELECTOR_SIZE,
        HUEBAR_WIDTH,               // ColorPicker right hue bar width
        HUEBAR_PADDING,             // ColorPicker right hue bar separation from panel
        HUEBAR_SELECTOR_HEIGHT,     // ColorPicker right hue bar selector height
        HUEBAR_SELECTOR_OVERFLOW    // ColorPicker right hue bar selector overflow
    } // ColorPickerProperty

    [CCode (cname = "SCROLLBAR_LEFT_SIDE")]
    public const int SCROLLBAR_LEFT_SIDE;

    [CCode (cname = "SCROLLBAR_RIGHT_SIDE")]
    public const int SCROLLBAR_RIGHT_SIDE;

    // Global gui state control functions
    [CCode (cname = "GuiEnable")]
    public static void gui_enable (); // Enable gui controls (global state)

    [CCode (cname = "GuiDisable")]
    public static void gui_disable (); // Disable gui controls (global state)

    [CCode (cname = "GuiLock")]
    public static void gui_lock (); // Lock gui controls (global state)

    [CCode (cname = "GuiUnlock")]
    public static void gui_unlock (); // Unlock gui controls (global state)

    [CCode (cname = "GuiIsLocked")]
    public static bool gui_is_locked (); // Check if gui is locked (global state)

    [CCode (cname = "GuiSetAlpha")]
    public static void gui_set_alpha (float alpha); // Set gui controls alpha (global state), alpha goes from 0.0f to 1.0f

    [CCode (cname = "GuiSetState")]
    public static void gui_set_state (State state); // Set gui state (global state)

    [CCode (cname = "GuiGetState")]
    public static State gui_get_state (); // Get gui state (global state)

    // Font set/get functions
    [CCode (cname = "GuiSetFont")]
    public static void gui_set_font (Font font); // Set gui custom font (global state)

    [CCode (cname = "GuiGetFont")]
    public static Font gui_get_font (); // Get gui custom font (global state)

    // Style set/get functions
    [CCode (cname = "GuiSetStyle")]
    public static void gui_set_style (Control control, ControlProperty property, int val); // Set one style property

    [CCode (cname = "GuiGetStyle")]
    public static int gui_get_style (Control control, ControlProperty property); // Get one style property

    // Styles loading functions
    [CCode (cname = "GuiLoadStyle")]
    public static void gui_load_style (string fileName); // Load style file over global style variable (.rgs)

    [CCode (cname = "GuiLoadStyleDefault")]
    public static void gui_load_style_default (); // Load style default over global style

    // Tooltips management functions
    [CCode (cname = "GuiEnableTooltip")]
    public static void gui_enable_tooltip (); // Enable gui tooltips (global state)

    [CCode (cname = "GuiDisableTooltip")]
    public static void gui_disable_tooltip (); // Disable gui tooltips (global state)

    [CCode (cname = "GuiSetTooltip")]
    public static void gui_set_tooltip (string tooltip); // Set tooltip string

    // Icons functionality
    [CCode (cname = "GuiIconText")]
    public static unowned string gui_icon_text (IconName icon_id, string text); // Get text with icon id prepended (if supported)

    [CCode (cname = "GuiSetIconScale")]
    public static void gui_set_icon_scale (int scale); // Set default icon drawing size

    [CCode (cname = "GuiGetIcons", array_length = false)]
    public static unowned uint[] gui_get_icons (); // Get raygui icons data pointer

    [CCode (cname = "GuiLoadIcons", array_length = false)]
    public static unowned uint[] gui_load_icons (string file_name, bool load_icons_name); // Load raygui icons file (.rgi) into internal icons data

    [CCode (cname = "GuiDrawIcon")]
    public static void gui_draw_icon (IconName icon_id, int pos_x, int pos_y, int pixel_size, Color color); // Draw icon using pixel size at specified position

    // Utility functions
    [CCode (cname = "GuiGetTextWidth")]
    public static int gui_get_text_width (string text); // Get text width considering gui style and icon size (if required)

    // Controls
    //----------------------------------------------------------------------------------------------------------
    // Container/separator controls, useful for controls organization
    [CCode (cname = "GuiWindowBox")]
    public static int gui_window_box (Rectangle bounds, string title); // Window Box control, shows a window that can be closed

    [CCode (cname = "GuiGroupBox")]
    public static int gui_group_box (Rectangle bounds, string text); // Group Box control with text name

    [CCode (cname = "GuiLine")]
    public static int gui_line (Rectangle bounds, string text); // Line separator control, could contain text

    [CCode (cname = "GuiPanel")]
    public static int gui_panel (Rectangle bounds, string text); // Panel control, useful to group controls

    [CCode (cname = "GuiTabBar")]
    public static int gui_tab_bar (Rectangle bounds, string[] text, [CCode (array_length_pos = 1.1)] ref int[] active); // Tab Bar control, returns TAB to be closed or -1

    [CCode (cname = "GuiScrollPanel")]
    public static int gui_scroll_panel (Rectangle bounds, string? text, Rectangle content, ref Vector2 scroll, ref Rectangle view); // Scroll Panel control

    // Basic controls set
    [CCode (cname = "GuiLabel")]
    public static int gui_label (Rectangle bounds, string text); // Label control

    [CCode (cname = "GuiButton")]
    public static int gui_button (Rectangle bounds, string? text); // Button control, returns true when clicked

    [CCode (cname = "GuiLabelButton")]
    public static int gui_label_button (Rectangle bounds, string? text); // Label button control, returns true when clicked

    [CCode (cname = "GuiToggle")]
    public static int gui_toggle (Rectangle bounds, string? text, ref bool active); // Toggle Button control

    [CCode (cname = "GuiToggleGroup")]
    public static int gui_toggle_group (Rectangle bounds, string? text, ref int active); // Toggle Group control

    [CCode (cname = "GuiToggleSlider")]
    public static int gui_toggle_slider (Rectangle bounds, string? text, ref int active); // Toggle Slider control

    [CCode (cname = "GuiCheckBox")]
    public static int gui_check_box( Rectangle bounds, string? text, ref bool checked); // Check Box control, returns true when active

    [CCode (cname = "GuiComboBox")]
    public static int gui_combo_box (Rectangle bounds, string? text, ref int active); // Combo Box control

    [CCode (cname = "GuiDropdownBox")]
    public static int gui_dropdown_box(Rectangle bounds, string? text, ref int active, bool edit_mode); // Dropdown Box control

    [CCode (cname = "GuiSpinner")]
    public static int gui_spinner (Rectangle bounds, string? text, ref int value, int min_value, int max_value, bool edit_mode); // Spinner control

    [CCode (cname = "GuiValueBox")]
    public static int gui_value_box (Rectangle bounds, string? text, ref int value, int min_value, int max_value, bool edit_mode); // Value Box control, updates input text with numbers

    [CCode (cname = "GuiValueBoxFloat")]
    public static int gui_value_box_float (Rectangle bounds, string? text, ref string text_value, ref float value, bool edit_mode); // Value box control for float values

    [CCode (cname = "GuiTextBox")]
    public static int gui_text_box (Rectangle bounds, string text, int text_size, bool edit_mode); // Text Box control, updates input text

    [CCode (cname = "GuiSlider")]
    public static int gui_slider (Rectangle bounds, string? text_left, string? text_right, ref float value, float min_value, float max_value); // Slider control

    [CCode (cname = "GuiSliderBar")]
    public static int gui_slider_bar (Rectangle bounds, string? text_left, string? text_right, ref float value, float min_value, float max_value); // Slider Bar control

    [CCode (cname = "GuiProgressBar")]
    public static int gui_progress_bar (Rectangle bounds, string? text_left, string? text_right, ref float value, float min_value, float max_value); // Progress Bar control

    [CCode (cname = "GuiStatusBar")]
    public static int gui_status_bar (Rectangle bounds, string text); // Status Bar control, shows info text

    [CCode (cname = "GuiDummyRec")]
    public static int gui_dummy_rectangle (Rectangle bounds, string? text); // Dummy control for placeholders

    [CCode (cname = "GuiGrid")]
    public static int gui_grid (Rectangle bounds, string? text, float spacing, int subdivs, ref Vector2 mouse_cell); // Grid control

    // Advance controls set
    [CCode (cname = "GuiListView")]
    public static int gui_list_view (Rectangle bounds, string text, ref int scroll_index, ref int active);  // List View control

    [CCode (cname = "GuiListViewEx")]
    public static int gui_list_view_ext (Rectangle bounds, string[] text, ref int scroll_index, ref int active, ref int focus); // List View with extended parameters

    [CCode (cname = "GuiMessageBox")]
    public static int gui_message_box (Rectangle bounds, string title, string message, string buttons); // Message Box control, displays a message

    [CCode (cname = "GuiTextInputBox")]
    public static int gui_text_input_box (Rectangle bounds, string? title, string? message, string buttons, string text, int text_max_size, bool? secret_view_active); // Text Input Box control, ask for text, supports secret

    [CCode (cname = "GuiColorPicker")]
    public static int gui_color_picker (Rectangle bounds, string? text, ref Color color); // Color Picker control (multiple color controls)

    [CCode (cname = "GuiColorPanel")]
    public static int gui_color_panel (Rectangle bounds, string? text, ref Color color); // Color Panel control

    [CCode (cname = "GuiColorBarAlpha")]
    public static int gui_color_bar_alpha (Rectangle bounds, string? text, ref float alpha); // Color Bar Alpha control

    [CCode (cname = "GuiColorBarHue")]
    public static int gui_color_bar_hue (Rectangle bounds, string? text, ref float val); // Color Bar Hue control

    [CCode (cname = "GuiColorPickerHSV")]
    public static int gui_color_picker_hsv (Rectangle bounds, string? text, ref Vector3 color_hsv); // Color Picker control that avoids conversion to RGB on each call (multiple color controls)

    [CCode (cname = "GuiColorPanelHSV")]
    public static int gui_color_panel_hsv (Rectangle bounds, string text, ref Vector3 color_hsv); // Color Panel control that updates Hue-Saturation-Value color value, used by GuiColorPickerHSV()
    //----------------------------------------------------------------------------------------------------------

    //----------------------------------------------------------------------------------
    // Icons enumeration
    //----------------------------------------------------------------------------------
    [CCode (cname = "int", cprefix = "ICON_", has_type_id = false)]
    public enum IconName {
        NONE,
        FOLDER_FILE_OPEN,
        FILE_SAVE_CLASSIC,
        FOLDER_OPEN,
        FOLDER_SAVE,
        FILE_OPEN,
        FILE_SAVE,
        FILE_EXPORT,
        FILE_ADD,
        FILE_DELETE,
        FILETYPE_TEXT,
        FILETYPE_AUDIO,
        FILETYPE_IMAGE,
        FILETYPE_PLAY,
        FILETYPE_VIDEO,
        FILETYPE_INFO,
        FILE_COPY,
        FILE_CUT,
        FILE_PASTE,
        CURSOR_HAND,
        CURSOR_POINTER,
        CURSOR_CLASSIC,
        PENCIL,
        PENCIL_BIG,
        BRUSH_CLASSIC,
        BRUSH_PAINTER,
        WATER_DROP,
        COLOR_PICKER,
        RUBBER,
        COLOR_BUCKET,
        TEXT_T,
        TEXT_A,
        SCALE,
        RESIZE,
        FILTER_POINT,
        FILTER_BILINEAR,
        CROP,
        CROP_ALPHA,
        SQUARE_TOGGLE,
        SYMMETRY,
        SYMMETRY_HORIZONTAL,
        SYMMETRY_VERTICAL,
        LENS,
        LENS_BIG,
        EYE_ON,
        EYE_OFF,
        FILTER_TOP,
        FILTER,
        TARGET_POINT,
        TARGET_SMALL,
        TARGET_BIG,
        TARGET_MOVE,
        CURSOR_MOVE,
        CURSOR_SCALE,
        CURSOR_SCALE_RIGHT,
        CURSOR_SCALE_LEFT,
        UNDO,
        REDO,
        REREDO,
        MUTATE,
        ROTATE,
        REPEAT,
        SHUFFLE,
        EMPTYBOX,
        TARGET,
        TARGET_SMALL_FILL,
        TARGET_BIG_FILL,
        TARGET_MOVE_FILL,
        CURSOR_MOVE_FILL,
        CURSOR_SCALE_FILL,
        CURSOR_SCALE_RIGHT_FILL,
        CURSOR_SCALE_LEFT_FILL,
        UNDO_FILL,
        REDO_FILL,
        REREDO_FILL,
        MUTATE_FILL,
        ROTATE_FILL,
        REPEAT_FILL,
        SHUFFLE_FILL,
        EMPTYBOX_SMALL,
        BOX,
        BOX_TOP,
        BOX_TOP_RIGHT,
        BOX_RIGHT,
        BOX_BOTTOM_RIGHT,
        BOX_BOTTOM,
        BOX_BOTTOM_LEFT,
        BOX_LEFT,
        BOX_TOP_LEFT,
        BOX_CENTER,
        BOX_CIRCLE_MASK,
        POT,
        ALPHA_MULTIPLY,
        ALPHA_CLEAR,
        DITHERING,
        MIPMAPS,
        BOX_GRID,
        GRID,
        BOX_CORNERS_SMALL,
        BOX_CORNERS_BIG,
        FOUR_BOXES,
        GRID_FILL,
        BOX_MULTISIZE,
        ZOOM_SMALL,
        ZOOM_MEDIUM,
        ZOOM_BIG,
        ZOOM_ALL,
        ZOOM_CENTER,
        BOX_DOTS_SMALL,
        BOX_DOTS_BIG,
        BOX_CONCENTRIC,
        BOX_GRID_BIG,
        OK_TICK,
        CROSS,
        ARROW_LEFT,
        ARROW_RIGHT,
        ARROW_DOWN,
        ARROW_UP,
        ARROW_LEFT_FILL,
        ARROW_RIGHT_FILL,
        ARROW_DOWN_FILL,
        ARROW_UP_FILL,
        AUDIO,
        FX,
        WAVE,
        WAVE_SINUS,
        WAVE_SQUARE,
        WAVE_TRIANGULAR,
        CROSS_SMALL,
        PLAYER_PREVIOUS,
        PLAYER_PLAY_BACK,
        PLAYER_PLAY,
        PLAYER_PAUSE,
        PLAYER_STOP,
        PLAYER_NEXT,
        PLAYER_RECORD,
        MAGNET,
        LOCK_CLOSE,
        LOCK_OPEN,
        CLOCK,
        TOOLS,
        GEAR,
        GEAR_BIG,
        BIN,
        HAND_POINTER,
        LASER,
        COIN,
        EXPLOSION,
        1UP,
        PLAYER,
        PLAYER_JUMP,
        KEY,
        DEMON,
        TEXT_POPUP,
        GEAR_EX,
        CRACK,
        CRACK_POINTS,
        STAR,
        DOOR,
        EXIT,
        MODE_2D,
        MODE_3D,
        CUBE,
        CUBE_FACE_TOP,
        CUBE_FACE_LEFT,
        CUBE_FACE_FRONT,
        CUBE_FACE_BOTTOM,
        CUBE_FACE_RIGHT,
        CUBE_FACE_BACK,
        CAMERA,
        SPECIAL,
        LINK_NET,
        LINK_BOXES,
        LINK_MULTI,
        LINK,
        LINK_BROKE,
        TEXT_NOTES,
        NOTEBOOK,
        SUITCASE,
        SUITCASE_ZIP,
        MAILBOX,
        MONITOR,
        PRINTER,
        PHOTO_CAMERA,
        PHOTO_CAMERA_FLASH,
        HOUSE,
        HEART,
        CORNER,
        VERTICAL_BARS,
        VERTICAL_BARS_FILL,
        LIFE_BARS,
        INFO,
        CROSSLINE,
        HELP,
        FILETYPE_ALPHA,
        FILETYPE_HOME,
        LAYERS_VISIBLE,
        LAYERS,
        WINDOW,
        HIDPI,
        FILETYPE_BINARY,
        HEX,
        SHIELD,
        FILE_NEW,
        FOLDER_ADD,
        ALARM,
        CPU,
        ROM,
        STEP_OVER,
        STEP_INTO,
        STEP_OUT,
        RESTART,
        BREAKPOINT_ON,
        BREAKPOINT_OFF,
        BURGER_MENU,
        CASE_SENSITIVE,
        REG_EXP,
        FOLDER,
        FILE,
        SAND_TIMER,
        WARNING,
        HELP_BOX,
        INFO_BOX,
        PRIORITY,
        LAYERS_ISO,
        LAYERS2,
        MLAYERS,
        MAPS,
        HOT,
        LABEL,
        NAME_ID,
        SLICING,
        MANUAL_CONTROL,
        COLLISION,
        CIRCLE_ADD,
        CIRCLE_ADD_FILL,
        CIRCLE_WARNING,
        CIRCLE_WARNING_FILL,
        BOX_MORE,
        BOX_MORE_FILL,
        BOX_MINUS,
        BOX_MINUS_FILL,
        UNION,
        INTERSECTION,
        DIFFERENCE,
        SPHERE,
        CYLINDER,
        CONE,
        ELLIPSOID,
        CAPSULE,
        [CCode (cname = "ICON_250")]
        I_250,
        [CCode (cname = "ICON_251")]
        I_251,
        [CCode (cname = "ICON_252")]
        I_252,
        [CCode (cname = "ICON_253")]
        I_253,
        [CCode (cname = "ICON_254")]
        I_254,
        [CCode (cname = "ICON_255")]
        I_255
    } // GuiIconName
}
