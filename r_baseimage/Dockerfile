FROM rocker/verse:4.1.1

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y --no-install-recommends \
    byobu \
    clang \
    clang-9 \
    ditaa \
    graphviz \
    htop \
    less \
    libclang-dev \
    libglpk-dev \
    libnlopt-dev \
    p7zip-full \
    pbzip2 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir -p $HOME/.R \
  && echo "" > $HOME/.R/Makevars \
  && echo "CXX=clang++"                                            >> $HOME/.R/Makevars \
  && echo "CXXFLAGS=-Os -mtune=native -march=native"               >> $HOME/.R/Makevars \
  && echo "CXXFLAGS+= -Wno-unused-variable -Wno-unused-function"   >> $HOME/.R/Makevars \
  && echo "CXXFLAGS+= -Wno-unknown-pragmas -Wno-macro-redefined"   >> $HOME/.R/Makevars \
  && echo ""                                                       >> $HOME/.R/Makevars \
  && echo "CXX14=clang++"                                          >> $HOME/.R/Makevars \
  && echo "CXX14FLAGS=-Os -mtune=native -march=native"             >> $HOME/.R/Makevars \
  && echo "CXX14FLAGS+= -Wno-unused-variable -Wno-unused-function" >> $HOME/.R/Makevars \
  && echo "CXX14FLAGS+= -Wno-unknown-pragmas -Wno-macro-redefined" >> $HOME/.R/Makevars \
  && echo ""                                                       >> $HOME/.R/Makevars \
  && cp -r $HOME/.R /home/rstudio \
  && chown rstudio:rstudio /home/rstudio/.R \
  && install2.r --error \
    anytime \
    bayesplot \
    brms \
    broom \
    broom.mixed \
    broomExtra \
    conflicted \
    cowplot \
    DataExplorer \
    directlabels \
    fs \
    furrr \
    loo \
    modeltime \
    posterior \
    projpred \
    prophet \
    pryr \
    rmdformats \
    rstan \
    rstanarm \
    sessioninfo \
    shinybrms \
    shinystan \
    snakecase \
    tictoc \
    tidybayes \
    tidygraph \
    tidymodels \
    tidyquant \
    tidytext \
    timetk


COPY build/conffiles.7z           /tmp
COPY build/docker_install_rpkgs.R /tmp

WORKDIR /tmp

RUN git clone https://github.com/lindenb/makefile2graph.git \
  && cd makefile2graph \
  && make \
  && make install

WORKDIR /home/rstudio
USER rstudio

RUN Rscript /tmp/docker_install_rpkgs.R

RUN 7z x /tmp/conffiles.7z     \
  && cp conffiles/.bash*     . \
  && cp conffiles/.gitconfig . \
  && cp conffiles/.Renviron  . \
  && cp conffiles/.Rprofile  . \
  && mkdir -p .config/rstudio  \
  && cp conffiles/rstudio-prefs.json .config/rstudio/ \
  && rm -rfv conffiles/


USER root
RUN chown -R rstudio:rstudio /home/rstudio
