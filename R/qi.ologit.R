qi.ologit <- function(z, x, x1=NULL, y=NULL, num=1000, param=NULL) {


  simulations <- coef(param)
  coef <- coef(z)

  # simulations on coefficients
  sim.coef <- simulations[,1:length(coef)]

  # simultations on zeta, and define theta
  sim.zeta <- sim.theta <- simulations[,-1:-length(coef)]

  # just copying this over. looks fishy
  sim.zeta[,-1] <- exp(sim.theta[,-1])
  sim.zeta <- t(apply(sim.zeta, 1, cumsum))

  #
  k <- length(z[["zeta"]])+1
  lev <- z[["lev"]]

  # remove (Intercept), make sure matrix is numeric
  mat <- as.numeric(as.matrix(x)[,-1])

  # compute eta
  eta <- mat %*% t(sim.coef)
  
  #
  
  

  # print(as.matrix(x)[,-1])
  # print(x)
  

  q()
}
