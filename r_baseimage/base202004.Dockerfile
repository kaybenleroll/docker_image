FROM rocker/verse:3.6.3

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
    clang \
    clang-7 \
    less \
    libclang-dev \
    libnlopt-dev \
    p7zip-full \
    pbzip2 \
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
    brms \
    broom \
    conflicted \
    cowplot \
    fs \
    furrr \
    googleCloudStorageR \
    rstan \
    rstanarm \
    snakecase \
    tidybayes \
    tidygraph \
    tidyquant \
    tidytext \
  && rm -rf /var/lib/apt/lists/*
