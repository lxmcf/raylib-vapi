[Version (experimental = true)]
[CCode (cprefix = "", cheader_filename = "rini.h")]
namespace Rini {
    [CCode (cname = "RINI_VERSION")]
    public const string VERSION;

    //----------------------------------------------------------------------------------
    // Defines and Macros
    //----------------------------------------------------------------------------------
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


    //----------------------------------------------------------------------------------
    // Types and Structures Definition
    //----------------------------------------------------------------------------------
    [CCode (cname = "rini_config_value")]
    public struct ConfigValue {
        public char key[MAX_KEY_SIZE];    // Config value key identifier
        public char text[MAX_TEXT_SIZE];  // Config value text
        public char desc[MAX_DESC_SIZE];  // Config value description
    }

    [CCode (cname = "rini_config")]
    public struct RiniConfig {
        public ConfigValue[] values;      // Config values array
        public uint count;                // Config values count
        public uint capacity;             // Config values capacity
    }


    //------------------------------------------------------------------------------------
    // Functions declaration
    //------------------------------------------------------------------------------------
    [CCode (cname = "rini_load_config")]
    public static RiniConfig load_config (string filename);                                 // Load config from file (*.ini) or create a new config object (pass NULL)

    [CCode (cname = "rini_unload_config")]
    public static void unload_config (RiniConfig config);                                   // Unload config data from memory

    [CCode (cname = "rini_save_config")]
    public static void save_config (RiniConfig config, string filename, string header);     // Save config to file, with custom header


    [CCode (cname = "rini_get_config_value")]
    public static int get_config_value (RiniConfig config, string key);                     // Get config value int for provided key, returns -1 if not found

    [CCode (cname = "rini_get_config_value_text")]
    public static string get_config_value_text (RiniConfig config, string key);             // Get config value text for provided key

    [CCode (cname = "rini_get_config_value_description")]
    public static string get_config_value_description (RiniConfig config, string key);      // Get config value description for provided key


    // Set config value int/text and description for existing key or create a new entry
    // NOTE: When setting a text value, if id does not exist, a new entry is automatically created
    [CCode (cname = "rini_set_config_value")]
    public static int set_config_value (RiniConfig config, string key, int value, string description);

    [CCode (cname = "rini_set_config_value_text")]
    public static int set_config_value_text (RiniConfig config, string key, string text, string description);


    // Set config value description for existing key
    // WARNING: Key must exist to add description, if a description exists, it is updated
    [CCode (cname = "rini_set_config_value_description")]
    public static int set_config_value_description (RiniConfig config, string key, string description);
}
