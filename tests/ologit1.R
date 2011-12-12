#
library(ZeligOrdinal)

data(sanction)

z.out1 <- zelig(
                cost ~ mil + coop,
                model = "ologit", 
                data = sanction
                )

x.low <- setx(z.out1, coop = 1)
x.high <- setx(z.out1, coop = 4)

s.out1 <- sim(z.out1, x = x.low, x1 = x.high)

summary(z.out1)
plot(s.out1)
