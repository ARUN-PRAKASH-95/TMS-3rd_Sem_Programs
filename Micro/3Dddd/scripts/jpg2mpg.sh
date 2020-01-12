# requires ffmpeg library
# put this file in your jpg folder
#!/bin/bash
# quality is controlled by -qscale. Values are in [1;31]. 1 means best, 31 means worst
ffmpeg -y -i image_%d.jpg  -qscale:v 1 video.mpg
