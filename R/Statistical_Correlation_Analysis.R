
# accuracy for right-dominant individuuals
accuracy_r = c(2.6, 7.3, 1.1, 3.6, 2.2, 5.4, 9.9, 1.5, 3.6, 13.3, 9.2, 6.5, 0.9, 2.85, 3.27, 7.3, 11.83, 7.75, 2.25, 3.9, 6.75, 6.38, 7.55, 9.3, 4, 15.35, 2.08, 11.05, 4.55, 1.3, 9.95, 2.75, 8.8, 4.35, 8.05)
# speed for right-dominant individuals
speed_r = c(1.09, 0.9, 1, 1.65, 0.84, 0.86,0.71,0.91, 2.41,0.65,0.76,1.02,1.05,1.84,1.01,0.89, 0.63,1.28, 0.77, 0.99,1.09,1.12, 1.22,0.56,0.85,0.93, 0.81, 0.78,1.69,0.76, 1.02,0.57, 0.67, 0.49, 0.97)
#accuracy for right dominant using left
acc_rl = c(3.3, 10.16, 4.7, 9.8,12.9,11.8, 10.4, 15.4,9.4,17,15.2, 20.1, 4.5, 8.73,5.55, 7.73, 15.2, 4.65, 8.7,13.5, 12.2, 12.95, 11.55, 10.9,14,18.12,13.8,11.05,11.85, 8.83, 10.6, 15.05,3.45,7.45,9)

percentdiff_r = (abs((accuracy_r)-(acc_rl))/accuracy_r)

# accuracy for left-dominant individuals
accuracy_l = c(1.8, 6.2, 14.9, 9.2, 2.25, 5.23, 2.05, 9.7, 6.15, 2.85, 6.45, 10.05, 13.35, 1.25, 3.07, 9.75)
# speed for left-dominant individuals
speed_l = c(0.97, 1.81 ,1.09,0.59,0.47, 1.3, 0.62,1.35,0.91, 0.36, 0.45,0.68, 0.88,0.68,0.58,1.34)
# accuracy for left-dominant using right
acc_lr = c(5.3,6.5,13.2, 3.9,4, 8.9,7.05,10.75, 8.85,6.45, 7.15,12.3, 12.1,7.25, 6.9,7.2)
percentdiff_l = (abs(accuracy_l-acc_lr)/accuracy_l)

#### combined stuff ####



#mean, std dev for right handed accuracy
mean (accuracy_r)
sd(accuracy_r)
length (accuracy_r)
#mean, std dev for right handed speed
mean(speed_r)
sd(speed_r)

#mean, std dev for lefty accuracy
mean(accuracy_l)
sd(accuracy_l)
length (accuracy_l)
#mean, std dev for lefty speed
mean(speed_l)
sd(accuracy_l)

#### plotting the data###
plot (accuracy_r, xlab="Participant#", ylab="Accuracy", main="Accuracy of each right-handed participant")
plot (accuracy_l, xlab="Participant#", ylab="Accuracy", main="Accuracy of each left-handed participant")

### fitting for left accuracy vs speed ###
fit_l <-lm(accuracy_l~speed_l)
residuals (fit_l)
plot(speed_l,accuracy_l,main="Accuracy vs. Speed - left", xlab="Response Time (sec)", ylab="Accuracy (cm)")
abline(fit_l)

#### fitting for right accuracy vs speed ####
fit_r <-lm(accuracy_r~speed_r)
residuals (fit_r)
plot(speed_r,accuracy_r,main="Accuracy vs. Speed - right", xlab="Response Time (sec)", ylab="Accuracy (cm)")
abline(fit_r)
summary(fit_r)

#### fitting for right accuracy vs speed ####
fit_r <-lm(accuracy_r~speed_r)
residuals (fit_r)
plot(speed_r,accuracy_r,main="Accuracy vs. Speed - right", xlab="Response Time (sec)", ylab="Accuracy (cm)")
abline(fit_r)
summary(fit_r)

#### fitting for the covariant ####
fit_cov <-lm(accuracy_r~percentdiff_r)
residuals (fit_cov)
plot(speed_r,accuracy_r,main="Accuracy vs. Handedness", xlab="Handedness - percent difference", ylab="Accuracy (cm)")
abline(fit_cov)
summary(fit_cov)

### T-test for two-sample ###
Control = accuracy_r
Treat = accuracy_l
Control_s = speed_r
Treat_s = speed_l
# t.test(Control,Treat,alternative="less", var.equal=TRUE) #-- this t-test is assuming the standard deviations are equal which are not
t.test(Control,Treat,alternative="less") # this is the test when the std. dev are not equal
t.test(Control_s,Treat_s,alternative="less") # t-test for the speed 
