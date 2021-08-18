
#' @param base_url url provided by user
#'
#' @keywords internal
#'
#' @importFrom rvest html_elements html_text
#' @importFrom xml2 read_html


yelp_n_pages <- function(base_url){

  base_url             %>%
    xml2::read_html()  %>%
    rvest::html_elements(xpath='//*[@class=" css-15mgnpa"]') %>%
    rvest::html_text() %>%
    as.numeric() %>%
    max(na.rm=T)
}
