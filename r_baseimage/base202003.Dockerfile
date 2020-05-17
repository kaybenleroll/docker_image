FROM rocker/tidyverse:3.6.1

COPY conffiles.7z /

WORKDIR /home/rstudio

RUN 7z x /conffiles.7z \
  && cp conffiles/.bash*     . \
  && cp conffiles/.gitconfig . \
  && cp conffiles/.Renviron  . \
  && cp conffiles/.Rprofile  . \
  && cp conffiles/user-settings .rstudio/monitored/user-settings/ \
  && chown -R rstudio:rstudio /home/rstudio \
  && rm -rfv conffiles/

RUN chmod ugo+r conffiles.7z \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    pbzip2 \
    clang \
    clang-7 \
    less \
    libclang-dev \
    libnlopt-dev \
    p7zip-full \
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
    bayesplot \
    conflicted \
    cowplot \
    googleCloudStorageR \
    furrr \
    fs \
    broom \
    rstan \
    rstanarm \
    brms \
    tidybayes \
    snakecase \
    tidygraph \
    tidyquant \
    tidytext \
  && rm -rf /var/lib/apt/lists/*

