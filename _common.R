knitr::opts_chunk$set(
  cache = TRUE,
  echo = FALSE
)

library("magrittr")

show_template <- function(filename, lang = "markdown") {
  suppressWarnings(
    readLines(
      file.path("templates", filename)
    )
  ) %>%
    glue::glue_collapse(sep = "\n") -> template

glue::glue("````{lang}\n{template}\n````")
}