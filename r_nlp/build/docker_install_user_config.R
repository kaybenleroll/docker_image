library(reticulate)
library(cleanNLP)

use_python("/usr/local/bin/python")

### Initialise the NLP packages that require it
cnlp_download_spacy(model_name = "en_core_web_sm")

cnlp_download_corenlp(lang = "en")

cnlp_init_udpipe(model_name = "english")
