FROM rocker/verse:4.0.4

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y --no-install-recommends \
    byobu \
    less \
    libgsl-dev \
    libleptonica-dev \
    libpoppler-cpp-dev \
    libtesseract-dev \
    python3-pip \
    tesseract-ocr-eng \
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
    lda \
    lsa \
    ngram \
    ngramrr \
    NLP \
    openNLP \
    politeness \
    pryr \
    qdap \
    quanteda \
    spacyr \
    sessioninfo \
    snakecase \
    tesseract \
    text2vec \
    textplot \
    tidygraph \
    tidyquant \
    tidytext \
    tm \
    topicmodels \
    udpipe \
    wordcloud \
    zipfR


COPY build/install_pkgs_setup_nlp.R /tmp/

WORKDIR /home/rstudio

RUN Rscript /tmp/install_pkgs_setup_nlp.R

