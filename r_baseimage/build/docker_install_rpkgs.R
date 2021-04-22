remotes::install_github(
  "stan-dev/posterior",
  ref = "02aaef5806f484e4e3b13aa1ff95124d590a097a",
  upgrade = "never"
)

remotes::install_github(
  "stan-dev/cmdstanr",
  ref = "3233585c8e0047d88c85ba8eb9072057ff5237a5",
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

