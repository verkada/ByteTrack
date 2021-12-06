docker build -t bytetrack:latest .


docker run -it --rm \
-v $PWD:/workspace/ByteTrack \
-v $PWD/pretrained:/workspace/ByteTrack/pretrained \
-v $PWD/datasets:/workspace/ByteTrack/datasets \
-v $PWD/YOLOX_outputs:/workspace/ByteTrack/YOLOX_outputs \
-v /tmp/.X11-unix/:/tmp/.X11-unix:rw \
--device /dev/video0:/dev/video0:mwr \
--net=host \
-e XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR \
-e DISPLAY=$DISPLAY \
--privileged \
bytetrack:latest


python3 tools/demo_track.py video -f exps/example/mot/yolox_m_mix_det.py -c pretrained/bytetrack_m_mot17.pth.tar --fp16 --fuse --save_result --device cpu

python3 tools/demo_track.py video -f exps/example/mot/yolox_x_mix_det.py -c pretrained/bytetrack_x_mot17.pth.tar --fuse --save_result --device cpu
