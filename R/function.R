
#' Main function at user level
#'
#' @param base_url url provided by user
#' @param page_lim number of pages to parse
#' @param verbose  whether to print current url
#' @param source   tre review source

#' @export
#'
#' @import rvest
#' @import dplyr
#' @import lubridate
#' @import stringr
#' @import purrr
#' @import tripR
#' @import yelpR
#' @import trustpilotR

#'
#' @examples
#' get_reviews("https://www.tripadvisor.co.uk/Attraction_Review-g189541-d245024-Reviews-The_Little_Mermaid_Den_Lille_Havfrue-Copenhagen_Zealand.html",2,source = "tripadvisor")


get_reviews <- function(base_url,page_lim = NULL,source,verbose = TRUE) {


  if(source == "trustpilot") {

    df = trustpilotR::get_reviews(base_url,page_lim,source,verbose)
  }

  if(source == "yelp") {

    df = yelpR::get_reviews(base_url,page_lim,source)
  }

  if(source == "tripadvisor") {

    df = tripR::get_reviews(base_url,page_lim,source)
  }

  if(source == "amazon") {

    print("not available")
  }

  return(df)
}
