#' Show template
#'
#' @param filename Filename
#' @param lang Language (for instance markdown)
#' @param details Whether to show as details
#' @param yaml_only 
#' @param ... passed to `details::details()`
#'
#' @export
#'
show_template <- function(filename, 
                          lang = "markdown",
                          details = FALSE,
                          yaml_only = FALSE,
                          ...) {
  lines <- suppressWarnings(
    if(grepl("roweb3", filename)) {
      readLines(filename)
    } else {
      readLines(
        system.file(
          file.path("templates", filename),
          package = "blogguidance"
        )
      )
      
    }
  ) 
  lines <- gsub("\\{\\{", "{{{", lines)
  lines <- gsub("\\}\\}", "}}}", lines)
  if (yaml_only) {
    lines <- bookdown:::fetch_yaml(lines)
  }
  
  lines |>
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

#' Show checklist
#'
#' @param filenames 
#'
#' @return text
#' @export
#'
show_checklist <- function(filenames) {
  filenames <- system.file(
    file.path("checklists", filenames), 
    package = "blogguidance"
  )
  purrr::map(filenames, 
             readLines) |> 
    unlist() |>
    gluedown::md_task() |>
    glue::glue_collapse("\n") -> x
  
  glue::glue("````markdown\n{x}\n````") |> 
    knitr::asis_output()
}