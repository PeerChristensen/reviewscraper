
<!-- README.md is generated from README.Rmd. Please edit that file -->

# reviewscraper <a><img src='man/figures/reviewscraper_logo.png' align="right" height="200" /></a>

<!-- badges: start -->
<!-- badges: end -->

The reviewscraper package allows user to scrape online reviews from
Amazon, Tustpilot and Yelp.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("PeerChristensen/reviewscraper")
```

## Example 1: Reviews of Snoop Doggs cookbook on Amazon

``` r
library(reviewscraper)

snoop <- "https://www.amazon.com/Crook-Cook-Platinum-Recipes-Kitchen/product-reviews/1452179611/ref=cm_cr_dp_d_show_all_btm?ie=UTF8&reviewerType=all_reviews"

from_crook_to_cook <- get_reviews(base_url = snoop, page_lim = 2, source = "amazon")
#> [1] "https://www.amazon.com/Crook-Cook-Platinum-Recipes-Kitchen/product-reviews/1452179611/ref=cm_cr_dp_d_show_all_btm?ie=UTF8&reviewerType=all_reviews1"
#> [1] "https://www.amazon.com/Crook-Cook-Platinum-Recipes-Kitchen/product-reviews/1452179611/ref=cm_cr_dp_d_show_all_btm?ie=UTF8&reviewerType=all_reviews2"
```

Alternatively, you can use the `get_amazon_reviews()` function and leave
out the `source` argument. Use the `page_lim` argument to choose the
number of pages to scrape.

## Example 2: Reviews of Osteria dell’Orsa in Bologna from Yelp

``` r
orsa_url <- "https://www.yelp.com/biz/osteria-dellorsa-bologna?osq=orsa"

orsa <- get_reviews(base_url = orsa_url, page_lim = 2, source = "yelp")

# ..or use get_yelp_reviews()
```
