project ('Raylib-vala', [ 'vala', 'c' ], version: '4.2')

# Variables
source_dir = meson.current_source_dir ()
vapi_dir = source_dir / 'vapi'

# Build variables
project_dependency = []

# Compilers
valac = meson.get_compiler ('vala')
cc = meson.get_compiler ('c')

# Compiler arguments
valac_arguments = [
    '--vapidir', vapi_dir,
    #'--profile=posix'
]

cc_arguments = [
    '-DPHYSAC_IMPLEMENTATION'
]

add_project_arguments (valac_arguments, language: 'vala')
add_project_arguments (cc_arguments, language: 'c')

project_dependency = [
    valac.find_library ('raylib', dirs: vapi_dir),
    dependency('glib-2.0'),
    dependency('gobject-2.0'),
    #valac.find_library ('rlgl', dirs: vapi_dir),
    #valac.find_library ('physac', dirs: vapi_dir),

    cc.find_library ('raylib'),
    cc.find_library ('m')
]

#subdir ('examples/Camera3D')
#subdir ('examples/SmoothPixel')
#subdir ('examples/Physac')
subdir('src/lib')

raylib_oop_lib = shared_library(
  'raylib_vala',
  sources: raylib_oop_src,
  dependencies: project_dependency,
)
raylib_oop_dep = declare_dependency(link_with: raylib_oop_lib, dependencies: project_dependency)
executable('window', sources: 'src/tests/window.vala', dependencies: [raylib_oop_dep, project_dependency])
executable('sound', sources: 'src/tests/sound.vala', dependencies: [raylib_oop_dep, project_dependency])
executable('music', sources: 'src/tests/music.vala', dependencies: [raylib_oop_dep, project_dependency])
