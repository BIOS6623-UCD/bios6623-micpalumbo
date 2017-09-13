##########################
### BIOS 6623 Project 0
### Michaela Palumbo
### Final Models - Attachment and Pocket Depth
##########################

## Pocket Depth Final Model
pdfinal <- lm(pddiff ~ trtgroup + pdbase, data = dat)
summary(pdfinal)
plot(pdfinal$residuals ~ pdfinal$fitted.values, pch = 20, main = "PD: Residuals vs Fitted Values")
qqnorm(scale(pdfinal$residuals), pch = 20, main = "PD: Normal Q-Q Plot of Residuals")
abline(0, 1, col = "red")

## Attachment Final Model 
atfinal <- lm(atdiff ~ trtgroup + attachbase, data = dat)
summary(atfinal)
plot(atfinal$residuals ~ atfinal$fitted.values, pch = 20, main = "Attachment: Residuals vs Fitted Values")
qqnorm(scale(atfinal$residuals), pch = 20, main = "Attachment: Normal Q-Q Plot of Residuals")
abline(0, 1, col = "red")

confint(atfinal, level = 0.95)

