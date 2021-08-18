#'
#' @param base_url url provided by user
#'
#' @keywords internal
#'
#' @import xml2
#' @import rvest
#' @import dplyr
#' @import tibble

tripadvisor_next_page <- function(base_url){

  base_url              %>%
    xml2::read_html()   %>%
    rvest::html_elements(xpath = '//*[@class="_23XJjgWS _22upaSQN _1hF7hP_9 _2QvUxWyA"]') %>%
    rvest::html_elements("a")  %>%
    rvest::html_attr("href") %>%
    tibble::as_tibble() %>%
    dplyr::mutate(value = paste0(sub("/review.*","",base_url), value)) %>%
    dplyr::pull(value)
}

