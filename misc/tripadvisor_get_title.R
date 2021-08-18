
#' @param html html
#'
#' @keywords internal
#'
#' @import rvest
#' @import dplyr

get_tripadvisor_title <- function(html) {
  # for hotels
  title <- html %>%
    rvest::html_elements("[class='hotels-review-list-parts-ReviewTitle__reviewTitleText--3QrTy']") %>%
    rvest::html_text()
}

get_tripadvisor_title_attr <- function(html) {
  # for attractions and restaurants
  title <- html %>%
    rvest::html_elements("[class='noQuotes']") %>%
    rvest::html_text()
}
