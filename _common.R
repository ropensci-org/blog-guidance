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
    if(grepl("roweb2", filename)) {
      readLines(filename)
    } else {
      readLines(
        file.path("templates", filename)
      )
      
    }
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

show_checklist <- function(filenames) {
  filenames <- file.path("checklists", filenames)
  purrr::map(filenames, 
             readLines) %>% 
    unlist() %>%
    gluedown::md_task() %>%
    glue::glue_collapse("\n") -> x
  
  glue::glue("````markdown\n{x}\n````") %>% 
    knitr::asis_output()
}