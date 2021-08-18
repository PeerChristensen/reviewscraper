#' @param base_url url provided by user
#'
#' @keywords internal
#'
#' @import rvest
#' @import xml2
#' @import dplyr
#' @import stringr

tripadvisor_n_pages <- function(base_url) {
  if (stringr::str_detect(base_url, "Hotel")) {
    base_url %>%
      xml2::read_html() %>%
      rvest::html_elements("[class='pageNum ']") %>%
      rvest::html_text() %>%
      as.numeric()
  } else {
    base_url %>%
      xml2::read_html() %>%
      rvest::html_elements("a") %>%
      rvest::html_attr("data-page-number") %>%
      as.numeric() %>%
      max(na.rm = T)
  }
}
