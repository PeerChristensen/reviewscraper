
#' @param base_url url provided by user
#'
#' @keywords internal
#'
yelp_get_pages <- function(base_url){

  last_page    = yelp_n_pages(base_url)
  page_numbers = c(1,seq_along(2:last_page) * 10)
  urls         = paste0(base_url,"&start=", page_numbers)
}
