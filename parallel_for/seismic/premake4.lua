project "Seismic"
  kind "WindowedApp"
  uses "TBB"
  links { "pthread", "X11", "Xext", "rt" }
  files {
    "../../common/gui/xvideo.cpp",
    "main.cpp",
    "seismic_video.cpp",
    "seismic_video.h",
    "universe.cpp",
    "universe.h"
  }
