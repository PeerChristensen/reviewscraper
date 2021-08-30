
<!-- README.md is generated from README.Rmd. Please edit that file -->

# reviewscraper <a><img src='man/figures/reviewscraper_logo.png' align="right" height="200" /></a>

<!-- badges: start -->
<!-- badges: end -->

The reviewscraper package allows users to scrape online reviews from
Amazon, Trustpilot and Yelp.

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

snoop_url <- "https://www.amazon.com/Crook-Cook-Platinum-Recipes-Kitchen/product-reviews/1452179611/ref=cm_cr_dp_d_show_all_btm?ie=UTF8&reviewerType=all_reviews"

from_crook_to_cook <- get_reviews(base_url = snoop_url, page_lim = 2, source = "amazon", verbose=T)
#> [1] "https://www.amazon.com/Crook-Cook-Platinum-Recipes-Kitchen/product-reviews/1452179611/ref=cm_cr_dp_d_show_all_btm?ie=UTF8&reviewerType=all_reviews1"
#> [1] "https://www.amazon.com/Crook-Cook-Platinum-Recipes-Kitchen/product-reviews/1452179611/ref=cm_cr_dp_d_show_all_btm?ie=UTF8&reviewerType=all_reviews2"

head(from_crook_to_cook)
#> # A tibble: 6 × 5
#>   reviewer      date       stars title              review                      
#>   <chr>         <date>     <int> <chr>              <chr>                       
#> 1 Kaylee Miller 2018-12-06     5 Crook to Cook, Ex… "I bought this to be a gag …
#> 2 Lauryn        2018-11-08     5 You want Snoop's … "Fans of Snoop Dogg have kn…
#> 3 April A.      2019-10-27     5 Omg the food is s… "I love this cookbook. I ac…
#> 4 Chris J.      2020-08-11     5 Buy It             "Stop playing, buy it, look…
#> 5 luke          2018-10-28     5 Simply Brilliant   "One of the greatest cookbo…
#> 6 Happymomma    2018-10-27     5 I’m impressed!     "Even if you don’t make not…
```

Alternatively, you can use the `get_amazon_reviews()` function and leave
out the `source` argument. Use the `page_lim` argument to choose the
number of pages to scrape.

## Example 2: Reviews of Osteria dell’Orsa in Bologna from Yelp

PLease note that recent changes may affect review data scraped from
Yelp. I might try to fix such issues in the future.

``` r
orsa_url <- "https://www.yelp.com/biz/osteria-dellorsa-bologna?osq=orsa"

orsa <- get_reviews(base_url = orsa_url, page_lim = 2, source = "yelp")

# ..or use get_yelp_reviews()
```
