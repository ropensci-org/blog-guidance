# Technical Guidelines {#technical}

## Choose your workflow

Prepare your post in whichever way is most comfortable for you. You can write your post:
- in your favorite editor in R Markdown or Markdown by starting with templates we provide
    - link to or expand .Rmd template here
    - link to or expand .md template here
- or by using the [roblog helper package](https://docs.ropensci.org/roblog/) created for this purpose. Installing roblog allows you to use RStudio addins to get templates and to run some pre-submission checks.

## Walkthrough with code snippets and screenshots

Adapt from [current roweb2 instructions](https://github.com/ropensci/roweb2#contributing-a-blog-post) which are good. Like JOSS, code snippet in md that can be copied, followed by screenshot of preview

### What goes in YAML

include advice on tags, info on Twitter cards

start with annotated screenshot of YAML from a real post (rmangal?)

```
---
rmangal YAML here
---
```


### Add an image
from an image file, or created from R code in Rmd, adding alternative text for images

Add image from an image file `{{< figure src = "/img/blog-images/2019-06-04-post-template/name-of-image.png" width = "200" alt = "this is the alternative text" >}}`

Center or right-align an image
`class="center"` or `class="pull-right"`

HMMMM NEED TO PUT SCREENSHOTS HERE TO SHOW IMAGE SIZE AND ALIGNMENT ON PAGE. See https://docs.ropensci.org/roblog/articles/rmd-guidance.html for Rmd template that includes image placement examples.

Every image should be accompanied by alternative text (`alt="some text"`) to make it more accessible to people with disabilities and provide a better user experience for everyone. The alternative text should convey the meaning or content that is displayed in the image. Refer [to this tutorial](https://www.w3.org/WAI/tutorials/images/informative/) for details on what should go in alternative text.

### Add a tweet

Use a Hugo shortcode to embed a tweet e.g. `{{< tweet 1138216112808529920 >}}`

ADD SCREENSHOT of embedded tweet here

### Add a citation

To add citations, refer them in the body of your post:
```
Citation of the primary literature[^1].
Citation of an R package[^2].
Citation of a website[^3].
```

And list your sources at the bottom of your post:

```
[^1]: Sciaini, M., Fritsch, M., Scherer, C., & Simpkins, C. E. (2018). NLMR and landscapetools: An integrated environment for simulating and modifying neutral landscape models in R. Methods in Ecology and Evolution, 9(11), 2240-2248. [doi:10.1111/2041-210X.13076](https://doi.org/10.1111/2041-210X.13076)
[^2]: Elin Waring, Michael Quinn, Amelia McNamara, Eduardo Arino de la Rubia, Hao Zhu and Shannon Ellis (2019). skimr: Compact and Flexible Summaries of Data. R package version 2.0.2. https://CRAN.R-project.org/package=skimr
[^3]: Hugo static site generator. https://gohugo.io/
```

Citations will appear at the bottom of your post like this:
ADD SCREENSHOT HERE of display of footnotes in this post template

#### How to find citation text for a package or article

To get the citation for an R package, run `citation("packagename")`.

To get the citation for an article, you can use the RStudio addin for [rcrossref](https://docs.ropensci.org/rcrossref/), or get the  citation from a paper's DOI by running e.g.

```
> rcrossref::cr_cn("10.1111/2041-210X.13076", format="text", style="apa")

[1] "Sciaini, M., Fritsch, M., Scherer, C., & Simpkins, C. E. (2018). NLMRandlandscapetools: An integrated environment for simulating and modifying neutral landscape models inR. Methods in Ecology and Evolution, 9(11), 2240–2248. doi:10.1111/2041-210x.13076"
```

To get the citation for an article in [Google Scholar](https://scholar.google.com/), find the article, click the quote symbol (in search results under the article) to open the "Cite" window, and copy the APA style text.

ADD THIS SCREENSHOT, annotated to point to quote symbol that opens the Cite window for the text to copy
![](https://i.imgur.com/ZzMt8WE.png)



## Style guide
adapted from: https://github.com/ropenscilabs/roblog/blob/master/vignettes/styleguide.Rmd

- For formatting of package names, functions, and code, follow the [tidyverse style guidance].(https://style.tidyverse.org/documentation.html#r-code).
- Use ### or #### to format headings in your post; larger sizes don't look good. Note long headings with #### don't wrap well.
- Use title case for the title of your post; use sentence case for headings inside the post.
- 'rOpenSci' not 'ROpenSci'
- When adding links to your post, use relative instead of absolute URLs e.g. `/blog/` instead of `https://ropensci.org/blog/`.
- Use [Hugo shortcodes](https://gohugo.io/content-management/shortcodes/#use-hugos-built-in-shortcodes) (not html) to add images, tweets, gists etc.
- Use informative alternative text for all images(LINK to image alt text section above).

## Create or update your author file

**Why?** rOpenSci staff and community members who have authored a blog post, tech note, or presented in a Community Call have an author page on our website. Then, when a reader clicks on your by-line in your post, they can find your online home, possibly your Twitter or GitHub handle, and links to all the content you’ve authored on our site. For staff and leadership team members, editors for software peer review, or members of our Code of Conduct Committee, their rOpenSci title is also listed. The rOpenSci website has a page listing [all authors](https://ropensci.org/authors/).

**NOTE** Need to adapt text below to use Rmd to read code (e.g. template file) and to suggest use of RStudio add-in or run `roblog::ro_blog_post_author()` as done in https://github.com/ropenscilabs/roblog/blob/master/vignettes/author-file-guidance.Rmd

**How?** If you don't already have an author page, create a folder called`yourfirstname-yourlastname` in your local copy of [`roweb2/content/authors/`](https://github.com/ropensci/roweb2/tree/master/content/authors). You can have accents, middle initials, or hyphens appear in your name if you name your `firstname-lastname` folder appropriately. If you're not sure of how to do this, look at [other people's folder names](https://github.com/ropensci/roweb2/tree/master/content/authors) for examples.

In that folder, create a file called `_index.md` with information about your online presence.

**Example and Template**

Example author file [`/authors/kelly-obriant/_index.md`](https://github.com/ropensci/roweb2/blob/master/content/authors/kelly-obriant/_index.md) that, when rendered, generates [Kelly O'Briant's author page](https://ropensci.org/authors/kelly-obriant/):

```
---
name: Kelly O'Briant
link: https://kellobri.github.io/
twitter: kellrstats
github: kellobri
---
```

? maybe also show Maëlle Salmon example for other IDs and ë `content/authors/maëlle-salmon/_index.md`.?

? screenshot author page ?

At minimum, provide your name and a link or your Twitter, GitHub, or GitLab username. The link field is meant for your preferred online presence URL. Add your usernames or ID's without the "@").

Template `_index.md` <LINK to `author-file-template.md`> for author file.
```
---
name: Author Name
link: website URL or other online presence
twitter: Twitter username
github: GitHub username
gitlab: GitLab username
keybase: Keybase ID
orcid: ORCID ID
---
```

## Pre-submission checklists
Instructions to copy the relevant checklist into a comment on your pull request

See roblog "check your post"
- `ro_lint_md()` to check and enforce use of complete alternative descriptions for image, of relative links to rOpenSci website, of Hugo shortcodes for tweets, of lower camelCase for rOpenSci name.
- `ro_check_urls()` https://docs.ropensci.org/roblog/articles/checks-guidance.html


## Submit your draft post
Step by step guide: clone/fork ...hugo local preview ...pull request...

See r-hub example PR https://github.com/r-hub/blog/pull/50

Knitting the Rmd will generate both .html and .md files. Please do not include the html in your pull request to roweb2.