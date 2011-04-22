param.ologit <- function(z, num=1000) {

  coef <- coef(z)
  zeta <- z$result$zeta
  theta <- zeta[1]

  for (k in 2:length(zeta))
    theta[k] <- log(zeta[k]-zeta[k-1])

  m <- matrix(
              mvrnorm(num, mu=c(coef, theta), Sigma=vcov(z)),
              nrow = num
              )

  lengthcoef <- length(coef)

  list(
       simulations =
       matrix(
         mvrnorm(num, mu=c(coef, theta), Sigma=vcov(z)),
         nrow = num
         ),

       # as.matrix(m[,1:lengthcoef]),
       # alpha = as.matrix(m[,-1:-lengthcoef])
       
       alpha = NULL,
       link = NULL,
       linkinv = .linkinverse
       )
}


# @zeta:
# @eta:
.linkinverse <- function(eta, zeta) {
    tmp1 <- matrix(1, nrow = length(eta), ncol = length(zeta) + 1)

    # ilogit <- function(e, z) {
    #   exp(z - e) / (1 + exp(z - e))
    # }

    tmp1[, 1:length(zeta)] <- exp(zeta - eta) / (1 + exp(zeta - eta))

    # sapply(zeta, ilogit, e = eta)

    tmp1
  }
