package portaudio

/*
// PA_LITTLE_ENDIAN ? PTHREAD_CANCELED ?
// HAVE_MACH_ABSOLUTE_TIME ?
// PA_USE_C99_LRINTF looks still experimental
// for debug: PA_ENABLE_DEBUG_OUTPUT PA_LOG_API_CALLS

#cgo CFLAGS: -Iportaudio/include -Iportaudio/src/common
#cgo !windows CFLAGS: -Iportaudio/src/os/unix
#cgo windows CFLAGS: -Iportaudio/src/os/win

// TODO: do not set if big endian arch
#cgo CFLAGS: -DPA_LITTLE_ENDIAN

#cgo LDFLAGS: -lm
#cgo linux LDFLAGS: -ldl

#cgo linux CFLAGS: -DPA_USE_ALSA -DPA_ALSA_DYNAMIC -DHAVE_NANOSLEEP -DHAVE_CLOCK_GETTIME -DPTHREAD_CANCEL
#cgo linux LDFLAGS: -lasound
#cgo darwin CFLAGS: -DPA_USE_COREAUDIO
#cgo darwin LDFLAGS: -framework CoreFoundation -framework CoreServices -framework CoreAudio -framework AudioToolBox -framework AudioUnit
#cgo windows CFLAGS: -DPA_USE_WMME
#cgo windows LDFLAGS: -lwinmm -lole32 -luuid
*/
import "C"
