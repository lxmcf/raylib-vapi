project(
	'raylib',
	'c',
	version: '5.0.0',
)

pkg = import('pkgconfig')
cc = meson.get_compiler('c')
version = meson.project_version()

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

deps = [
	dependency('x11'),
	dependency('xcursor'),
	dependency('xrandr'),
	dependency('xinerama'),
	dependency('xi'),
	dependency('threads'),
	dependency('gl'),
	cc.find_library('m', required: false),
	cc.find_library('dl', required: false),
	cc.find_library('rt', required: false),
]

src = [
	'source/src/rcore.c',
	'source/src/rmodels.c',
	'source/src/rshapes.c',
	'source/src/rtext.c',
	'source/src/rtextures.c',
	'source/src/rglfw.c',
	'source/src/utils.c',
	'source/src/raudio.c',
	#'source/src/platforms/rcore_desktop.c',
]

# Required defines
add_project_arguments(
	[
		'-DGRAPHICS_API_OPENGL_33',
		'-DPLATFORM_DESKTOP',
		'-DSUPPORT_FILEFORMAT_WAV',
		'-DSUPPORT_FILEFORMAT_OGG',
		'-DSUPPORT_FILEFORMAT_MP3',
		'-DSUPPORT_FILEFORMAT_QOA',
		'-DSUPPORT_FILEFORMAT_FLAC',
		'-DSUPPORT_FILEFORMAT_XM',
		'-DSUPPORT_FILEFORMAT_MOD',
		'-DBUILD_LIBTYPE_SHARED',
		'-O1',
		'-D_GNU_SOURCE',
		'-Werror=implicit-function-declaration',
	],
	language: 'c'
)

incdir = include_directories(
	[
		'source/src',
		'source/src/external/glfw/include',
		'source/src/external/glfw/deps/mingw'
	]
)

lib = shared_library(
	'raylib',
	sources: src,
	version: version,
	dependencies: deps,
	include_directories: incdir
)

raylib_dep = declare_dependency(
	link_with: lib,
	include_directories: incdir,
)
