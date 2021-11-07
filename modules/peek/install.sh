sudo dnf install -y peek ffmpeg

dconf write /com/uploadedlobster/peek/recording-framerate "'15'"
dconf write /com/uploadedlobster/peek/recording-output-format "'webm'"
