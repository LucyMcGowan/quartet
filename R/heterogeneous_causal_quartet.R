#' Gelman Heterogeneity Causal Quartet Data
#'
#' This dataset contains 88 observations, each generated under a different
#' mechanism treatment heterogeneity with respect to some
#' pre-exposure characteristic, `z`:
#'   * (1) Linear interaction
#'   * (2) No effect then steady increase
#'   * (3) Plateau
#'   * (4) Intermediate zone with large effects
#'
#' The dataframe `heterogeneous_conceptual_causal_quartet` contains the latent
#' "true" causal effect.
#'
#' @references Gelman, A., Hullman, J., & Kennedy, L. (2023). Causal quartets: Different ways to attain the same average treatment effect. arXiv preprint arXiv:2302.12878.
#' @format `heterogeneous_causal_quartet`: A dataframe with 88 rows and 4 variables:
#'
#' * `dataset`: The data generating mechanism
#' * `x`: exposure
#' * `z`: a pre-exposure factor
#' * `y`: outcome
"heterogeneous_causal_quartet"

#' @rdname heterogeneous_causal_quartet
#' @format `heterogeneous_conceptual_causal_quartet`:  A dataframe with 88 rows and 4 variables:
#'
#' * `dataset`: The data generating mechanism
#' * `z`: A pre-exposure factor
#' * `causal_effect`: The true causal effect
"heterogeneous_conceptual_causal_quartet"
