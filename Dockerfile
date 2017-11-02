FROM floydhub/dl-base:1.0.0-py3.6
RUN pip --no-cache-dir install --upgrade http://download.pytorch.org/whl/cu80/torch-0.2.0.post2-cp35-cp35m-manylinux1_x86_64.whl
# install torch vision from source for dataloader bug fix
# ref: https://github.com/junyanz/pytorch-CycleGAN-and-pix2pix/issues/63

RUN git clone https://github.com/pytorch/vision \
    && cd vision \
    && git checkout 7492fae4c2cd16fb2783dce7e7583d7245cfbe92 \
    && python setup.py install \
    && cd .. \
    && rm -rf vision
RUN cd
RUN git clone https://github.com/zhanghang1989/PyTorch-Style-Transfer \
    && cd PyTorch-Style-Transfer/experiments \
    && bash models/download_model.sh
RUN pip install visdom
RUN pip install dominate
RUN git clone https://github.com/junyanz/pytorch-CycleGAN-and-pix2pix
WORKDIR  pytorch-CycleGAN-and-pix2pix
RUN bash ./datasets/download_pix2pix_dataset.sh monet2photo

