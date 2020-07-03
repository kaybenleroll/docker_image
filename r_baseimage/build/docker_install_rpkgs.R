remotes::install_github(
  "business-science/tidyquant",
  ref = "017b7d9adda6d18deba5da0f42c31c8c55872f1c",
  upgrade = "never"
)

remotes::install_github(
  "business-science/modeltime",
  ref = "cee4714e386a365c6574454d99ea202860d8e864",
  upgrade = "never"
)

remotes::install_github(
  "jgabry/posterior",
  ref = "ecd99b1d6806fc02dce425207236e8f7d6f75939",
  upgrade = "never"
)

remotes::install_github(
  "stan-dev/cmdstanr",
  ref = "3422dc45dac7dbd57a799690e38b91a9ebcdf87f",
  upgrade = "never"
)


library(cmdstanr)

cmdstan_flags <- list(
  "CXX"        = "clang++-9",
  "CXXFLAGS"   = "-Os -mtune=native -march=native  -Wno-unused-variable -Wno-unused-function  -Wno-unknown-pragmas -Wno-macro-redefined",
  "CXX14"      = "clang++-9",
  "CXX14FLAGS" = "-Os -mtune=native -march=native  -Wno-unused-variable -Wno-unused-function  -Wno-unknown-pragmas -Wno-macro-redefined"
)

install_cmdstan(cores = parallel::detectCores(),
                flags = cmdstan_flags
                )

