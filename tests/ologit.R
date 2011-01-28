library(zelig.ordinal)

data(sanction)


z.out1 <- zelig(
                cost ~ mil + coop,
                model = "ologit", 
                data = sanction
                )


#summary(z.out1)


# Set the explanatory variables to their means, with 'mil' set
# to 0 (no military action in addition to sanctions) in the baseline
# case and set to 1 (military action in addition to sanctions) in the
# alternative case:

x.low <- setx(z.out1, coop = 1)
x.high <- setx(z.out1, coop = 4)


s.out1 <- sim(z.out1, x = x.low, x1 = x.high)

q()
summary(s.out1)
user.prompt()
plot(s.out1)

##### Example 2: Creating An Ordered Dependent Variable #####

# Create an ordered dependent variable: 
user.prompt()
sanction$ncost <- factor(sanction$ncost, ordered = TRUE,
                         levels = c("net gain", "little effect", 
                           "modest loss", "major loss"))

# Estimate the model:
user.prompt()
z.out2 <- zelig(ncost ~ mil + coop, model = "ologit", data = sanction)
user.prompt()
summary(z.out2)

# Set the explanatory variables to their observed values:  
user.prompt()
x.out2 <- setx(z.out2, fn = NULL)

# Simulate fitted values given Xval and view the results:
user.prompt()
s.out2 <- sim(z.out2, x = x.out2)
user.prompt()
summary(s.out2)















