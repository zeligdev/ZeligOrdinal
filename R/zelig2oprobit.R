zelig2oprobit <- function(formula, data, weights=1, ...) {
  list(
       .function = "polr",

       formula = update(formula, as.factor(.) ~ .),
       method  = "probit",
       # add weights + ignore, if empty, class later
       # weights = weights,
       Hess = TRUE,
       data = data
       )
}

