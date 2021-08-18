
#' @param html html
#'
#' @keywords internal
#'
#' @import rvest
#' @import dplyr
#' @import stringr
#' @import purrr

get_tripadvisor_date <- function(html) {
  # for hotels
  date <- html         %>%
    rvest::html_elements("span") %>%
    rvest::html_text()        %>%
    stringr::str_subset("skrev en anmeldelse|wrote") %>%
    stringr::str_split("d\\.") %>%
    purrr::map_chr(2) %>%
    stringr::str_trim()
}

get_tripadvisor_date_attr <- function(html) {
  # for attractions and restaurants
  date <- html %>%
    rvest::html_elements("[class='ratingDate']") %>%
    rvest::html_attrs() %>%
    purrr::map(2) %>%
    unlist()
}
