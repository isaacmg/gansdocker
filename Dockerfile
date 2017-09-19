FROM pytorch/pytorch:latest
RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/pytorch/vision
WORKDIR vision
RUN python setup.py install
RUN pip install visdom
RUN pip install dominate
RUN git clone https://github.com/junyanz/pytorch-CycleGAN-and-pix2pix
WORKDIR  pytorch-CycleGAN-and-pix2pix
