
<!-- README.md is generated from README.Rmd. Please edit that file -->

# msBalance

## Overview

msBalance is an R project for analysis of balance responses in people
with and without multiple sclerosis (MS). The source data were created
by Jessie Huisinga, Ph.D., and collected by Daniel Peterson, Ph.D. The
analysis code was primarily developed by J. Lucas McKay, Ph.D., M.S.C.R.

## Getting and installing msBalance

### What to read and edit

1.  This document explains how to run the code. It is an html version of
    `README.Rmd` that is “knit,” which you can think of as sort-of
    interpreted or compiled.
2.  The document `R/msBalance.html` contains the output text and
    figures. It is the knit/interpreted version of `R/msBalance.Rmd`

### How to run the code

1.  Alter `paths.m` in the main project directory to point to the
    correct data directory on your local machine.
2.  Run the Matlab code to load .mat files and populate patient-level
    data
      - Run `m/loadData.m` to load source files and populate the `csv/`
        directory. On Dr. McKay’s machine, this can be run as
        `/Applications/MATLAB_R2019a.app/bin/matlab -nojvm -nodesktop
        -nosplash -r "loadData"` from the command line once the shell is
        in the correct directory.
      - A future version of this could call the Matlab script from R if
        useful.
3.  “knit” `R/msBalance.Rmd` to produce
`R/msBalance.html`.

### Notes related to the fact that there is a mixture of Matlab and R code

1.  The source files are in `.mat` format.
2.  There is a mixture of matlab preprocessing code (files in `m/`) into
    `.csv` files that R can then read (files in `R/`).
3.  A directory `csv/` is created to hold these files. The contents of
    this directory are not automatically loaded to GitHub.

### How to download from GitHub for development

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
2.  Path locations that need to be read by Matlab and R can be specified
    in `msBalance/paths.m`.
3.  Path locations might need to be modified in
    `msBalance/m/loadData.m`.
4.  The main analysis is in `msBalance/R/msBalance.Rmd`
5.  Stage changed files, commit, and push changes with the git panel.
