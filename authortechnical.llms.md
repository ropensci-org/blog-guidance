# 3  Technical Guidelines

This chapter explains the technical details of submitting a blog post or tech note (referred to collectively as “posts”) for publication on the rOpenSci website - from drafting in an (R) Markdown template, to submitting for review using GitHub Pull Request infrastructure.

We include advice on commonly used elements like adding [an image](#addimage), [a citation](#addcitation), or [embedding a social media post](#addsocialpost) in case you need them.

Briefly, the process is:

1.  Get the go-ahead and a tentative publication date from our Community Manager.
2.  Fork the repository (repo) of the rOpenSci website.
3.  Draft your post in R Markdown or Quarto or Markdown and create or update your author metadata.
4.  Preview and refine your post locally.
5.  Submit via pull request and preview your post.
6.  A blog editor reviews your post.
7.  Revise your post in response to review.

This chapter links to templates for posts and checklists that you can also find in the Appendix.

## 3.1 Fork the `roweb3` repository

Fork the rOpenSci website [repository](https://github.com/ropensci/roweb3) and create a new branch to work on your post. For help with this aspect of git/GitHub, we recommend [happygitwithr](https://happygitwithr.com/fork-and-clone.html) and the [pull request helpers of the usethis package](https://usethis.r-lib.org/articles/articles/pr-functions.html).

## 3.2 Install blogdown

If you plan to use R Markdown to write your post (using `index.Rmd` as opposed to directly writing it in Markdown with `index.md` and not executing any code), please install or update blogdown.

``` downlit
install.packages("blogdown")
```

## 3.3 Author files

Create or update your author file.

### 3.3.1 Why?

The rOpenSci website has a page listing [all authors](https://ropensci.org/author/) who have contributed to a blog post, tech note, presented in a Community Call, host a co-working session, delivered a talk about rOpenSci’s activities or contribute to some of our projects like the [Champions Program](https://ropensci.org/champions/). A click on your by-line in a post takes the reader to your author page that has links to your online home, possibly your social media or GitHub profile(s), and a list of all the content you’ve authored on our site. For staff and leadership team members, editors for software peer review, members of our Code of Conduct Committee, and participants of our Champions Program, their rOpenSci title is also listed on their author page.

### 3.3.2 How?

If you don’t already have an author page, create a folder called `yourfirstname-yourlastname` in your local copy of [`roweb3/content/author/`](https://github.com/ropensci/roweb3/tree/HEAD/content/author). You can have accents, middle initials, or hyphens appear in your name if you name your folder appropriately. That can be tricky so we have examples below.

In that folder, create a file called `_index.md` with information about your online presence. You can copy this template below (or get it via [roblog](https://docs.ropensci.org/roblog/reference/blog-posts.html) after installing it via `install.packages("roblog", repos = "https://dev.ropensci.org")` ).

author-file-template.md

``` yaml

---
name: Author name
link: website URL or other online presence
mastodon: Mastodon full URL to profile
twitter: Twitter username
github: GitHub username
gitlab: GitLab username
keybase: Keybase ID
orcid: ORCID ID
img: link to **square** picture to be saved in themes/ropensci/static/img/community (if not provided, uses GitHub profile picture)
---
```

\

At minimum, provide your name and a link or your Social Media, GitHub, or GitLab username. Add your usernames or ID’s without the “@” or the “https:…”. The link field can be your personal website URL, for example.

### 3.3.3 Example

This author file, [`/author/maëlle-salmon/_index.md`](https://github.com/ropensci/roweb3/blob/HEAD/content/author/ma%C3%ABlle-salmon/_index.md)

``` yaml
---
name: Maëlle Salmon
mastodon: https://mastodon.social/@maelle
bio: rOpenSci Research Software Engineer, Associate editor of rOpenSci Software Peer Review
github: maelle
gitlab: maelle
keybase: maelle_salmon
orcid: 0000-0002-2815-0399
---
```

… generates [Maëlle Salmon’s author page](https://ropensci.org/author/ma%C3%ABlle-salmon/).

For an example of how to name the folder with an accent and initials, see this [author file](https://github.com/ropensci/roweb3/blob/HEAD/content/author/rich%C3%A8l-j.c.-bilderbeek/_index.md) that generates [Richèl J.C. Bilderbeek’s author page](https://ropensci.org/author/rich%C3%A8l-j.c.-bilderbeek/). The folder name must include accents, initials with periods, and hyphens for spaces, in order to link to their blog content.

Look at [other people’s folder names](https://github.com/ropensci/roweb3/tree/HEAD/content/author) for examples.

Your author page will show the picture you have on your GitHub profile.

## 3.4 Post template

Start your post from a template. If you use RStudio, refer to [the instructions to create your draft with blogdown’s New Post Addin](#blogdownaddin). If not, refer to [the instructions to create your draft manually](#manually).

### 3.4.1 New Post Addin

The blogdown New Post RStudio addin creates the post draft in the correct location and fills the post YAML based on metadata you’ll have entered.[^1]

- Install `whoami` and `blogdown` (`install.packages(c("whoami", "blogdown"))`) (blogdown version should be at least 1.6.0).
- Install Hugo (to preview the post): `blogdown::install_hugo("0.133.0")` (version recorded in netlify.toml of the roweb3 repository).
- Re-start R.
- In RStudio, open the forked `roweb3` project.
- Create a new post by running Addins \> New Post or `blogdown:::new_post_addin()`.
- Leave “Categories” blank (and ignore in the file created)

![blogdown's New Post Addin.](images/blogdownaddin.png)

- Enter a title, no need to worry about title case at this stage.
- Enter your name if `whoami` wasn’t able to guess it.
- Choose the correct date.
- Enter a new slug if the default one is too long.
- Choose “blog” as a Subdirectory from the drop-down menu.
- Choose an Archetype, Rmd or qmd or md, from the drop-down menu.
- Also choose the correct Format: .Rmd if Rmd, Markdown (.md) if md. Never choose .RMarkdown.
- Ignore Categories.
- Select “tech notes” tag if this is a tech note
- Select any other relevant tags and/or create new ones
- Click on “Done”, your post draft will have been created and opened.

### 3.4.2 Manually

Create a folder `YYYY-MM-DD-slug/` (e.g. `2020-01-20-rorcid/`) under `/content/blog/` Your post source and its images should live in `/content/blog/YYYY-MM-DD-slug/`.[^2]

- [R Markdown template](#templatermd) is to be saved as `/content/blog/YYYY-MM-DD-slug/index.Rmd`. It will need to be knit (RStudio knit button, or `blogdown::build_site(build_rmd = <path_to_file>)`). Add both `index.Rmd` and `index.md`to your PR.

- [Quarto template](#templatermd) is to be saved as `/content/blog/YYYY-MM-DD-slug/index.qmd`. It will need to be rendered. Add both `index.qmd` and `index.md`to your PR.

- [Markdown template](#templatemd) is to be saved as `/content/blog/YYYY-MM-DD-slug/index.md`.

## 3.5 Adding content

### 3.5.1 YAML

The YAML sets the metadata for a post. This is the YAML from our [post template](#templatermd), with comments to explain some components.

> **Note:** The New Post Addin automatically creates a `categories` component, but you should ignore or remove this and use `tags` instead.

``` yaml
slug: post-template
title: Post Title in Title Case
author:
- Author Name1
- Author Name2
editor: Editor Name1
date: '2020-03-10'
tags:
- Software Peer Review
- packages
- R
- community
description: A very short summary of your post (~ 100 characters)
params:
  doi: ~
socialImg: blog/2019/06/04/post-template/name-of-image.png
socialAlt: Alternative description of the image
social: A post about blabla by @username@server.extension!
```

If you need to add an alert box at the beginning of the post, use the `preface` field with the Markdown syntax. See for instance this post with a [preface about a series of post](https://ropensci.org/blog/2018/06/08/rprofile-julia-silge/) ([source](https://github.com/ropensci/roweb3/blob/ab72341023d171b45abda1ba62b4bd8f6553e911/content/blog/2018-06-08-rprofile-julia-silge.md?plain=1#L5))

``` yaml
preface: "some alert"
```

#### 3.5.1.1 Subject tags

Add tags to the YAML of your post to make it more findable. Browse [our page that lists all tags in use](https://ropensci.org/tags/) and re-use an existing tag rather than creating a new one e.g. ‘packages’ exists, so use that, rather than ‘package’.

For a post about your peer-reviewed package, use ‘Software Peer Review’, ‘community’, ‘packages’, the package name, and any others you see fit.

#### 3.5.1.2 Social media metadata (optional)

Delete `description`, `socialImg` and `socialAlt` YAML fields if you don’t use them.

#### 3.5.1.3 Default social media text (optional)

Provide default text for social media post (Mastodon and LinkedIn) when a reader clicks the “Share on Mastodon” button by replacing the value of `social: "A post about blabla by @username@server.extension!"`. Consider including your (and your coauthors) Mastodon handle(s) (`@username@server.extension`) in the post text to ensure you get notified when someone shares your post.

### 3.5.2 Images - General

Images can either be [external](#addimage) or created in [rmarkdown](#addfigure). Regardless of how images are included, they should all contain **alt** text and consider the following features.

**Alt text**\
Every image should be accompanied by alternative text to make it more accessible and provide a better user experience. The alternative text should convey the meaning or content that is displayed in the image. Refer to this [decision tree regarding when to add alternative text](https://www.w3.org/WAI/tutorials/images/decision-tree/); to this [tutorial for details on what should go in alternative text](https://www.w3.org/WAI/tutorials/images/informative/); and to this [post about the importance of context in alternative text](https://archive.ph/MnUEL), and see the following sections for how to include alt text.

If you include a picture with text (like a comment on a post or a phrase on a wall), include the text you want to highlight from that image in the alt-text.

**Image features**

- Consider transparent backgrounds as the blog background is not white (hex logos etc. will look better this way)
- Keep images \< 1 mb
  - Large images can be compressed/optimized with tools like
  - [OptiPNG](http://optipng.sourceforge.net/) (Local software, [also integrates with rmarkdown](https://bookdown.org/yihui/rmarkdown-cookbook/optipng.html))
  - [minimage](https://github.com/ardata-fr/minimage) (Local software)
  - [TinyPNG](https://tinypng.com/) (Online tool)

### 3.5.3 Images - External

> This section refers to images that are **not** generated from R Markdown. If you want to **generate** images from R Markdown use [our R Markdown template](https://github.com/ropensci/roweb3/blob/HEAD/archetypes/Rmd/index.md) and see [next subsection](#addfigure). Choose images that are relevant, clear, and useful to the reader. Images should support the content and should include [Alt text](#images---general) to meet our accessibility requirements. We generally prefer not to use AI-generated or AI-modified images.

**File location**\
All images go in the same folder as your post source (`/content/blog/YYYY-MM-DD-slug/`) (do not link to external services like imgur). To reference them in your post, use `name-of-image.png`.

**Attribution** If an image isn’t your own original work (e.g., a photo, illustration, or a diagram from an external source), make sure you have the right to use it and give proper attribution. Check the image’s license (such as Creative Commons) for what attribution is required, and credit the creator and source, typically right below the image or in the caption if the license requires it. When in doubt, prefer images you created yourself or that are explicitly labeled for reuse.

**Insert an image**

- **Insert** an image with either `figure` or `imgtxt` short codes
  - Note the use of `alt =` to specify [alt text](#images)
  - `{{< figure src = "image-name.png" alt = "informative description" >}}`
  - imgtxt:

&nbsp;

    {{< imgtxt src = "image-name.png" alt = "informative description">}} 
    Text to right 
    {{< /imgtxt >}}

**Image placement**

- Basic positioning with `{{< figure >}}` and `class`

  `{{< figure src = "image-name.png" alt = "informative description" class = "center" >}}`

  - `pull-left` - Left-align the picture and wrap text around it
  - `center` - Center the picture (no text wrapping)
  - `pull-right` - Right-align the picture and wrap text around it

![](images/figure.png)

- Specific text next to image with `{{< imgtxt >}}`

  `{{< imgtxt src = "image-name.png">}} Text to right {{</ imgtxt >}} Text below`

  - Only text between `{{< imgtxt >}}` and `{{</ imgtxt >}}` is to the right of the figure

![](images/imgtxt.png)

- For images side-by-side, create a composite and insert as a single image
  - Consider [gimp](https://www.gimp.org) for free and open source image manipulation software
  - Consider the R package [patchwork](https://patchwork.data-imaginist.com/) for combining R figures

**Other details**

- Control image **size** with `width`\
  `{{< figure src = "image-name.png" width = "400" alt = "informative description">}}`

- Make the image a **hyperlink** with `link`\
  `{{< figure src = "image-name.png" alt = "informative description" link = "http://hyperlink">}}`

**Important!** In **R Markdown** (i.e. in \*.Rmd files but NOT \*.md files), these Hugo shortcodes need to be escaped:

`<!--html_preserve-->`\
`{{< figure src=\"name-of-image.png\" width=\"400\" alt=\"informative description\">}}`\
`<!--/html_preserve-->`

- If a post does not exist in English, you must create “language-specific resources”: for a post in Spanish, an image called `image.png` must be renamed `image.es.png` and be referred to like that in the figure shortcode: `{{< figure src = "image.es.png" alt = "informative description">}}`

**Image gallery**

If you want to display images in a nice gallery, where clicking on an image makes it appear much larger, you can use an Image Gallery. Please note that Alt text is not supported in the gallery, so ensure that the surrounding text provides the same relevant information or context conveyed by the images. Do not rely on the images alone to communicate essential information. [Read this blog post about R-universe, which is a good example of how to describe the images in the text and use the gallery](https://ropensci.org/blog/2023/02/27/runiverse-discovering/). 1. In the post YAML metadata add `photogallery: yes`. 1. In the post add each gallery like so:

    {{< gallery >}}
    {{< figureforgallery src="search2.png" alt="Screenshot of r-universe simple search results." >}}
    {{< figureforgallery src="search3.png" alt="Screenshot of r-universe advanced search query." >}}
    {{< figureforgallery src="search4.png" alt="Screenshot of r-universe advanced search results." >}}
    {{< /gallery >}}

[Example post](https://ropensci.org/blog/2023/02/27/runiverse-discovering/), [source](https://github.com/ropensci/roweb3/blob/main/content/blog/2023-02-27-runiverse-discovering/index.md).

### 3.5.4 Images - Rmd-created

**File location**\
When using [our R Markdown template](https://github.com/ropensci/roweb3/blob/HEAD/archetypes/Rmd/index.md) the knitr hook in the setup chunk actually creates the necessary Hugo shortcodes. Therefore you don’t need to worry about paths.

**Image details**\
In the chunk producing a figure, use the `hugoopts` chunk option to control the **alt text** and other elements. `hugoopts` is a named list that can have all elements described in the [documentation of the Hugo figure shortcode](https://gohugo.io/content-management/shortcodes/#figure) except for `title`.

```` markdown
```{r chunkname, hugoopts=list(alt="alternative text please make it informative", caption="this is what this image shows, write it here or in the paragraph after the image as you prefer", width=300)} 
plot(1:10)
```
````

This chunk above produces a figure with *“alternative text please make it informative”* as alternative text, *“title of the image”* as title, *“this is what this image shows, write it here or in the paragraph after the image as you prefer”* as caption, and a width of 300 pixels.

### 3.5.5 Citations and footnotes

To add citations, refer to them in the body of your post as footnotes:

    Citation of the primary literature[^1].
    Citation of an R package[^2].
    Citation of a website[^3].

And list your sources at the bottom of your post:

    [^1]: Sciaini, M., Fritsch, M., Scherer, C., & Simpkins, C. E. (2018). NLMR and landscapetools: An integrated environment for simulating and modifying neutral landscape models in R. Methods in Ecology and Evolution, 9(11), 2240-2248. <https://doi.org/10.1111/2041-210X.13076>
    [^2]: Elin Waring, Michael Quinn, Amelia McNamara, Eduardo Arino de la Rubia, Hao Zhu and Shannon Ellis (2019). skimr: Compact and Flexible Summaries of Data. R package version 2.0.2. https://CRAN.R-project.org/package=skimr
    [^3]: Hugo static site generator. https://gohugo.io/

#### 3.5.5.1 Finding citations

To get the citation for an R package, run `citation("packagename")`.

To get the citation for an article, you can use the RStudio Addin for [rcrossref](https://docs.ropensci.org/rcrossref/), or get the citation from a paper’s DOI by running e.g.

    rcrossref::cr_cn("10.1111/2041-210X.13076", format="text", style="apa")

    [1] "Sciaini, M., Fritsch, M., Scherer, C., & Simpkins, C. E. (2018). NLMRandlandscapetools: An integrated environment for simulating and modifying neutral landscape models inR. Methods in Ecology and Evolution, 9(11), 2240–2248. doi:10.1111/2041-210x.13076"

To get the citation for an article in [Google Scholar](https://scholar.google.com/), find the article, click the quote symbol (in search results under the article) to open the “Cite” window, and copy the APA style text.

![Get a citation from Google Scholar.](images/citation-gscholar.png)

### 3.5.6 Referencing social media posts

We no longer recommend embedding social media posts directly, as posts can always be deleted and the context in the blog post is lost when that happens.

Instead, we recommend using a [block quote](#blockquotes) linking the post. [Example](https://ropensci.org/blog/2021/02/03/targets/), [source](https://github.com/ropensci/roweb3/blob/0528c5a9e0ea781dd78a9f70c1e49d034f39fd69/content/blog/2021-02-03-targets/index.md?plain=1#L35).

### 3.5.7 Block quotes

#### 3.5.7.1 Block quotes with no attribution

E.g. if you want to highlight a sentence from the post itself.

Block quotes are paragraphs starting with `>`.

If you want to have them right-align add `{.blockquote .text-right}` right after the paragraph e.g.

``` markdown
> blabla
blabla
blabla
{.blockquote .text-right}
```

If you want to have them centered add `{.blockquote .text-center}` right after the paragraph e.g.

``` markdown
> blabla
blabla
blabla
{.blockquote .text-center}
```

#### 3.5.7.2 Block quotes with attribution

If you want to add a block quote with an author name, use:

``` markdown
{{< quote footer="Author Name">}}
Blablablabla  
{{< /quote >}}
```

If you want to add a block quote with an author name and a source, use:

``` markdown
{{< quote footer="Author Name" cite="[good book](url)">}}
Blablablabla  
{{< /quote >}}
```

If you want to center the block quote add the align variable:

``` markdown
{{< quote footer="Author Name" cite="[good book](url)" align="center">}}
Blablablabla  
{{< /quote >}}
```

If you want to right-align the block quote add the align variable:

``` markdown
{{< quote footer="Author Name" cite="[good book](url)" align="right">}}
Blablablabla  
{{< /quote >}}
```

Note that this syntax also work for quotes without attribution!

``` markdown
{{< quote align="center">}}
Blablablabla  
{{< /quote >}}
```

### 3.5.8 Tables

If you want to use e.g. [striped tables](https://getbootstrap.com/docs/4.6/content/tables/), add `{.table .table-responsive .table-striped}` right after the last line of the table.

``` markdown
Header   | Other Header | Another Header
---------|----------------|-------------------
Value 11 | Value 12       | Value 13
Value 21 | Value 22       | Value 23
Value 31 | Value 32       | Value 33
{.table .table-responsive .table-striped}
```

### 3.5.9 Examples

Comparing the raw Markdown to the live posts in these examples might be helpful.

- A blog post about a package that has passed software peer review. Compare [raw markdown](https://raw.githubusercontent.com/ropensci/roweb3/HEAD/content/blog/2019-10-21-rmangal.md) with the [live post](https://ropensci.org/blog/2019/10/21/rmangal/).

- A tech note. Compare [raw markdown](https://raw.githubusercontent.com/ropensci/roweb3/HEAD/content/blog/2018-10-06-av-release.md) with the [live tech note](https://ropensci.org/technotes/2018/10/06/av-release/).

## 3.6 Multilingual posts

**Please discuss your post’s language with blog editors!**

- Our website’s default language is English so only posts in English are called `index.md`.
- For **translating** a post, create a file in the same folder as the original post but called `index.<two-letter-language-code>.md`, for instance `index.es.md`. Translate tags, title, description too.
- For a post in a single non-English language omit the `index.md` file and only use the `index.XX.md` file using the appropriate language code (e.g., `index.es.md` for a Spanish-only post).
- Add an author file in `content/author/author-name/_index.<two-letter-language-code>.md` even if it only duplicates `content/author/author-name/_index.md`.
- If you are writing the first blog entry for a particular language (yay!), please ask blog editors to notify the website team so we can add translation for the blog infrastructure (such as “Share this page” and similar phrases).
- Feel free to checkout the [rOpenSci translation guide](https://translationguide.ropensci.org/) for how we are translating rOpenSci material in general.

## 3.7 Style Guide

- **Formatting**
  - For package names, functions, and code, follow the [tidyverse style guidance](https://style.tidyverse.org/documentation.html#r-code).
  - Format package names as regular text (no quotes).
  - Do not use markdown in titles (but you can use them in headings).
  - Use \## and \### to format headings in your post, i.e. section titles as \## (h2) and subsections as \### (h3), \#### (h4).
  - Add new line at end of each sentence ([makes diffs easier to interpret and easier for editor to suggest specific changes](https://cirosantilli.com/markdown-style-guide#line-wrapping)).
  - ‘rOpenSci’ not ‘ROpenSci’
- **Links and images**
  - When adding rOpenSci links to your post, use relative instead of absolute URLs e.g. `/blog/` instead of `https://ropensci.org/blog/`.
  - When linking to [rOpenSci packages](https://ropensci.org/packages/) use their docs.ropensci.org URL, e.g. https://docs.ropensci.org/target/.
  - Use [Hugo shortcodes](https://gohugo.io/content-management/shortcodes/#use-hugos-built-in-shortcodes) (not html) to add images, gists etc.
  - In R Markdown wrap Hugo shortcodes between html preserve tags as shown in the [template](https://github.com/ropensci/roweb3/blob/HEAD/archetypes/Rmd/index.md).
  - Instead of using html widgets (`DT`, `leaflet`, etc.), include a screenshot and use the `link` option of the [Hugo `figure` shortcode](https://gohugo.io/content-management/shortcodes/#use-hugos-built-in-shortcodes) to direct readers to an online version of the widget.
  - Use informative [alternative text](#addimage) for all images.
- **Language**
  - **All languages** Avoid Latin phrases such as “e.g.” (for instance) or “i.e.” (that is to say). Use phrases in the language of your post instead.
  - **English** - Use title case for the title of your post; use sentence case for headings inside the post.
  - **Non-English** - If using English words, use italics for the word in English and translate directly in parentheses the first time it is mentioned

## 3.8 Pre-submission checks

### 3.8.1 Knit post

If using the R Markdown template, knitting `index.Rmd` (RStudio knit button, or `blogdown::build_site(build_rmd = <path_to_file>)`) will generate `index.md`. Commit both `index.Rmd` and `index.md`.

### 3.8.2 Check with `roblog`

You can use functions in the [roblog package to do some automated checks](https://docs.ropensci.org/roblog/articles/checks-guidance.html) on your post.

- `ro_lint_md()` to check and enforce use of complete alternative descriptions for image, of relative links to rOpenSci website, of [Hugo shortcodes](https://gohugo.io/content-management/shortcodes/#use-hugos-built-in-shortcodes).
- `ro_check_urls()` to check for URLs that might be broken

### 3.8.3 Author Checklist

Pick the appropriate checklist for your post and ensure you checked everything off. Notice the copy-paste button at the top-right corner of the list.

#### 3.8.3.1 Posts on peer-reviewed packages

``` markdown
* [ ] I have read the Content Guidelines.
* [ ] I have read the Technical Guidelines.
* [ ] I used or followed the R Markdown or Markdown template.
* [ ] I have followed the Style Guide.
* [ ] I created or updated my author metadata with correct folder name.
* [ ] I have added relevant tags after browsing existing tags (including "community" tag).
* [ ] I have added the "tech notes" tag if this is a technote.
* [ ] I ran `roblog::ro_lint_md()` on index.md (optional).
* [ ] I ran `roblog::ro_check_urls()` on index.md (optional).
* [ ] I ran a spell-check on index.md.
* [ ] This post reflects my own words and thoughts. While I may have used AI assistance, this post was not fully AI-generated.
* [ ] I have added the tags - Software Peer Review, my-packagename.
* [ ] I have added the package-version YAML tag.
* [ ] I have added acknowledgement of the reviewers' work (with links to reviewers).
* [ ] I have added a link to the software peer review thread.
```

#### 3.8.3.2 Other posts

``` markdown
* [ ] I have read the Content Guidelines.
* [ ] I have read the Technical Guidelines.
* [ ] I used or followed the R Markdown or Markdown template.
* [ ] I have followed the Style Guide.
* [ ] I created or updated my author metadata with correct folder name.
* [ ] I have added relevant tags after browsing existing tags (including "community" tag).
* [ ] I have added the "tech notes" tag if this is a technote.
* [ ] I ran `roblog::ro_lint_md()` on index.md (optional).
* [ ] I ran `roblog::ro_check_urls()` on index.md (optional).
* [ ] I ran a spell-check on index.md.
* [ ] This post reflects my own words and thoughts. While I may have used AI assistance, this post was not fully AI-generated.
```

### 3.8.4 Local preview

If you wish to preview your post locally, as it will appear in our site, you must install Hugo. To install, refer to [Hugo docs](https://gohugo.io/getting-started/installing/) or run `blogdown::install_hugo()` using the version recorded in [netlify.toml](https://github.com/ropensci/roweb3/blob/HEAD/netlify.toml).

**Note:** You can also preview your blog post online through the pull request before the final submission at `https://deploy-preview-123--ropensci.netlify.app/blog/` where 123 is the number of your PR, or via the checks that appear at the bottom of the pull request.

Then run `hugo serve` or `blogdown::serve_site()` in the repo directory to start a local server on http://localhost:1313 (or another one indicated by blogdown).

**Note:** If you are used to using hugodown you can use it instead to serve the website.

The version of Hugo used by the rOpenSci web server is defined in [netlify.toml](https://github.com/ropensci/roweb3/blob/HEAD/netlify.toml).

When this preview looks good to you, you should submit your post as a pull request.

## 3.9 Submit draft post

### 3.9.1 Create draft pull request

- Open a [**draft** pull request (PR)](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/about-pull-requests#draft-pull-requests) from your fork ([using the web interface](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request-from-a-fork), see step 8 for creating a **draft**), or [`usethis::pr_push()`](https://usethis.r-lib.org/articles/articles/pr-functions.html#submit-pull-request) that will save you some work and that will in the end open the same web interface where you can choose Draft PR in the last step)

- If you opened a PR instead of a **draft** PR, you can [convert it to a draft](https://docs.github.com/en/free-pro-team@latest/github/collaborating-with-issues-and-pull-requests/changing-the-stage-of-a-pull-request#converting-a-pull-request-to-a-draft) by clicking on “Still in progress? Convert to draft” on the right panel under “Reviewers”.

**If you use generative AI tools to help create your PR**, make sure the result still follows this guide — our templates, style guide, and the [Content Guidelines](#authorcontent). We reserve the right to close PRs that modify more files or folders than necessary, or that don’t follow our templates and guidelines.

### 3.9.2 Add checklist

In the first comment of your pull request submitting a post, please copy-paste the [checklist](#checklists) corresponding to your post and check off the items.

### 3.9.3 Preview online

From the PR, Netlify will start building the new version of the site within seconds and you can preview your changes to make sure everything looks as intended. Otherwise push additional fixes till things look right.

![Some checks haven't completed yet.](images/hugochecks.png)

![All checks have passed.](images/hugocheckspassed.png)

### 3.9.4 Submit post

- Mark the draft PR as ready for review at least one week prior to the planned publication date. When you get approval for a post idea you’ll be told who to ping as your reviewer.

[^1]: If you don’t use RStudio you can still use the addin, but the new post will be opened in the editor returned by [`getOption("editor")`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/options.html), that you might need to configure.

[^2]: In Hugo speak, we’d say your post is a [leaf bundle](https://gohugo.io/content-management/page-bundles/#leaf-bundles).
