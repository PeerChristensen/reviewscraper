#'
#' @param html html
#'
#' @keywords internal
#'
#' @import xml2
#'
yelp_build_dfs <- function(url) {

  Sys.sleep(1)

  # get HTML
  html <- url %>% xml2::read_html()

  # get id
  id <- html %>% yelp_get_id()

  # get time
  date <- html %>% yelp_get_date()

  # get rating
  rating <- html %>% yelp_get_rating()

  # get review
  review <- html %>% yelp_get_review()
  review <- as.character(review)

  # gather variables in tibble
  if (length(id) != length(review)) {
    id = NA
  }
  if (length(date) != length(review)) {
    date = NA
  }
  if (length(rating) != length(review)) {
    rating = NA
  }

  tibble::tibble(id,date,rating,review)

}
