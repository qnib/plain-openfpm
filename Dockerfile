ARG DOCKER_REGISTRY=docker.io
ARG FROM_IMG_REPO=library
ARG FROM_IMG_NAME="centos"
ARG FROM_IMG_TAG="7.6.1810"
ARG FROM_IMG_HASH=""
FROM ${DOCKER_REGISTRY}/${FROM_IMG_REPO}/${FROM_IMG_NAME}:${FROM_IMG_TAG}${DOCKER_IMG_HASH}

ARG OPENFPM_VER=2.0.0

RUN yum update -y
RUN yum install -y git
WORKDIR /usr/src/
RUN git clone https://github.com/IBirdSoft/openfpm_pdata_${OPENFPM_VER}.git openfpm
WORKDIR /usr/src/openfpm
RUN yum install -y bzip2-devel python-devel libxml2-devel libxslt-devel
RUN yum install -y cmake
RUN yum install -y wget
RUN yum install -y gcc-c++
RUN yum install -y gcc-gfortran
#RUN yum install -y
RUN ./install -c "--prefix=/usr/"
RUN make install
