project ('Raylib-vala', [ 'vala', 'c' ], version: '4.2')

# Variables
source_dir = meson.current_source_dir ()
vapi_dir = source_dir / '../vapi'

# Build variables
project_dependency = []

# Compilers
valac = meson.get_compiler ('vala')
cc = meson.get_compiler ('c')

# Compiler arguments
valac_arguments = [
    '--vapidir', vapi_dir,
    '--profile=posix'
]

add_project_arguments (valac_arguments, language: 'vala')

project_dependency = [
    valac.find_library ('raylib', dirs: vapi_dir),

    cc.find_library ('raylib'),
    cc.find_library ('m')
]

subdir ('Camera3D')
subdir ('SmoothPixel')

