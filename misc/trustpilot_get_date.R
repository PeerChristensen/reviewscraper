
#' @param html html
#'
#' @keywords internal
#'
#' @importFrom rvest html_elements html_text
#' @import lubridate
#' @importFrom purrr map map_chr
#' @importFrom jsonlite fromJSON
#'
trustpilot_get_date <- function(html) {

  html %>%
    rvest::html_elements(".review-card [data-initial-state='review-dates']") %>%
    rvest::html_text() %>%
    purrr::map(jsonlite::fromJSON) %>%
    purrr::map_chr(1) %>%
    lubridate::date()
}
