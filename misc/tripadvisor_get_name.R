#' @param html html
#'
#' @keywords internal
#'
#' @import rvest
#' @import dplyr

get_tripadvisor_name <- function(html) {
  #for hotels
  name <- html %>%
    rvest::html_elements("[class='ui_header_link social-member-event-MemberEventOnObjectBlock__member--35-jC']") %>%
    rvest::html_text()
}

get_tripadvisor_name_attr <- function(html) {
  # for attractions and restaurants
  name <- html %>%
    rvest::html_elements("[class='info_text']") %>%
    rvest::html_text()
}
