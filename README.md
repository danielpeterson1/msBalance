
<!-- README.md is generated from README.Rmd. Please edit that file -->

# msBalance

## Overview

msBalance is a an R package for analysis of balance responses in people
with and without multiple sclerosis (MS). The source data were created
by Jessie Huisinga, Ph.D., and collected by Daniel Peterson, Ph.D. The
analysis code was primarily developed by J. Lucas McKay, Ph.D., M.S.C.R.

## Getting and installing msBalance

### Downloading from GitHub for development

To download and develop:

1.  Be sure to have `devtools` installed.
2.  Use RStudio to create a local copy in `~/tmp` based on
    <https://github.com/jlucasmckay/MSbalance>
3.  `devtools::check()`
4.  `devtools::build_vignettes()`
5.  `vignette("msBalance")`
6.  Edit vignettes/msBalance.Rmd and R files in R/.
7.  Stage changed files, commit, and push changes with the git panel.

### To install just for use:

Currently msBalance is available on github. It is being developed to
meet CRAN requirements but is not available there at present. To use the
package yourself:

1.  Be sure to have `devtools` installed.
2.  Call `remove.packages("msBalance")` if you have installed the
    package previously.
3.  `devtools::install_github("jlucasmckay/msBalance", build_vignettes =
    TRUE)`
4.  `vignette("msBalance")`
