# Creating Albumin MAR with ASA histogram

asa <- 1:5
propmissalb <- c(1, 1, 1, 0.5, 0)
dat <- cbind(asa, propmissalb)
dat <- as.data.frame(dat)
str(dat)
dat$asa <- factor(dat$asa)
str(dat)
hist(dat)
barplot(dat$propmissalb, main = "Albumin Missingness Across ASA Levels", xlab = "ASA level", 
        ylab = "proportion of patients missing albumin", names.arg = c(1, 2, 3, 4, 5),
        col = "red", density = c(100, 100, 100, 65, 40))
