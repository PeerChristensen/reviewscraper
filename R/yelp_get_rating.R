
#' @param html html
#'
#' @keywords internal
#'
#' @import rvest
#' @import dplyr
#' @import stringr

yelp_get_rating <- function(html) {

  rating <- html      %>%
    rvest::html_elements(xpath = '//div[@class=" margin-t1__373c0__38PDp margin-b1-5__373c0__3rO59 border-color--default__373c0__r305k"]') %>%
    rvest::html_children() %>%
    as.character() %>%
    dplyr::as_tibble() %>%
    dplyr::filter(stringr::str_detect(value,"star")) %>%
    dplyr::filter(!stringr::str_detect(value,"Previous review")) %>%
    dplyr::mutate(value = sub(".*aria-label=\"","", value)) %>%
    dplyr::mutate(value = sub("\\s(.*)","",value)) %>%
    dplyr::mutate(value = as.numeric(value)) %>%
    dplyr::pull(value)
}
