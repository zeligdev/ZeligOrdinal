zelig2ologit <- function(formula, data, weights=1, ...) {
  list(
       .function = "polr",
       
       weights = weights,
       method  = "logistic",
       Hess = TRUE,
       data = data
       )
}
