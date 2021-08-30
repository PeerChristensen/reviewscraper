#' Get Amazon Reviews
#'
#' Scrape Amazon reviews from a selected number of pages
#' @param base_url url provided by user
#' @param page_lim number of pages to parse
#' @param verbose  whether to print current url
#'
#' @export
#'
#' @importFrom rvest html_elements html_text
#' @importFrom xml2 read_html
#' @import dplyr
#' @importFrom tibble tibble
#' @importFrom lubridate mdy
#' @import stringr
#' @importFrom purrr map
#'
get_amazon_reviews <- function(base_url, page_lim = 3, verbose = FALSE) {

  page_nums <- 1:page_lim

  urls <- paste0(base_url, page_nums)

  df <- NULL

  for (url in urls) {
    Sys.sleep(1)

    if (verbose == TRUE) {
      print(url)
    }

    html <- xml2::read_html(url)

    title <- html %>%
      rvest::html_elements("[data-hook='review-title']") %>%
      rvest::html_text() %>%
      stringr::str_trim() %>%
      .[3:12]

    review <- html %>%
      rvest::html_elements("[data-hook='review-body']") %>%
      rvest::html_text() %>%
      stringr::str_trim()

    stars <- html %>%
      rvest::html_elements("[data-hook='review-star-rating']") %>%
      rvest::html_text() %>%
      stringr::str_split(" ") %>%
      purrr::map(1) %>%
      unlist() %>%
      as.integer()

    reviewer <- html %>%
      rvest::html_elements("[class='a-profile-name']") %>%
      rvest::html_text() %>%
      .[3:12]

    date <- html %>%
      rvest::html_elements("[data-hook='review-date']") %>%
      rvest::html_text() %>%
      lubridate::mdy()

    row <- tibble::tibble(reviewer, date, stars, title, review)

    df <- rbind(df, row)
  }

  return(df)
}
