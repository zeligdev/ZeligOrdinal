#
library(ZeligOrdinal)

data(sanction)

z.out1 <- zelig(as.factor(cost) ~ mil + coop, model = "oprobit", 
                    data = sanction)

x.low <- setx(z.out1, mil = 0)
x.high <- setx(z.out1, mil = 1)

s.out1 <- sim(z.out1, x = x.low, x1 = x.high)

summary(z.out1)
plot(s.out1)
