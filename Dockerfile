FROM 2yongbum/raspberry4-opencv-python3.7

# install libraries
RUN apt update
RUN apt install curl gnupg ca-certificates zlib1g-dev libjpeg-dev -y
RUN apt -y install libtiff5-dev
# RUN apt -y install libjasper-dev
# RUN apt -y install libpng12-dev
RUN apt -y install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
RUN apt -y install libxvidcore-dev libx264-dev
RUN apt -y install qt4-dev-tools libatlas-base-dev

# install tflit
RUN pip3 install --upgrade pip
RUN pip3 install https://github.com/google-coral/pycoral/releases/download/release-frogfish/tflite_runtime-2.5.0-cp37-cp37m-linux_armv7l.whl

# install coral-edgetpu
RUN echo "deb https://packages.cloud.google.com/apt coral-edgetpu-stable main" | tee /etc/apt/sources.list.d/coral-edgetpu.list
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN apt update
RUN apt install libedgetpu1-std -y
RUN apt install  python3-edgetpu  -y

# https://github.com/EdjeElectronics/TensorFlow-Lite-Object-Detection-on-Android-and-Raspberry-Pi/blob/master/Raspberry_Pi_Guide.md
RUN apt-get install -y git wget unzip
RUN git clone https://github.com/EdjeElectronics/TensorFlow-Lite-Object-Detection-on-Android-and-Raspberry-Pi.git tflite1
WORKDIR /tflite1
RUN wget https://storage.googleapis.com/download.tensorflow.org/models/tflite/coco_ssd_mobilenet_v1_1.0_quant_2018_06_29.zip
RUN unzip coco_ssd_mobilenet_v1_1.0_quant_2018_06_29.zip -d Sample_TFLite_model
RUN rm coco_ssd_mobilenet_v1_1.0_quant_2018_06_29.zip
