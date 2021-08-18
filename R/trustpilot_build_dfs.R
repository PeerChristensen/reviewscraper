

#' @param url url
#' @param page_lim number of pages to parse
#' @param company  company name
#' @param verbose  whether to print current url
#'
#' @keywords internal
#'
#' @importFrom dplyr select

trustpilot_build_dfs <- function(html) {

  # get info
  info <- html %>% trustpilot_get_info()

  # get date
  #date <- html %>% trustpilot_get_date()

  # get review
  #review <- html %>% trustpilot_get_review_text()
  #review <- as.character(review)

  info %>%
    #tibble::add_column(#date = date,
     #                  review=review) %>%
    dplyr::select(#date,
                  consumerName,stars,everything())
}
