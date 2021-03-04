remotes::install_github(
  "pommedeterresautee/fastrtext",
  ref = "b63c5de9a5168378e8e1abfc4a50be7292002bfb",
  upgrade = "never"
)

install.packages("openNLPmodels.en",
  dependencies = TRUE,
  repos = "http://datacube.wu.ac.at/"
)


library(cleanNLP)

cnlp_download_spacy(model_name = "en_core_web_sm")
cnlp_download_corenlp(lang = "en")
cnlp_init_udpipe(model_name = "english")
