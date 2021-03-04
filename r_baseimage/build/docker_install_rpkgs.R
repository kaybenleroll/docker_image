remotes::install_github(
  "stan-dev/posterior",
  ref = "7d3b89571feb6e540df555ad7dc5edfa83430a7d",
  upgrade = "never"
)

remotes::install_github(
  "stan-dev/cmdstanr",
  ref = "46ae80f12881356e9152edd3881457b6da40016f",
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

