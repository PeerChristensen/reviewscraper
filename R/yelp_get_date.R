
#' @param html html
#'
#' @keywords internal
#'
#' @importFrom rvest html_elements html_text
#' @import lubridate
#'
yelp_get_date <- function(html) {

  date <- html  %>%
    rvest::html_elements(xpath = '//span[@class=" css-e81eai"]') %>%
    rvest::html_text() %>%
    .[1:10] %>%
    lubridate::mdy()
}

