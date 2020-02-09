# Source of rOpenSci blog guidance

<!-- badges: start -->
[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
<!-- badges: end -->

This is the bookdown source for "rOpenSci Blog Guidelines for Authors and Editors".

# Deployment

The book is deployed via GitHub actions.

* [Workflow for commit to master](.github/master.yml): the book is built (html, PDF) and deployed to gh-pages.

* [Workflow for commit to any branch in a PR](.github/pr.yml): the book is built (html, PDF) and for PRs from this repo (not forks) the result is deployed to Netlify and the preview URL is posted as a commit comment.

# Meta

This book was started using [Sean Kross](https://github.com/seankross)' [minimal bookdown example](https://github.com/seankross/bookdown-start).

All of the content of this repository is licensed 
[CC-BY-SA](https://creativecommons.org/publicdomain/zero/1.0/).