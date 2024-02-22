project (
	'Raylib-vala',
	'vala', 'c',
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
	cc_arguments += '-g3'
elif cc.has_argument('-g') == true
	cc_arguments += '-g'
endif
# Compress debug symbols if possible.
if cc.has_link_argument('-Wl,--compress-debug-sections=zstd') == true
	add_project_link_arguments(
		'-Wl,--compress-debug-sections=zstd',
		language: 'c'
	)
elif cc.has_link_argument('-Wl,--compress-debug-sections=zlib') == true
	add_project_link_arguments(
		'-Wl,--compress-debug-sections=zlib',
		language: 'c'
	)
endif

add_project_arguments (valac_arguments, language: 'vala')
add_project_arguments (cc_arguments, language: 'c')

glib_dep    = dependency('glib-2.0')
gobject_dep = dependency('gobject-2.0')
gio_dep     = dependency('gio-2.0')

project_dependency = [
	glib_dep,
	gobject_dep,
	gio_dep,
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
	dependencies: project_dependency,
)

# Examples
if get_option('examples') == true
	executable(
		'core_basic_window',
		dependencies: [raylib_oop_dep],
		sources: [
			'src/examples/core/core_basic_window.vala',
			'src/examples/meta/license.vala',
		],
	)
	executable(
		'template',
		dependencies: [raylib_oop_dep],
		sources: [
			'src/examples/template.vala',
		],
	)
endif
