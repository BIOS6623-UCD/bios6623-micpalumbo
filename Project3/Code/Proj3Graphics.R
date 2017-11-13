##############################
### BIOS 6623 
### Project 3
### Michaela Palumbo
### Graphics
##############################


# Spaghetti plots of raw data for each outcome
library(ggplot2)
library(gridExtra)
library(lattice)

# blockR
dat.nobRmissing <- dat[!is.na(dat$blockR), ]
bR <- ggplot(data = dat.nobRmissing, aes(x=age, y=blockR, group=id, colour = demind)) + 
  geom_line() + labs(title = "Intelligence Scale-Revised Block Design",
                        x = "age", y = "blockR score", color = "Dementia Diagnosis")

# lattice attempt
xyplot(blockR~age, data = dat.nobRmissing, groups=demind, type = "l")

# animals
dat.noanmissing <- dat[!is.na(dat$animals), ]
an <- ggplot(data = dat.noanmissing, aes(x=age, y=animals, group=id, colour = demind)) + geom_line() +
  labs(title = "Category Fluency for Animals", x = "age", y = "animals score", 
                        color = "Dementia Diagnosis")

# logmemI
dat.nolm1missing <- dat[!is.na(dat$logmemI), ]
lm1 <- ggplot(data = dat.nolm1missing, aes(x=age, y=logmemI, group=id, colour = demind)) + 
  geom_line() + labs(title = "Logical Memory I Scale", x = "age", y = "logmemI score",
                         color = "Dementia Diagnosis")

# logmemII
dat.nolm2missing <- dat[!is.na(dat$logmemII), ]
lm2 <- ggplot(data = dat.nolm2missing, aes(x=age, y=logmemII, group=id, colour = demind))+ 
  geom_line() + 
  labs(title = "Logical Memory II Scale", x = "age", y = "logmemII score", color = "Dementia Diagnosis")

# display all together
grid.arrange(bR, an, lm1, lm2, ncol=2)

# outcomes distributions
par(mfrow = c(2, 2))
hist(dat$blockR, main = "blockR", xlab = "blockR score")
hist(dat$animals, main = "Animals", xlab = "animals score")
hist(dat$logmemI, main = "Logical Memory Score I", xlab = "logmemI score")
hist(dat$logmemII, main = "Logical Memory Score II", xlab = "logmemII score")
