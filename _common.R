knitr::opts_chunk$set(
  cache = TRUE,
  echo = FALSE
)

library("magrittr")

show_template <- function(filename, 
                          lang = "markdown",
                          details = FALSE,
                          ...) {
  suppressWarnings(
    readLines(
      file.path("templates", filename)
    )
  ) %>%
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