#' Get Reviews From Major Review Sites
#'
#' Scrape reviews from a selection of review sites.
#'
#' @param base_url url provided by user
#' @param page_lim number of pages to parse
#' @param verbose  whether to print current url
#' @param source   the review source
#'
#' @export
#'
#'
#'@examples
#'
#'netflix <- "https://www.trustpilot.com/review/www.netflix.com"
#'get_reviews(base_url = netflix, page_lim = 2, source = "trustpilot")
#'
#'snoop <- "https://www.amazon.com/Crook-Cook-Platinum-Recipes-Kitchen/product-reviews/1452179611/ref=cm_cr_dp_d_show_all_btm?ie=UTF8&reviewerType=all_reviews"
#'get_reviews(base_url = snoop, page_lim = 2, source = "amazon")
#'
#'orsa <- "https://www.yelp.com/biz/osteria-dellorsa-bologna?osq=orsa"
#'get_reviews(base_url = orsa, page_lim = 2, source = "yelp")
#'
get_reviews <- function(base_url, page_lim = NULL, source, verbose = TRUE) {

  if (source == "trustpilot") {
    df <- get_trustpilot_reviews(base_url, page_lim)
  }

  if (source == "yelp") {
    df <- get_yelp_reviews(base_url, page_lim)
  }

  #if (source == "tripadvisor") {
  #  df <- get_tripadvisor_reviews(base_url, page_lim)
  #}

  if (source == "amazon") {
    df <- get_amazon_reviews(base_url, page_lim)
  }

  return(df)
}
