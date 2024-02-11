<div align="center"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAQAAAAEAAQMAAABmvDolAAAAA3NCSVQICAjb4U/gAAAABlBMVEVwH37Iev+ge9r7AAAAsklEQVRo3u3XvQnDMBCG4RdSuPQI2kRezJDCizmbaASXKowuhYLzA5HT+Uy+t36agzuEQKm3rJGAgICAgICAgICAgICAgMBHa8ix9w+s+AQLdDOEzpYx5Ah4BNc6wAP0lpyClyn8gtveFB7ADAEY+bYPR4NndTMap3c8APyDrXQG4PdZnCxHIMMleQaDWcqDTa5BBHyDNXSlb03hAViy0twHF6CWh53TE/gR6Ifyt0CprTv6YNdP71SVUgAAAABJRU5ErkJggg=="></div>

# Raylib VAPI

Bindings for [Vala](https://vala.dev/) to use the simple and easy to use graphics library [Raylib](https://github.com/raysan5/raylib).

## Description
Ralib VAPI currently supports the core module of Raylib using a C style API for ease of code porting.

Some VAPI's will be released to follow a more [OOP design](https://en.wikipedia.org/wiki/Object-oriented_programming) as well if you wish to use them in a more traditional Vala style.

## Supported Modules

| Module  | Supported          | OOP Available      | VAPI Name   | Version |
|:-------:|:------------------:|:------------------:|:-----------:|:-------:|
| raylib  | :heavy_check_mark: | :construction:     | raylib.vapi | 4.5     |
| rlgl    | :heavy_check_mark: | :x:                | rlgl.vapi   | 4.5     |
| raymath | :x:                | :x:                |             |         |
| raudio  | :x:                | :x:                |             |         |
| raygui  | :x:                | :x:                |             |         |
| rpng    | :x:                | :x:                |             |         |
| rini    | :heavy_check_mark: | :x:                | rini.vapi   | 1.0     |
| res     | :x:                | :x:                |             |         |
| physac  | :construction:     | :x:                | physac.vapi | 1.1     |

## Example
```csharp
using Raylib;

public const int WINDOW_WIDTH = 800;
public const int WINDOW_HEIGHT = 450;

public static int main (string[] args) {
    init_window (WINDOW_WIDTH, WINDOW_HEIGHT, "raylib [core] example - basic window");

    set_target_fps (60);

    while (!window_should_close ()) {
        begin_drawing ();
            clear_background (RAYWHITE);

            draw_text ("Congrats! You created your first window!", 190, 200, 20, LIGHTGRAY);
        end_drawing ();
    }

    close_window ();

    return 0;
}
```

## Compiling Included Examples
```bash
cd examples

meson build -C build

cd build/

Camera3D/application        # To run the 3D camera example
                            # or
SmoothPixel/application     # To run the smooth pixel perfect example
```
