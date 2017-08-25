FROM ubuntu:latest

MAINTAINER faizan.khan@tenpearls.com

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    git \
  && rm -rf /var/lib/apt/lists/*

RUN curl -qsSLkO \
    https://repo.continuum.io/miniconda/Miniconda-latest-Linux-`uname -p`.sh \
  && bash Miniconda-latest-Linux-`uname -p`.sh -b \
  && rm Miniconda-latest-Linux-`uname -p`.sh

ENV PATH=/root/miniconda2/bin:$PATH

RUN conda install -y \
    h5py \
    pandas \
    theano \
  && conda clean --yes --tarballs --packages --source-cache \
  && pip install --upgrade pip\
  && pip install --upgrade -I setuptools \
  && pip install --upgrade \
    keras \
    tensorflow \
    pymongo

RUN conda install -y \
    jupyter \
    matplotlib \
    seaborn \
    scikit-learn \
    numpy \
    scipy \
    nltk

RUN apt-get update
RUN apt-get install -y ca-certificates

VOLUME /notebook
WORKDIR /notebook
EXPOSE 8888

CMD jupyter notebook --allow-root --no-browser --ip=0.0.0.0 --NotebookApp.token=
