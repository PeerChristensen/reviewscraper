
#' @param html html
#'
#' @keywords internal
#'
#' @import rvest
#' @import dplyr


tripadvisor_get_id <- function(html) {
  # currently not used
  id <- html                   %>%
    rvest::html_elements("div")          %>%
    rvest::html_attr("data-reviewid") %>%
    na.omit()
}
