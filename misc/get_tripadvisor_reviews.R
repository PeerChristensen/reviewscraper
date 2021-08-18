#' Get Tripadvisor Reviews
#'
#' Scrape Tripadvisor reviews from a selected number of pages
#'
#' @param base_url url provided by user
#' @param page_lim number of pages to parse
#' @param company  company name
#' @param verbose  whether to print current url
#'
#' @import xml2
#' @import dplyr
#' @import lubridate
#' @import stringr
#' @importFrom purrr map
#'
#'
get_tripadvisor_reviews <- function(base_url, page_lim = 3, company = NULL, verbose = TRUE) {

  urls <- NULL
  df   <- NULL
  for (i in 1:page_lim) {

    if (i == 1) {
      # read base_url
      # html <- NULL
      # attempt <- 1
      #
      # while (is.null(html) && attempt <= 4) {
      #   attempt <- attempt + 1
      #
      #   try(
      #     html <- url %>% xml2::read_html()
      #   )
      # }
      #
      # get next
      urls[i] <- tripadvisor_next_page(base_url)

    } else {
      # read urls[length(urls)]
      html <- urls[length(urls)] %>% xml2::read_html()
      # get next
      urls[i] <- tripadvisor_next_page(urls[length(urls)])
    }

    Sys.sleep(1)

    # whether to print the current url
    if (verbose == TRUE) {
      message(urls[length(urls)])
    }




    # get name
    if (stringr::str_detect(base_url, "Attraction|Restaurant")) {
      reviewer <- html %>% get_tripadvisor_name_attr()
      title <- html %>% get_tripadvisor_title_attr()
      date <- html %>% get_tripadvisor_date_attr()
      rating <- html %>% get_tripadvisor_rating_attr()
      review <- html %>% get_tripadvisor_review_attr()
    } else {
      reviewer <- html %>% get_tripadvisor_name()
      title <- html %>% get_tripadvisor_title()
      date <- html %>% get_tripadvisor_date()
      rating <- html %>% get_tripadvisor_rating()
      review <- html %>% get_tripadvisor_review()
    }

    review <- as.character(review)

    # gather variables in tibble
    if (length(date) != length(review)) {
      date <- NA
    }
    if (length(rating) != length(review)) {
      rating <- NA
    }

    tibble::tibble(name, date, rating, title, review)
  }

  urls <- get_tripadvisor_pages(base_url)
  urls <- urls[1:page_lim]

  # if company name is set, do..
  if (is.null(company)) {
    data <- urls %>% purrr::map(tripadvisor_build_dfs)
    data <- do.call("rbind", data)
  }

  # if company name is not set, do..
  else if (!is.null(company)) {
    data <- urls %>% purrr::map(tripadvisor_build_dfs)
    data <- do.call("rbind", data) %>%
      dplyr::mutate(company = company) %>%
      dplyr::select(company, everything())
  }
}
