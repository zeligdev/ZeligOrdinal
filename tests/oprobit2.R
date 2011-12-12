#
library(ZeligOrdinal)

data(sanction)

sanction$ncost <- factor(sanction$ncost, ordered = TRUE,
                         levels = c("net gain", "little effect", 
                         "modest loss", "major loss"))

z.out2 <- zelig(ncost ~ mil + coop, model = "oprobit", data = sanction)

x.out2 <- setx(z.out2, fn = NULL)

s.out2 <- sim(z.out2, x = x.out2)

summary(z.out2)

plot(s.out2)
