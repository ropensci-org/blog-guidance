# 13  Editor Checklist - Posts on peer-reviewed packages

Use of this template is described in [Review a Post](#review).

Copy this checklist to your GitHub review summary. Notice the copy-paste button at the top-right corner of the template.

``` markdown
* [ ] post follows Content Guidelines
* [ ] post follows Style Guide
* [ ] title is in Title Case
* [ ] publication date is ok
* [ ] slug is ok
* [ ] alternative text of images is informative
* [ ] author metadata is provided with correct folder name for each language
* [ ] html not included in pull request of Rmd post
* [ ] I ran `roblog::ro_lint_md()` on index.md
* [ ] I ran `roblog::ro_check_urls()` on index.md
* [ ] I ran a spell-check on index.md
* [ ] YAML subject tags are ok ("tech notes" for tech notes; "community" for non-staff non-editor)
* [ ] YAML field 'editor' is filled with your name
* [ ] YAML field 'translator' is filled as needed
* [ ] YAML field 'interviewee' is filled as needed
* [ ] YAML field 'preface' is present if necessary
* [ ] YAML field 'params.doi' is filled with a new DOI
* [ ] YAML package-version included
* [ ] YAML subject tags - software peer review, packagename
* [ ] acknowledges and links to reviewers
* [ ] links to peer review thread
```
