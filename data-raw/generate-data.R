n <- 100
library(tidyverse)
set.seed(26775)

confounding <- tibble(
  z = rnorm(n),
  x = z + rnorm(n),
  y = 0.5 * x + z + rnorm(n)
)

usethis::use_data(confounding)

set.seed(472046)

collider <- tibble(
  x = rnorm(n),
  y = x + rnorm(n),
  z = 0.45 * x + 0.77 * y + rnorm(n)
)

usethis::use_data(collider)


set.seed(44433)

mediator <- tibble(
  x = rnorm(n),
  z = x + rnorm(n),
  y = z + rnorm(n)
)

usethis::use_data(mediator)


set.seed(839)

m_bias <- tibble(
  u1 = rnorm(n),
  u2 = rnorm(n),
  z = 8 * u1 + u2 + rnorm(n),
  x = u1 + rnorm(n, sd = 1),
  y =  x + u2 + rnorm(n, sd = 1)
)

usethis::use_data(m_bias)

causalquartet <- bind_rows(confounding, collider, mediator, m_bias) %>%
  mutate(type = rep(c("(2) Confounder", "(1) Collider", "(3) Mediator", "(4) M-Bias"), each = 100))

usethis::use_data(causalquartet)
