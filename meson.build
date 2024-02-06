project (
	'Raylib-vala',
	'vala',
	version: '5.0.0',
)
pkg = import('pkgconfig')
# Variables
source_dir = meson.current_source_dir ()
vapi_dir = source_dir / 'vapi'
version = meson.project_version()

# Build variables
project_dependency = []

# Compilers
valac = meson.get_compiler ('vala')
cc = meson.get_compiler ('c')

# Compiler arguments
valac_arguments = [
    '--vapidir', vapi_dir,
		'--debug',
]

cc_arguments = [
    '-DPHYSAC_IMPLEMENTATION'
]

# Debug stuff.
# Doing this because the debug defaults for Meson are really bad.
# More debug symbols.
if cc.has_argument('-g3') == true
	add_project_arguments('-g3', language: 'c')
elif cc.has_argument('-g') == true
	add_project_arguments('-g', language: 'c')
endif
# Compress debug symbols if possible.
if cc.has_link_argument('-Wl,--compress-debug-sections=zlib') == true
	add_project_link_arguments(
	'-Wl,--compress-debug-sections=zlib',
	language: 'c'
)
endif

add_project_arguments (valac_arguments, language: 'vala')
add_project_arguments (cc_arguments, language: 'c')

project_dependency = [
	dependency('glib-2.0'),
	dependency('gobject-2.0'),
	dependency('raylib', fallback: ['raylib', 'raylib_dep']),
	valac.find_library('raylib', required: true, dirs: vapi_dir),
	#valac.find_library ('rlgl', dirs: vapi_dir),
	#valac.find_library ('physac', dirs: vapi_dir),
	cc.find_library ('m', required: false) # Only neccesary of systems where math *isn't* in the C Library.
]

# Raylib OOP Library Sources
subdir('src/lib')

# Raylib OOP Library
raylib_oop_lib = shared_library(
  'raylib_oop',
  sources: raylib_oop_src,
  dependencies: project_dependency,
	install: true,
	vala_args: ['--vapi-comments'],
	version: version,
	install_dir: [true, true, true],
)
# pkgconfig
pkg.generate(
	raylib_oop_lib,
	description: 'OOP Binding of Raylib for Vala.',
	requires: ['raylib'],
)
raylib_oop_dep = declare_dependency(
	link_with: raylib_oop_lib,
	dependencies: project_dependency
)

# Test Executables
executable('window',
	sources: 'src/tests/window.vala',
	dependencies: [
		raylib_oop_dep,
		project_dependency
	]
)
executable('sound',
	sources: 'src/tests/sound.vala',
	dependencies: [
		raylib_oop_dep,
		project_dependency
	]
)
executable(
	'music',
	sources: 'src/tests/music.vala',
	dependencies: [
		raylib_oop_dep,
		project_dependency
	]
)
executable(
	'test-subproject',
	sources: 'src/tests/test.c',
	dependencies: [
		raylib_oop_dep,
		project_dependency,
	],
)
