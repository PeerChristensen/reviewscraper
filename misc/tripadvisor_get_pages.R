
#' @param base_url url provided by user
#'
#' @keywords internal
#'
#' @import dplyr
#' @import stringr
#' @importFrom glue glue

get_tripadvisor_pages <- function(base_url){

  last_page <- tripadvisor_n_pages(base_url)
  if (stringr::str_detect(base_url,"Attraction")) {
    page_intervals <- seq_along(1:(last_page-1)) * 10
  } else {
    page_intervals <- seq_along(1:(last_page-1)) * 5
  }
  split_url <- base_url %>%
    stringr::str_split("Reviews") %>%
    unlist()
  combined_urls  = NULL
  for (i in page_intervals){
    combined_urls[i/5] <- glue::glue(split_url[1],"Reviews-or",i,split_url[2])
  }
  urls <- c(base_url,combined_urls) %>%
    na.omit()

}
