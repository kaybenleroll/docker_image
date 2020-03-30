FROM rocker/tidyverse:3.6.1

COPY conffiles.7z /

RUN chmod ugo+r /conffiles.7z \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    libclang-dev \
    libnlopt-dev \
    p7zip-full \
    pbzip2 \
  && apt-get clean \
  && install2.r --error \
    conflicted \
    tidyquant \
    tidygraph \
    cowplot \
    snakecase \
    furrr \
    forecast \
    broom \
    sweep \
    rstan \
    rstanarm \
    brms \
    tidybayes \
    bayesplot



