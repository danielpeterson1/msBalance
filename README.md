
<!-- README.md is generated from README.Rmd. Please edit that file -->

# msBalance

## Overview

msBalance is a an R package for analysis of balance responses in people
with and without multiple sclerosis (MS). The source data were created
by Jessie Huisinga, Ph.D., and collected by Daniel Peterson, Ph.D. The
analysis code was primarily developed by J. LUcas McKay, Ph.D., M.S.C.R.

## Getting msBalance

### Downloading from GitHub for development

To work on the package for others to use:

1.  Be sure to have `devtools` installed.
2.  Use RStudio to create a local copy in `~/tmp` based on
    <https://github.com/jlucasmckay/MSbalance>
3.  `devtools::check()`
4.  `devtools::build_vignettes()`
5.  `browseVignettes("MSbalance")`
6.  Edit
7.  Stage changed files, commit, and push changes with the git panel.

### Installing from GitHub for use

Currently msBalance is available on github. It is being developed to
meet CRAN requirements but is not available there at present. To use the
package yourself:

1.  Be sure to have `devtools` installed.
2.  Call `remove.packages("msBalance")` if you have installed the
    package previously.
3.  `devtools::install_github("jlucasmckay/msBalance", build_vignettes =
    TRUE)`
4.  `browseVignettes("msBalance")`

## Using msBalance

The best way to get started is by using the `msBalance` vignette.
