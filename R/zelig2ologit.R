zelig2ologit <- function(model, formula, data, weights=1, ...) {
  list(
       .function = "polr",

       formula = update(formula, as.factor(.) ~ .),
       method  = "logistic",
       # add weights + ignore, if empty, class later
       # weights = weights,
       Hess = TRUE,
       data = data
       )
}
