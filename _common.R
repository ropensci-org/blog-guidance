knitr::opts_chunk$set(
  cache = TRUE,
  echo = FALSE
)

library("magrittr")

show_template <- function(filename, 
                          lang = "markdown",
                          details = FALSE,
                          yaml_only = FALSE,
                          ...) {
  lines <- suppressWarnings(
    readLines(
      file.path("templates", filename)
    )
  ) 
  
  if (yaml_only) {
    lines <- bookdown:::fetch_yaml(lines)
  }
  
  lines %>%
    glue::glue_collapse(sep = "\n") -> template

  if (details) {
    toshow <- details::details(template, summary = filename,
                     lang = lang,
                     ...)
  } else {
    toshow <- glue::glue("````{lang}\n{template}\n````")
  }

  return(toshow)

}