#Energy Efficiency Data (EED) - Business Analytics Assignment
#Central Tendency, Hypothesis Testing & Correlation/Regression Analysis

getwd()
EED_data = read.csv('C:/Users/HI/Documents/EED.csv', header = TRUE, sep=",")
EED_data
str(EED_data)

#convert categorical columns to factors
EED_data$Orientation = factor(EED_data$Orientation)
EED_data$Glazing_Area_Distribution = factor(EED_data$Glazing_Area_Distribution)


##############################################################
#TASK 3: Central Tendency Analysis
#Variables: Cooling_Load, Surface_Area, Wall_Area, Roof_Area
##############################################################

#Mean, Median, SD, Variance, Range for Cooling_Load
mean(EED_data$Cooling_Load)
median(EED_data$Cooling_Load)
sd(EED_data$Cooling_Load)
var(EED_data$Cooling_Load)
range(EED_data$Cooling_Load)
summary(EED_data$Cooling_Load)

#Mean, Median, SD, Variance, Range for Surface_Area
mean(EED_data$Surface_Area)
median(EED_data$Surface_Area)
sd(EED_data$Surface_Area)
var(EED_data$Surface_Area)
range(EED_data$Surface_Area)
summary(EED_data$Surface_Area)

#Mean, Median, SD, Variance, Range for Wall_Area
mean(EED_data$Wall_Area)
median(EED_data$Wall_Area)
sd(EED_data$Wall_Area)
var(EED_data$Wall_Area)
range(EED_data$Wall_Area)
summary(EED_data$Wall_Area)

#Mean, Median, SD, Variance, Range for Roof_Area
mean(EED_data$Roof_Area)
median(EED_data$Roof_Area)
sd(EED_data$Roof_Area)
var(EED_data$Roof_Area)
range(EED_data$Roof_Area)
summary(EED_data$Roof_Area)

#Mode function (R has no built in mode function)
get_mode <- function(v) {
  uniq_v = unique(v)
  uniq_v[which.max(tabulate(match(v, uniq_v)))]
}
get_mode(EED_data$Cooling_Load)
get_mode(EED_data$Surface_Area)
get_mode(EED_data$Wall_Area)
get_mode(EED_data$Roof_Area)

#Bell Curve (Histogram + Normal Curve) for Cooling_Load
hist(EED_data$Cooling_Load, breaks = 30, freq = FALSE,
     main = "Bell Curve of Cooling Load",
     xlab = "Cooling Load (BTU)", col = "lightblue")
curve(dnorm(x, mean=mean(EED_data$Cooling_Load), sd=sd(EED_data$Cooling_Load)),
      col="red", lwd=2, add=TRUE)

#Bell Curve for Surface_Area
hist(EED_data$Surface_Area, breaks = 30, freq = FALSE,
     main = "Bell Curve of Surface Area",
     xlab = "Surface Area (sq ft)", col = "lightgreen")
curve(dnorm(x, mean=mean(EED_data$Surface_Area), sd=sd(EED_data$Surface_Area)),
      col="red", lwd=2, add=TRUE)

#Bell Curve for Wall_Area
hist(EED_data$Wall_Area, breaks = 30, freq = FALSE,
     main = "Bell Curve of Wall Area",
     xlab = "Wall Area (sq ft)", col = "lightyellow")
curve(dnorm(x, mean=mean(EED_data$Wall_Area), sd=sd(EED_data$Wall_Area)),
      col="red", lwd=2, add=TRUE)

#Bell Curve for Roof_Area
hist(EED_data$Roof_Area, breaks = 30, freq = FALSE,
     main = "Bell Curve of Roof Area",
     xlab = "Roof Area (sq ft)", col = "lightpink")
curve(dnorm(x, mean=mean(EED_data$Roof_Area), sd=sd(EED_data$Roof_Area)),
      col="red", lwd=2, add=TRUE)

#Boxplots to show spread and outliers
boxplot(EED_data$Cooling_Load, main="Boxplot of Cooling Load", col="lightblue")
boxplot(EED_data$Surface_Area, main="Boxplot of Surface Area", col="lightgreen")
boxplot(EED_data$Wall_Area, main="Boxplot of Wall Area", col="lightyellow")
boxplot(EED_data$Roof_Area, main="Boxplot of Roof Area", col="lightpink")


##############################################################
#TASK 4: Hypothesis Testing - Does Orientation affect Cooling_Load?
#H0: Mean Cooling_Load is the same across all Orientation groups
#H1: At least one Orientation group has a different mean Cooling_Load
##############################################################

#Descriptive summary by group
tapply(EED_data$Cooling_Load, EED_data$Orientation, mean)
tapply(EED_data$Cooling_Load, EED_data$Orientation, sd)
tapply(EED_data$Cooling_Load, EED_data$Orientation, length)

#Check normality within each Orientation group
by(EED_data$Cooling_Load, EED_data$Orientation, shapiro.test)

#Check homogeneity of variance
install.packages("car")
library(car)
leveneTest(Cooling_Load ~ Orientation, data = EED_data)

#One-way ANOVA (parametric)
anova_model <- aov(Cooling_Load ~ Orientation, data = EED_data)
summary(anova_model)

#Kruskal-Wallis Test (non-parametric alternative, used if normality fails)
kruskal.test(Cooling_Load ~ Orientation, data = EED_data)

#Graphical Analysis
boxplot(Cooling_Load ~ Orientation, data = EED_data,
        main = "Cooling Load by Orientation",
        xlab = "Orientation", ylab = "Cooling Load (BTU)",
        col = c("lightblue","lightgreen","lightyellow","lightpink"))

#Means plot with error bars
means <- tapply(EED_data$Cooling_Load, EED_data$Orientation, mean)
ses <- tapply(EED_data$Cooling_Load, EED_data$Orientation,
              function(x) sd(x)/sqrt(length(x)))
plot_centers <- barplot(means, main = "Mean Cooling Load by Orientation",
                        ylab = "Mean Cooling Load (BTU)",
                        col = "steelblue", 
                        ylim = c(0, max(means + ses) + 5)) 
arrows(plot_centers, means-ses, plot_centers, means+ses,
       angle = 90, code = 3, length = 0.05)


##############################################################
#TASK 5: Hypothesis Testing - Relationship between Cooling_Load and
#Surface_Area, Wall_Area, Roof_Area
#H0: No significant relationship (correlation = 0)
#H1: Significant relationship exists (correlation != 0)
##############################################################

#Normality Testing (required before choosing correlation method)
shapiro.test(EED_data$Cooling_Load)
shapiro.test(EED_data$Surface_Area)
shapiro.test(EED_data$Wall_Area)
shapiro.test(EED_data$Roof_Area)
#p < 0.05 means the variable is NOT normally distributed
#-> Spearman correlation should be used instead of Pearson

#Q-Q plots for visual normality check
qqnorm(EED_data$Cooling_Load, main="Q-Q Plot: Cooling Load")
qqline(EED_data$Cooling_Load, col="red")

qqnorm(EED_data$Surface_Area, main="Q-Q Plot: Surface Area")
qqline(EED_data$Surface_Area, col="red")

qqnorm(EED_data$Wall_Area, main="Q-Q Plot: Wall Area")
qqline(EED_data$Wall_Area, col="red")

qqnorm(EED_data$Roof_Area, main="Q-Q Plot: Roof Area")
qqline(EED_data$Roof_Area, col="red")

cor_matrix <- cor(EED_data[, c("Cooling_Load", "Surface_Area", 
                               "Wall_Area", "Roof_Area")])
cor_matrix

#Covariance and Correlation: Cooling_Load vs Surface_Area
cov(EED_data$Cooling_Load, EED_data$Surface_Area)
cor(EED_data$Cooling_Load, EED_data$Surface_Area, method = "pearson")
cor(EED_data$Cooling_Load, EED_data$Surface_Area, method = "spearman")
cor.test(EED_data$Cooling_Load, EED_data$Surface_Area, method = "spearman")

#Covariance and Correlation: Cooling_Load vs Wall_Area
cov(EED_data$Cooling_Load, EED_data$Wall_Area)
cor(EED_data$Cooling_Load, EED_data$Wall_Area, method = "pearson")
cor(EED_data$Cooling_Load, EED_data$Wall_Area, method = "spearman")
cor.test(EED_data$Cooling_Load, EED_data$Wall_Area, method = "spearman")

#Covariance and Correlation: Cooling_Load vs Roof_Area
cov(EED_data$Cooling_Load, EED_data$Roof_Area)
cor(EED_data$Cooling_Load, EED_data$Roof_Area, method = "pearson")
cor(EED_data$Cooling_Load, EED_data$Roof_Area, method = "spearman")
cor.test(EED_data$Cooling_Load, EED_data$Roof_Area, method = "spearman")

#Scatter plot with regression line: Cooling_Load vs Surface_Area
plot(EED_data$Surface_Area, EED_data$Cooling_Load,
     main = "Cooling Load vs Surface Area",
     xlab = "Surface Area", ylab = "Cooling Load",
     pch = 19, col = "darkblue")
model1 <- lm(Cooling_Load ~ Surface_Area, data = EED_data)
abline(model1, col = "red", lwd = 2)
legend("topright",
       legend = paste("Pearson r:", round(cor(EED_data$Cooling_Load, EED_data$Surface_Area),2)),
       bty = "n")

#Scatter plot with regression line: Cooling_Load vs Wall_Area
plot(EED_data$Wall_Area, EED_data$Cooling_Load,
     main = "Cooling Load vs Wall Area",
     xlab = "Wall Area", ylab = "Cooling Load",
     pch = 19, col = "darkgreen")
model2 <- lm(Cooling_Load ~ Wall_Area, data = EED_data)
abline(model2, col = "red", lwd = 2)
legend("topright",
       legend = paste("Pearson r:", round(cor(EED_data$Cooling_Load, EED_data$Wall_Area),2)),
       bty = "n")

#Scatter plot with regression line: Cooling_Load vs Roof_Area
plot(EED_data$Roof_Area, EED_data$Cooling_Load,
     main = "Cooling Load vs Roof Area",
     xlab = "Roof Area", ylab = "Cooling Load",
     pch = 19, col = "purple")
model3 <- lm(Cooling_Load ~ Roof_Area, data = EED_data)
abline(model3, col = "red", lwd = 2)
legend("topright",
       legend = paste("Pearson r:", round(cor(EED_data$Cooling_Load, EED_data$Roof_Area),2)),
       bty = "n")


##############################################################
#Multiple Linear Regression (supports Task 5 & Task 6 conclusion)
##############################################################

model_multi_new <- lm(Cooling_Load ~ Wall_Area + Roof_Area, data = EED_data)

summary(model_multi_new)

#Check Multicollinearity (Surface_Area, Wall_Area, Roof_Area are
#geometrically related, so high VIF values are expected)
vif(model_multi_new)


#Regression diagnostics
par(mfrow = c(2,2))
plot(model_multi)
par(mfrow = c(1,1))

#Residual normality check
shapiro.test(resid(model_multi))