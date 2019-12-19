
<!-- README.md is generated from README.Rmd. Please edit that file -->

# msBalance

## Overview

msBalance is an R project for analysis of balance responses in people
with and without multiple sclerosis (MS). The source data were created
by Jessie Huisinga, Ph.D., and collected by Daniel Peterson, Ph.D. The
analysis code was primarily developed by J. Lucas McKay, Ph.D., M.S.C.R.

## Getting and installing msBalance

### Downloading from GitHub for development

1.  Use RStudio to create a local copy of the project
    1.  In RStudio, start a new Project: `File > New Project > Version
        Control > Git`
    2.  In the “repository URL” paste:
        <https://github.com/jlucasmckay/msBalance>
    3.  On OS X, you can make this under `tmp` - this is a temporary
        file that can be deleted later
    4.  If there are files that need to be added to the remote, they can
        be placed in this folder or dragged / dropped into the GitHub
        interface.
2.  Path locations (used by Matlab code) are in `msBalance/paths.m`
3.  The main analysis is in `msBalance/R/msBalance.Rmd`
4.  Stage changed files, commit, and push changes with the git panel.

### Navigating a mixture of Matlab and R code

1.  The source files are in `.mat` format.
2.  There is a mixture of matlab preprocessing code (files in `m/`) into
    `.csv` files that R can then read (files in `R/`).
3.  A directory `csv/` is created to hold these files. The contents of
    this directory are not automatically loaded to GitHub.
