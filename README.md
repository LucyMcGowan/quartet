
<!-- README.md is generated from README.Rmd. Please edit that file -->

# causalquartet

<!-- badges: start -->
<!-- badges: end -->

The goal of causalquartet is to help drive home the point that when
presented with an exposure, outcome, and some measured factors,
statistics alone, whether summary statistics or data visualizations, are
not sufficient to determine the appropriate causal estimate. Additional
information about the data generating mechanism is needed in order to
draw the correct conclusions.

## Installation

You can install the development version of causalquartet like so:

``` r
devtools::install_github("LucyMcGowan/causalquartet)
```

## Example

``` r
library(tidyverse)
library(causalquartet)

ggplot(causalquartet, aes(x = x, y = y)) +
  geom_point() + 
  geom_smooth(method = "lm", formula = "y ~ x") +
  facet_wrap(~type)
```

<img src="man/figures/README-unnamed-chunk-2-1.png" width="100%" />

``` r
causalquartet %>%
  nest_by(type) %>%
  mutate(`Y ~ X` = round(coef(lm(y ~ x, data = data))[2], 2),
         `Y ~ X + Z` = round(coef(lm(y ~ x + z, data = data))[2], 2),
         `Correlation of X and Z` = round(cor(data$x, data$z), 2)) %>%
  select(-data, `Data generating mechanism` = type) %>%
  knitr::kable()
```

| Data generating mechanism | Y \~ X | Y \~ X + Z | Correlation of X and Z |
|:--------------------------|-------:|-----------:|-----------------------:|
| \(1\) Collider            |      1 |       0.55 |                    0.7 |
| \(2\) Confounder          |      1 |       0.50 |                    0.7 |
| \(3\) Mediator            |      1 |       0.00 |                    0.7 |
| \(4\) M-Bias              |      1 |       0.88 |                    0.7 |
