FROM rocker/verse:4.0.0

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y --no-install-recommends \
    byobu \
    less \
    libgsl-dev \
    python3-pip \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && pip3 install \
    cleannlp \
    spacy \
    stanfordnlp \
  && ln -s /usr/bin/python3 /usr/bin/python \
  && install2.r --error \
    cleanNLP \
    kernlab \
    broom \
    conflicted \
    cowplot \
    DataExplorer \
    directlabels \
    fs \
    furrr \
    googleCloudStorageR \
    lda \
    lsa \
    openNLP \
    politeness \
    qdap \
    quanteda \
    spacyr \
    sessioninfo \
    snakecase \
    text2vec \
    textplot \
    tidygraph \
    tidyquant \
    tidytext \
    tm \
    topicmodels \
    udpipe \
    wordcloud


COPY build/install_pkgs_setup_nlp.R /tmp/

RUN Rscript /tmp/install_pkgs_setup_nlp.R

