#'
#' @param html html
#'
#' @keywords internal
#'
#' @importFrom rvest html_elements html_text

trustpilot_get_review_text <- function(html) {

  html %>%
    rvest::html_elements(".review-content__text") %>%
    rvest::html_text(trim=T)
}
