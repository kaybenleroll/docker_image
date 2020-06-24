FROM kaybenleroll/r_baseimage:base202006

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y --no-install-recommends \
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
    lda \
    openNLP \
    qdap \
    quanteda \
    topicmodels \
    udpipe \
    wordcloud


COPY build/install_pkgs_setup_nlp.R /tmp/

RUN Rscript /tmp/install_pkgs_setup_nlp.R

