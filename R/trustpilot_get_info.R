

#' @param html html
#'
#' @keywords internal
#'
#' @importFrom rvest html_elements html_text
#' @import dplyr
#' @importFrom purrr map_df
#' @importFrom jsonlite fromJSON

trustpilot_get_info <- function(html) {

  html %>%
    rvest::html_elements("[data-initial-state='review-info']") %>%
    rvest::html_text() %>%
    purrr::map_df(jsonlite::fromJSON)
}
