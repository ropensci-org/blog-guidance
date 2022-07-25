# Source of rOpenSci blog guidance

<!-- badges: start -->
[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![GitHub Actions Workflow for commits to main](https://github.com/ropensci-org/blog-guidance/workflows/Render-Book-from-main/badge.svg)](https://github.com/ropensci-org/blog-guidance/actions?query=workflow%3ARender-Book-from-main)
<!-- badges: end -->

This repository contains the bookdown source for "rOpenSci Blog Guidelines for Authors and Editors".

# Deployment

The book is deployed via GitHub actions.

* [Workflow for commit to main](.github/workflows/main.yml): the book is built (html) and deployed to gh-pages.

* [Workflow for commit to any branch in a PR](.github/workflows/pr.yml): the book is built (html) and for PRs from this repo (not forks) the result is deployed to Netlify and the preview URL is posted in the details of a PR check.

# Misc

To check URLs run

```r
source("inst/scripts/check_urls.R")
all_urls[!all_urls$ok,]
```

Packages needed: magrittr, fs, glue, commonmark, xml2, tibble, crul, memoise, ratelimitr, purrr.

# Contributing

This is a work in progress.
If you find any errors or things that need clarification, we would be grateful if you opened an issue or pull request in [this repository](https://github.com/ropensci-org/blog-guidance).

We welcome contributions that adhere to our [Code of Conduct](https://ropensci.org/code-of-conduct/).


# Meta

This book was started using [Sean Kross](https://github.com/seankross)' [minimal bookdown example](https://github.com/seankross/bookdown-start).

The organization of this book was inspired by [JOSS's Author and Reviewer Guides](https://joss.readthedocs.io/en/latest/reviewer_guidelines.html).

All of the content of this repository is licensed 
[CC-BY-SA](https://creativecommons.org/publicdomain/zero/1.0/).
