[CCode (cprefix = "", cheader_filename = "rini.h")]
namespace Rini {
    [CCode (cname = "RINI_VERSION")]
    public const string VERSION;

    // ----------------------------------------------------------------------------------
    // Defines and Macros
    // ----------------------------------------------------------------------------------
    [CCode (cname = "RINI_MAX_LINE_SIZE")]
    public const int MAX_LINE_SIZE;

    [CCode (cname = "RINI_MAX_KEY_SIZE")]
    public const int MAX_KEY_SIZE;

    [CCode (cname = "RINI_MAX_TEXT_SIZE")]
    public const int MAX_TEXT_SIZE;

    [CCode (cname = "RINI_MAX_DESC_SIZE")]
    public const int MAX_DESC_SIZE;

    [CCode (cname = "RINI_MAX_VALUE_CAPACITY")]
    public const int MAX_VALUE_CAPACITY;

    [CCode (cname = "RINI_VALUE_DELIMITER")]
    public const char VALUE_DELIMITER;

    [CCode (cname = "RINI_LINE_COMMENT_DELIMITER")]
    public const char LINE_COMMENT_DELIMITER;

    [CCode (cname = "RINI_VALUE_COMMENTS_DELIMITER")]
    public const char VALUE_COMMENTS_DELIMITER;

    [CCode (cname = "RINI_LINE_SECTION_DELIMITER")]
    public const char LINE_SECTION_DELIMITER;

    // ----------------------------------------------------------------------------------
    // Types and Structures Definition
    // ----------------------------------------------------------------------------------
    [CCode (cname = "rini_value")]
    public struct RiniValue {
        public char key[MAX_KEY_SIZE]; // Config value key identifier
        public char text[MAX_TEXT_SIZE]; // Config value text
        public char desc[MAX_DESC_SIZE]; // Config value description
    }

    [CCode (cname = "rini_data")]
    public struct RiniData {
        public RiniValue[] values; // Config values array
        public uint count; // Config values count
        public uint capacity; // Config values capacity
    }

    // ------------------------------------------------------------------------------------
    // Functions declaration
    // ------------------------------------------------------------------------------------
    [CCode (cname = "rini_load")]
    public static RiniData load (string filename); // Load config from file (*.ini) or create a new config object (pass NULL)

    [CCode (cname = "rini_load_from_memory")]
    public static RiniData rini_load_from_memory (string text);  // Load data from text buffer

    [CCode (cname = "rini_save")]
    public static void save (RiniData data, string file_name); // Save config to file, with custom header

    [CCode (cname = "rini_save_to_memory", array_null_terminated = true)]
    public static uint8[] save_to_memory (RiniData data); // Save data to text buffer ('\0' EOL)

    [CCode (cname = "rini_unload")]
    public static void unload (RiniData data); // Unload config data from memory

    [CCode (cname = "rini_get_value")]
    public static int get_value (RiniData data, string key); // Get config value int for provided key, returns -1 if not found

    [CCode (cname = "rini_get_value_text")]
    public static string get_value_text (RiniData data, string key); // Get config value text for provided key

    [CCode (cname = "rini_get_value_description")]
    public static string get_value_description (RiniData data, string key); // Get config value description for provided key

    [CCode (cname = "rini_get_value_fallback")]
    public static int get_value_fallback (RiniData data, string key, int fallback); // Get value for provided key with default value fallback if not found or not valid

    [CCode (cname = "rini_get_value_text_fallback")]
    public static string get_value_text_fallback (RiniData data,string key, string fallback); // Get value text for provided key with fallback if not found or not valid

    [CCode (cname = "rini_set_comment_line")]
    public static int set_comment_line (RiniData data, string comment); // Set comment line

    // Set value int/text and description for existing key or create a new entry
    // NOTE: When setting a text value, if id does not exist, a new entry is automatically created
    [CCode (cname = "rini_set_value")]
    public static int set_value (RiniData data, string key, int value, string description);

    [CCode (cname = "rini_set_value_text")]
    public static int set_value_text (RiniData data, string key, string text, string description);

    // Set value description for existing key
    // WARNING: Key must exist to add description, if a description exists, it is updated
    [CCode (cname = "rini_set_value_description")]
    public static int set_config_value_description (RiniData config, string key, string description);
}
