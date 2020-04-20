FROM rocker/tidyverse:3.6.1

COPY conffiles.7z /

RUN chmod ugo+r conffiles.7z \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    less \
    libclang-dev \
    libnlopt-dev \
    p7zip-full \
    pbzip2 \
    clang \
    clang-7 \
  && apt-get clean \
  && mkdir -p $HOME/.R \
  && echo "CXX=clang++" > $HOME/.R/Makevars \
  && echo "CXXFLAGS=-Os -mtune=native -march=native" >> $HOME/.R/Makevars \
  && echo "CXXFLAGS+= -Wno-unused-variable -Wno-unused-function" >> $HOME/.R/Makevars \
  && echo "CXXFLAGS+= -Wno-unknown-pragmas -Wno-macro-redefined" >> $HOME/.R/Makevars \
  && echo "\n" >> $HOME/.R/Makevars \
  && echo "CXX11=clang++" > $HOME/.R/Makevars \
  && echo "CXX11FLAGS=-Os -mtune=native -march=native" >> $HOME/.R/Makevars \
  && echo "CXX11FLAGS+= -Wno-unused-variable -Wno-unused-function" >> $HOME/.R/Makevars \
  && echo "CXX11FLAGS+= -Wno-unknown-pragmas -Wno-macro-redefined" >> $HOME/.R/Makevars \
  && echo "\n" >> $HOME/.R/Makevars \
  && echo "CXX14=clang++" > $HOME/.R/Makevars \
  && echo "CXX14FLAGS=-Os -mtune=native -march=native" >> $HOME/.R/Makevars \
  && echo "CXX14FLAGS+= -Wno-unused-variable -Wno-unused-function" >> $HOME/.R/Makevars \
  && echo "CXX14FLAGS+= -Wno-unknown-pragmas -Wno-macro-redefined" >> $HOME/.R/Makevars \
  && install2.r --error \
    conflicted \
    cowplot \
    snakecase \
    furrr \
    fs \
    broom \
    rstan \
    rstanarm \
    brms \
    tidybayes \
    bayesplot \
    tidygraph \
    tidytext \
    tidyquant \
    googleCloudStorageR

