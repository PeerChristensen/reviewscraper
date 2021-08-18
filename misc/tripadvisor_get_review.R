#' @param html html
#'
#' @keywords internal
#'
#' @import rvest
#' @import dplyr


get_tripadvisor_review <- function(html) {
  # for hotels
  review <- html     %>%
    rvest::html_nodes("q") %>%
    rvest::html_text()
}

get_tripadvisor_review_attr <- function(html) {
  # for attractions and restaurants
  review <- html %>%
    rvest::html_nodes("[class='entry']") %>%
    rvest::html_text() %>%
    tail(10)
}
