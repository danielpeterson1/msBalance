Balance responses in MS
================
J.L. McKay
28 January 2020

<!-- README.md is generated from README.Rmd. Please edit that file -->

# Overview

`msBalance` is an R project for analysis of balance responses in people
with and without multiple sclerosis (MS). The source data were created
by Jessie Huisinga, Ph.D., and collected by Daniel Peterson, Ph.D. The
analysis code was primarily developed by J. Lucas McKay, Ph.D., M.S.C.R.

# Use

## What to read and edit

1.  The main document is `R/msBalance.Rmd`, which can be
    knit/interpreted into `R/msBalance.html`, which contains the main
    text and figures.
2.  This document explains how to run the code.

## How to run the code

1.  Alter `paths.m` in the main project directory so that:
    1.  `dataDirectory` points at the correct data directory on your
        local machine. This should contain the files
        `AllConsolidatedData_CS.mat` and `AllConsolidatedData_MS.mat`.
    2.  `matlabCommand` points at the appropriate command-line version
        of Matlab for data preprocessing. On Dr. McKay’s machine, this
        string is `/Applications/MATLAB_R2019a.app/bin/matlab -nojvm
        -nodesktop -nosplash -r`.
2.  “knit” `R/msBalance.Rmd` to produce `R/msBalance.html`. This will
    call matlab to create intermediary files if they are
missing.

## Notes related to the fact that there is a mixture of Matlab and R code

1.  The source files are in `.mat` format.
2.  There is a mixture of matlab preprocessing code (files in `m/`) into
    `.csv` files that R can then read (files in `R/`).
3.  A directory `tmp/` is created to hold these files. The contents of
    this directory are not automatically loaded to GitHub.

## How to download from GitHub for development

1.  In RStudio, start a new Project: `File > New Project > Version
    Control > Git`.
2.  In the “repository URL” paste:
    <https://github.com/jlucasmckay/msBalance>.
3.  On OS X, you can make this under `~/tmp` - this is a temporary file
    that can be deleted later.
4.  If there are files that need to be added to the remote, they can be
    placed in this folder or dragged / dropped into the GitHub
    interface.
5.  Stage changed files, commit, and push changes with the git panel.
