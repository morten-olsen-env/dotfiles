#modprobe v4l2loopback exclusive_caps=1

#gphoto2 --stdout --capture-movie | gst-launch-1.0 fdsrc ! decodebin name=dec ! queue ! xvimagesink
gphoto2 --stdout --capture-movie | gst-launch-1.0 fdsrc ! decodebin name=dec ! queue ! videoconvert ! v4l2sink device=/dev/video2

