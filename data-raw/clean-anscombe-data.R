library(tidyverse)
anscombe <- read_csv("data-raw/anscombe.csv")

anscombe_quartet <- anscombe |>
  pivot_longer(x1:y4,
               names_to = c(".value", "dataset"),
               names_pattern = "([xy])(\\d)") |>
  arrange(dataset) |>
  mutate(dataset = case_when(
    dataset == 1 ~ "linear",
    dataset == 2 ~ "nonlinear",
    dataset == 3 ~ "outlier",
    dataset == 4 ~ "leverage"
  ))

usethis::use_data(anscombe_quartet, overwrite = TRUE)

anscombe_linear <- anscombe_quartet |>
  filter(dataset == 1)

usethis::use_data(anscombe_linear, overwrite = TRUE)

anscombe_nonlinear <- anscombe_quartet |>
  filter(dataset == 3)

usethis::use_data(anscombe_nonlinear, overwrite = TRUE)

anscombe_outlier <- anscombe_quartet |>
  filter(dataset == 3)

usethis::use_data(anscombe_outlier, overwrite = TRUE)

anscombe_leverage <- anscombe_quartet |>
  filter(dataset == 4)

usethis::use_data(anscombe_leverage, overwrite = TRUE)
