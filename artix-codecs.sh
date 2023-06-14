# Video codecs
sudo pacman -Syy --noconfirm aom, dav1d, rav1e, svt-av1 schroedinger libdv libmpeg2 xvidcore libtheora libvpx x264 ffmpeg4.4
# yay -Syy davs2 daala-git

# Image codecs
sudo pacman -Syy --noconfirm jasper libwebp libavif libheif
yay -Syy openjpeg

# AAC(Advanced Audio Coding) codecs 
sudo pacman -Syy --noconfirm faac faad2 libfdk-aac

# Lossy audio codecs
sudo pacman -Syy --noconfirm lame a52dec libdca libmad libmpcdec opencore-amr opencore-amr opus speex libvorbis
yay -Syy celt

# Lossless audio codecs
sudo pacman -Syy --noconfirm flac wavpack
yay -Syy alac-git

#gstreamer package.

#To make GStreamer useful, install the plugins packages you require. See official documentation for list of features in each plugin.

#    gst-libav - Libav-based plugin containing many decoders and encoders.
#    gst-plugins-bad - Plugins that need more quality, testing or documentation.
#    gst-plugins-base - Essential exemplary set of elements.
#    gst-plugins-good - Good-quality plugins under LGPL license.
#    gst-plugins-ugly - Good-quality plugins that might pose distribution problems.
#    gst-plugin-libde265AUR - libde265 plugin (an open h.265 video codec implementation) for gstreamer.
#    gst-plugins-openh264AUR - H.264 support.
# gst-discoverer-1.0 gst-launch-1.0 gst-plugin-pipewire gstreamer-vaapi for VA-API support. gst-plugins-bad
