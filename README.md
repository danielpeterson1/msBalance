
<!-- README.md is generated from README.Rmd. Please edit that file -->

# msBalance

## Overview

msBalance is a an R project for analysis of balance responses in people
with and without multiple sclerosis (MS). The source data were created
by Jessie Huisinga, Ph.D., and collected by Daniel Peterson, Ph.D. The
analysis code was primarily developed by J. Lucas McKay, Ph.D., M.S.C.R.

## Getting and installing msBalance

### Downloading from GitHub for development

1.  Be sure to have `devtools` installed.
2.  Use RStudio to create a local copy in `~/tmp` based on
    <https://github.com/jlucasmckay/msBalance>
    1.  In RStudio, start a new Project: `File > New Project > Version
        Control > Git`
    2.  In the “repository URL” paste:
        <https://github.com/jlucasmckay/msBalance>
    3.  On OS X, make under `tmp`
    4.  Click “Create Project” to create a new directory, which will be:
          - A directory/folder under `tmp`
          - A Git repository, linked to the remote GitHub repository
          - An RStudio Project
    5.  If there are files that need to be added to the remote, they can
        be placed in this folder or dragged / dropped into the GitHub
        interface.
3.  Path locations (used by R and Matlab code) are in paths.txt
4.  The main analysis is in R/msBalance.Rmd
5.  Stage changed files, commit, and push changes with the git panel.

### Navigating a mixture of Matlab and R code

The source files are in .mat format. There is a mixture of matlab
preprocessing code (files in m/) into .csv files that R can then read
(files in R/). A directory csv/ is created to hold these files. The
contents of this directory are ignored by git so that these files are
not automatically loaded to GitHub.
