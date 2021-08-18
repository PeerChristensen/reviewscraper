
#' @param html html
#'
#' @keywords internal
#'
#' @import rvest
#'
yelp_get_id <- function(html) {

  id <- html          %>%
    rvest::html_elements(xpath = '//*[@class="fs-block css-m6anxm"]')  %>%
    rvest::html_text() %>%
    .[-1]
}

