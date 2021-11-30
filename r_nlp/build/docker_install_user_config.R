library(reticulate)
library(cleanNLP)

py_discover_config()

### Initialise the NLP packages that require it
cnlp_download_spacy(model_name = "en_core_web_sm")

cnlp_download_corenlp(lang = "en")

cnlp_init_udpipe(model_name = "english")
