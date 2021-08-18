
#' @param html html
#'
#' @keywords internal
#'
#' @importFrom rvest html_elements  html_attr
#' @import stringr
#' @importFrom readr parse_number

get_tripadvisor_rating <- function(html) {
  # for hotels
  rating <- html                   %>%
    rvest::html_elements("div span")         %>%
    rvest::html_attr("class")             %>%
    stringr::str_subset("ui_bubble_rating") %>%
    .[5:9]                         %>%
    readr::parse_number() / 10
}

get_tripadvisor_rating_attr <- function(html) {
  # for attractions and restaurants
  rating <- html                   %>%
    rvest::html_elements("div span")         %>%
    rvest::html_attr("class")             %>%
    stringr::str_subset("ui_bubble_rating") %>%
    .[6:15]                        %>%
    readr::parse_number() / 10

}
