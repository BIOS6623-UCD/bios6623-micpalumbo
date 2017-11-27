##############################
### BIOS 6623 
### Project 3
### Michaela Palumbo
### Graphics
##############################

# outcomes distributions
hist(dat.final$animals, main = "Animals", xlab = "animals score")

# Spaghetti plot of analysis dataset
library(ggplot2)
library(gridExtra)
library(lattice)


# animals
an <- ggplot(data = dat.final, aes(x=age, y=animals, group=id, colour = demind)) + geom_line() +
  labs(title = "Category Fluency for Animals", x = "age", y = "animals score", 
                        color = "Dementia Diagnosis")
an

# Spaghetti plot with years before diagnosis on the x axis (just for people with dementia diagnosis)
dempats$yearsbeforedx <- dempats$age - dempats$ageonset
an2 <- ggplot(data = dempats, aes(x=yearsbeforedx, y=animals, group = id)) + geom_line() +
                geom_vline(xintercept = 0, color = "red", linetype = "dashed") +
                labs(title = "Patients with Dementia Diagnosis", x = "years before diagnosis", 
                     y = "animals score")
an2



# display both together
grid.arrange(an, an2, ncol=2)
# they look squished so will do them alone

# plot of predicted values for a few of the subjects (5 from each group)?
pred <- mod$model$fitted
pred <- as.data.frame(pred)
pred$predicted <- pred$id
pred$id <- dat.final$id
pred$demin <- dat.final$demind
pred$age <- dat.final$age
# attach the id column
pred[1:50, ]
dat.final[1:50, ]
# choose a few ids from each group
dempats[1:50, ]
# ids with diagnosis: 101, 102, 104, 105, 107 
# ids without diagnosis: 103, 109, 119, 122, 124 
demno[1:50, ]

predsub <- pred[1:199, ]
length(unique(predsub$id))

fitgraph <- ggplot(data = predsub, aes(x=age, y=predicted, group=id, colour = demin)) + geom_line() +
  labs(title = "Fitted Lines for 26 Subjects", x = "age", y = "predicted animals score", 
       color = "Dementia Diagnosis")
fitgraph




