project(
	'raylib',
	'c',
	version: '5.0.0',
	default_options: [
		'c_std=c99',
		'warning_level=1',
		'optimization=1'
	]
)

pkg = import('pkgconfig')
cc = meson.get_compiler('c')
version = meson.project_version()
os = build_machine.system()

# Debug stuff.
# Doing this because the debug defaults for Meson are really bad.
# More debug symbols.
if cc.has_argument('-g3') == true
	add_project_arguments('-g3', language: 'c')
elif cc.has_argument('-g') == true
	add_project_arguments('-g', language: 'c')
endif
if cc.has_argument('-ggdb3') == true
	add_project_arguments('-ggdb3', language: 'c')
elif cc.has_argument('-ggdb') == true
	add_project_arguments('-ggdb', language: 'c')
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

deps = []

if os == 'windows'
	deps += [
		cc.find_library('winmm', required: true),
		cc.find_library('opengl32', required: true),
		cc.find_library('shell32', required: true),
		cc.find_library('gdi32', required: true),
	]
elif os == 'darwin'
	error('OS not implemented.')
else
	deps += [
		dependency('threads'),
		cc.find_library('m', required: false),
		cc.find_library('dl', required: false),
		cc.find_library('rt', required: false),
	]
endif

src = [
	'source/src/rcore.c',
	'source/src/rmodels.c',
	'source/src/rshapes.c',
	'source/src/rtext.c',
	'source/src/rtextures.c',
	'source/src/utils.c',
	'source/src/raudio.c',
]
c_args = []
inc_dirs = ['source/src']
graphics_option = get_option('gl_api')
if graphics_option == '1.1'
	c_args += '-DGRAPHICS_API_OPENGL_11'
elif graphics_option == '2.1'
	c_args += '-DGRAPHICS_API_OPENGL_21'
elif graphics_option == '3.3'
	c_args += '-DGRAPHICS_API_OPENGL_33'
elif graphics_option == '4.3'
	c_args += '-DGRAPHICS_API_OPENGL_43'
elif graphics_option == 'es2'
	c_args += '-DGRAPHICS_API_OPENGL_ES2'
elif graphics_option == 'es3'
	c_args += '-DGRAPHICS_API_OPENGL_ES3'
endif

platform = get_option('platform')
if platform == 'desktop'
	c_args += '-DPLATFORM_DESKTOP'
	if get_option('native_glfw') == true
		deps += dependency('glfw3', required: true)
	else
		inc_dirs += [
			'source/src/external/glfw/include',
			'source/src/external/glfw/deps/mingw'
		]
		src += 'source/src/rglfw.c'
		if os != 'windows' and os != 'darwin'
			deps += [
				dependency('gl'),
				dependency('x11'),
				dependency('xcursor'),
				dependency('xrandr'),
				dependency('xinerama'),
				dependency('xi'),
			]
		endif
	endif
elif platform == 'desktop_sdl'
	c_args += '-DPLATFORM_DESKTOP_SDL'
	deps += dependency('SDL2', required: true)
elif platform == 'drm'
	c_args += '-DPLATFORM_DRM'
	if graphics_option != 'es2'
		error('es2 must be selected as the gl_api when using drm platform. Pass -Dgl_api=es2 to meson.')
	endif
	deps += dependency('libdrm', required: true)
	deps += dependency('gbm', required: true)
	deps += dependency('egl', required: true)
	deps += dependency('gl', required: true)
endif
# Required defines
c_args += [
	'-DSUPPORT_FILEFORMAT_WAV',
	'-DSUPPORT_FILEFORMAT_OGG',
	'-DSUPPORT_FILEFORMAT_MP3',
	'-DSUPPORT_FILEFORMAT_QOA',
	'-DSUPPORT_FILEFORMAT_FLAC',
	'-DSUPPORT_FILEFORMAT_XM',
	'-DSUPPORT_FILEFORMAT_MOD',
	'-DBUILD_LIBTYPE_SHARED',
	'-D_GNU_SOURCE',
	'-Wno-missing-braces',
	'-Werror=pointer-arith',
	'-Werror=implicit-function-declaration',
	'-fno-strict-aliasing',
	'-Wno-unused-function',
]
add_project_arguments(c_args, language: 'c')
incdir = include_directories(inc_dirs)

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

# For testing if the library built correctly.
raylib_exe = executable(
	'bunnymark',
	sources: 'bunnymark/main.c',
	dependencies: raylib_dep,
)
