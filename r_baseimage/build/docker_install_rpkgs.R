remotes::install_github(
  "business-science/tidyquant",
  ref = "f476e53d68735bf8ee460f0afd8ebc81c55a90c4",
  upgrade = "never"
)

remotes::install_github(
  "stan-dev/posterior",
  ref = "743814747fc42bb12641447a369ff0967c0cc51f",
  upgrade = "never"
)

remotes::install_github(
  "stan-dev/cmdstanr",
  ref = "fb3703f5d5b4f2238ead2471e102f7232d0da316",
  upgrade = "never"
)


library(cmdstanr)

cmdstan_flags <- list(
  "CXX"        = "clang++-9",
  "CXXFLAGS"   = "-Os -mtune=native -march=native  -Wno-unused-variable -Wno-unused-function  -Wno-unknown-pragmas -Wno-macro-redefined",
  "CXX14"      = "clang++-9",
  "CXX14FLAGS" = "-Os -mtune=native -march=native  -Wno-unused-variable -Wno-unused-function  -Wno-unknown-pragmas -Wno-macro-redefined"
)

install_cmdstan(
  cores       = parallel::detectCores(),
  cpp_options = cmdstan_flags
)

