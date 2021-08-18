
#' @param html html
#'
#' @keywords internal
#'
#' @import rvest
#' @import dplyr


yelp_get_review <- function(html) {

  review <- html      %>%
    rvest::html_elements("div") %>%
    rvest::html_elements(xpath = '//span[@class=" raw__373c0__tQAx6"]') %>%
    rvest::html_text()
}
