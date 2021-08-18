#' Get Yelp Reviews
#'
#' Scrape Yelp reviews from a selected number of pages
#' @param base_url url provided by user
#' @param page_lim number of pages to parse
#' @param company  company name
#' @param verbose  whether to print current url
#'
#' @export
#'
#' @import dplyr
#'
get_yelp_reviews <- function(base_url, page_lim = 3, company = NULL, verbose = TRUE) {

  # if page limit is set, do..
  if (!is.null(page_lim)) {
    urls <- yelp_get_pages(base_url)
    urls <- urls[1:page_lim]
  }

  else if (is.null(page_lim)) {
    urls <- yelp_get_pages(base_url)
  }

  df <- NULL
  for (url in urls) {

    # whether to print the current url
    if (verbose == TRUE) {
      message(url)
    }


    data <- url %>% yelp_build_dfs()
    df   <- rbind(df, data)
  }

  # if company name set, do..
  if (!is.null(company)) {
    df$company <- company
  }

  return(df)
}
