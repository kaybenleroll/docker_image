FROM rocker/verse:4.0.0

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y --no-install-recommends \
    byobu \
    clang \
    clang-7 \
    less \
    libclang-dev \
    libnlopt-dev \
    p7zip-full \
    pbzip2 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir -p $HOME/.R \
  && echo "CXX=clang++" > $HOME/.R/Makevars \
  && echo "CXXFLAGS=-Os -mtune=native -march=native" >> $HOME/.R/Makevars \
  && echo "CXXFLAGS+= -Wno-unused-variable -Wno-unused-function" >> $HOME/.R/Makevars \
  && echo "CXXFLAGS+= -Wno-unknown-pragmas -Wno-macro-redefined" >> $HOME/.R/Makevars \
  && echo "" \
  && echo "CXX14=clang++" > $HOME/.R/Makevars \
  && echo "CXX14FLAGS=-Os -mtune=native -march=native" >> $HOME/.R/Makevars \
  && echo "CXX14FLAGS+= -Wno-unused-variable -Wno-unused-function" >> $HOME/.R/Makevars \
  && echo "CXX14FLAGS+= -Wno-unknown-pragmas -Wno-macro-redefined" >> $HOME/.R/Makevars \
  && install2.r --error \
    bayesplot \
    brms \
    broom \
    conflicted \
    cowplot \
    DataExplorer \
    fs \
    furrr \
    googleCloudStorageR \
    rstan \
    rstanarm \
    sessioninfo \
    snakecase \
    tidybayes \
    tidygraph \
    tidyquant \
    tidytext


COPY build/conffiles.7z           /tmp
COPY build/docker_install_rpkgs.R /tmp

WORKDIR /tmp

RUN git clone https://github.com/lindenb/makefile2graph.git \
  && cd makefile2graph \
  && make \
  && make install

RUN Rscript /tmp/docker_install_rpkgs.R


WORKDIR /home/rstudio

RUN 7z x /tmp/conffiles.7z \
  && cp conffiles/.bash*     . \
  && cp conffiles/.gitconfig . \
  && cp conffiles/.Renviron  . \
  && cp conffiles/.Rprofile  . \
  && cp conffiles/user-settings .rstudio/monitored/user-settings/ \
  && chown -R rstudio:rstudio /home/rstudio \
  && rm -rfv conffiles/


