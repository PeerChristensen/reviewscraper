#' Get Trustpilot Reviews
#'
#' Scrape Trustpilot reviews from a selected number of pages
#' @param base_url url provided by user
#' @param page_lim number of pages to parse
#' @param company  company name
#' @param verbose  whether to print current url
#'
#' @export
#'
#' @import dplyr
#' @import xml2
#'
get_trustpilot_reviews <- function(base_url, page_lim = 3, company = NULL, verbose = TRUE) {

  urls <- NULL
  df   <- NULL
  for (i in 1:page_lim) {

    if (i == 1) {
      # read base_url
      html <- base_url %>% xml2::read_html()
      # get next
      urls[i] <- trustpilot_next_page(base_url)
    } else {
      # read urls[length(urls)]
      html <- urls[length(urls)] %>% xml2::read_html()
      # get next
      urls[i] <- trustpilot_next_page(urls[length(urls)])
    }

    Sys.sleep(1)
    # whether to print the current url
    if (verbose == TRUE) {
      message(urls[length(urls)])
    }

  # if company name is not set, do..
  if (is.null(company)) {
    data <- html %>% trustpilot_build_dfs()
    df <- rbind(df,data)
  }
  # if company name is set, do..
  else {
    data <- html %>%
      trustpilot_build_dfs() %>%
      dplyr::mutate(company = company) %>%
      dplyr::select(company, everything())
    df <- rbind(df,data)

  }
  }
  return(df)
}

