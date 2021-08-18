#'
#' @param base_url url provided by user
#'
#' @keywords internal
#'
#' @importFrom xml2 read_html
#' @importFrom rvest html_elements html_elements html_attr
#' @importFrom dplyr pull mutate
#' @importFrom tibble tibble

trustpilot_next_page <- function(base_url){

  base_url              %>%
    xml2::read_html()   %>%
    rvest::html_elements(xpath = '//*[@class="pagination-container AjaxPager"]') %>%
    rvest::html_elements("a")  %>%
    rvest::html_attr("href") %>%
    tibble::as_tibble() %>%
    dplyr::mutate(value = paste0(sub("/review.*","",base_url), value)) %>%
    dplyr::pull(value)
}

