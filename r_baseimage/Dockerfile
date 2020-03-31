FROM rocker/tidyverse:3.6.1

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    libclang-dev \
    libnlopt-dev \
    p7zip-full \
    pbzip2 \
  && apt-get clean \
  && install2.r --error \
    conflicted \
    cowplot \
    snakecase \
    furrr \
    rstan \
    rstanarm \
    brms \
    tidybayes \
    bayesplot \
    tidyquant \
    tidygraph \
    tidytext \
    forecast \
    broom \
    sweep


