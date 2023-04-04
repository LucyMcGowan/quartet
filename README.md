
<!-- README.md is generated from README.Rmd. Please edit that file -->

# quartet

<!-- badges: start -->
<!-- badges: end -->

The quartet package is a collection of datasets aimed to help data
analysis practitioners and students learn key statistical insights in a
hands-on manner. It contains:

- Anscombe’s Quartet
- Causal Quartet
- Datasaurus Dozen

## Installation

You can install the development version of quartet like so:

``` r
devtools::install_github("LucyMcGowan/quartet")
```

## Anscombe’s Quartet

The goal of the `anscombe_quartet` data set is to help drive home the
point that visualizing your data is important. Francis Anscombe
generated these four datasets to demonstrate that statistical summary
measures alone cannot capture the full relationship between two
variables (here, `x` and `y`). Anscombe emphasized the importance of
visualizing data prior to calculating summary statistics.

- Dataset 1 has a linear relationship between `x` and `y`
- Dataset 2 has shows a nonlinear relationship between `x` and `y`
- Dataset 3 has a linear relationship between `x` and `y` with a single
  outlier
- Dataset 4 has shows no relationship between `x` and `y` with a single
  outlier that serves as a high-leverage point.

In each of the datasets the following statistical summaries hold: \*
mean of `x`: 9 \* variance of `x`: 11 \* mean of `y`: 7.5 \* variance of
y: 4.125 \* correlation between `x` and `y`: 0.816 \* linear regression
between `x` and `y`: `y = 3 + 0.5x` \* $R^2$ for the regression: 0.67

## Example

``` r
library(tidyverse)
library(quartet)

ggplot(anscombe_quartet, aes(x = x, y = y)) +
  geom_point() + 
  geom_smooth(method = "lm", formula = "y ~ x") +
  facet_wrap(~dataset)
```

<img src="man/figures/README-unnamed-chunk-2-1.png" width="100%" />

## Causal Quartet

The goal of the `causal_quartet` data set is to help drive home the
point that when presented with an exposure, outcome, and some measured
factors, statistics alone, whether summary statistics or data
visualizations, are not sufficient to determine the appropriate causal
estimate. Additional information about the data generating mechanism is
needed in order to draw the correct conclusions. See [this
paper](https://github.com/LucyMcGowan/writing-quartet/blob/main/manuscript.pdf)
for details.

## Example

``` r
ggplot(causal_quartet, aes(x = x, y = y)) +
  geom_point() + 
  geom_smooth(method = "lm", formula = "y ~ x") +
  facet_wrap(~dataset)
```

<img src="man/figures/README-unnamed-chunk-3-1.png" width="100%" />

``` r
causal_quartet %>%
  nest_by(dataset) %>%
  mutate(`Y ~ X` = round(coef(lm(y ~ x, data = data))[2], 2),
         `Y ~ X + Z` = round(coef(lm(y ~ x + z, data = data))[2], 2),
         `Correlation of X and Z` = round(cor(data$x, data$z), 2)) %>%
  select(-data, `Data generating mechanism` = dataset) %>%
  knitr::kable()
```

| Data generating mechanism | Y \~ X | Y \~ X + Z | Correlation of X and Z |
|:--------------------------|-------:|-----------:|-----------------------:|
| \(1\) Collider            |      1 |       0.55 |                    0.7 |
| \(2\) Confounder          |      1 |       0.50 |                    0.7 |
| \(3\) Mediator            |      1 |       0.00 |                    0.7 |
| \(4\) M-Bias              |      1 |       0.88 |                    0.7 |

## Datasaurus Dozen

Similar to Anscombe’s Quartet, the Datasaurus Dozen has additional data
sets where the mean, variance, and Pearson’s correlation are identical,
but visualizations demonstrate the large difference between datasets.
This dataset is rexported from the
[datasauRus](https://CRAN.R-project.org/package=datasauRus) R package.

## Example

``` r
ggplot(datasaurus_dozen, aes(x = x, y = y)) +
  geom_point() + 
  geom_smooth(method = "lm", formula = "y ~ x") +
  facet_wrap(~dataset)
```

<img src="man/figures/README-unnamed-chunk-5-1.png" width="100%" />

## References

Anscombe, F. J. (1973). “Graphs in Statistical Analysis”. American
Statistician. 27 (1): 17–21. <doi:10.1080/00031305.1973.10478966>. JSTOR
2682899.

Davies R, Locke S, D’Agostino McGowan L (2022). *datasauRus: Datasets
from the Datasaurus Dozen*. R package version 0.1.6,
<https://CRAN.R-project.org/package=datasauRus>.

Matejka, J., & Fitzmaurice, G. (2017). Same Stats, Different Graphs:
Generating Datasets with Varied Appearance and Identical Statistics
through Simulated Annealing. CHI 2017 Conference proceedings: ACM SIGCHI
Conference on Human Factors in Computing Systems. Retrieved from
<https://www.autodesk.com/research/publications/same-stats-different-graphs>
