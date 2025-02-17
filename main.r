if (!requireNamespace("readr", quietly = TRUE)) {
  install.packages("readr")
}
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}
library(readr)
library(ggplot2)

#Importing data
library(readr)
data <- read_csv("C:/Users/akshi/Downloads/usa_00005.csv")
#data <- filter(data, data$OCC != 000 & data$OCC != 9920 & data$SEX != 9 & data$AGE != 999 & data$EDUC != 99 & data$RACE != 7 & data$RACE != 8 & data$RACE != 9 & data$YRSUSA1 != 98 & data$YRSUSA1 != 99 & data$INCWAGE != 999999& data$INCWAGE != 999998)
attach(data)
data$aiExposure <- 0
data$whiteCollar <- 0

#Defining occupations with low (1), medium(2), and high(3) exposure to AI

data$aiExposure[data$OCC == 4500] <- 1
data$aiExposure[data$OCC == 4600] <- 1
data$aiExposure[data$OCC == 4140] <- 1
data$aiExposure[data$OCC == 6700] <- 1
data$aiExposure[data$OCC == 6710] <- 1
data$aiExposure[data$OCC == 3740] <- 1
data$aiExposure[data$OCC == 4400] <- 1
data$aiExposure[data$OCC == 7610] <- 1
data$aiExposure[data$OCC == 4220] <- 1
data$aiExposure[data$OCC == 4251] <- 1
data$aiExposure[data$OCC == 4230] <- 1
data$aiExposure[data$OCC == 3603] <- 1
data$aiExposure[data$OCC == 3605] <- 1
data$aiExposure[data$OCC == 9415] <- 1
data$aiExposure[data$OCC == 3602] <- 1
data$aiExposure[data$OCC == 6441] <- 1
data$aiExposure[data$OCC == 8310] <- 1
data$aiExposure[data$OCC == 8530] <- 1
data$aiExposure[data$OCC == 4522] <- 1

data$aiExposure[data$OCC == 0010] <- 2
data$aiExposure[data$OCC == 5230] <- 2
data$aiExposure[data$OCC == 5240] <- 2
data$aiExposure[data$OCC == 0230] <- 2
data$aiExposure[data$OCC == 2632] <- 2
data$aiExposure[data$OCC == 0900] <- 2
data$aiExposure[data$OCC == 0726] <- 2
data$aiExposure[data$OCC == 0136] <- 2
data$aiExposure[data$OCC == 2861] <- 2
data$aiExposure[data$OCC == 0340] <- 2
data$aiExposure[data$OCC == 0051] <- 2
data$aiExposure[data$OCC == 1450] <- 2
data$aiExposure[data$OCC == 1650] <- 2
data$aiExposure[data$OCC == 2205] <- 2
data$aiExposure[data$OCC == 2825] <- 2
data$aiExposure[data$OCC == 0150] <- 2
data$aiExposure[data$OCC == 4930] <- 2
data$aiExposure[data$OCC == 1822] <- 2
data$aiExposure[data$OCC == 2545] <- 2
data$aiExposure[data$OCC == 3250] <- 2

data$aiExposure[data$OCC == 1541] <- 3
data$aiExposure[data$OCC == 5110] <- 3
data$aiExposure[data$OCC == 1910] <- 3
data$aiExposure[data$OCC == 5120] <- 3
data$aiExposure[data$OCC == 2631] <- 3
data$aiExposure[data$OCC == 1400] <- 3
data$aiExposure[data$OCC == 2862] <- 3
data$aiExposure[data$OCC == 0830] <- 3
data$aiExposure[data$OCC == 5810] <- 3
data$aiExposure[data$OCC == 2105] <- 3
data$aiExposure[data$OCC == 5330] <- 3
data$aiExposure[data$OCC == 3646] <- 3
data$aiExposure[data$OCC == 1545] <- 3
data$aiExposure[data$OCC == 2145] <- 3
data$aiExposure[data$OCC == 5140] <- 3
data$aiExposure[data$OCC == 5600] <- 3
data$aiExposure[data$OCC == 5910] <- 3
data$aiExposure[data$OCC == 5010] <- 3
data$aiExposure[data$OCC == 0940] <- 3
data$aiExposure[data$OCC == 2170] <- 3

data$isWhite <- 0
data$isWhite[data$RACHSING == 1] <- 1
data$isBlack <- 0
data$isBlack[data$RACHSING == 2] <- 1
data$isNative <- 0
data$isNative[data$RACHSING == 3] <- 1
data$isAsian <- 0
data$isAsian[data$RACHSING == 4] <- 1
data$isHispanic <- 0
data$isHispanic[data$RACHSING == 5] <- 1

data$whiteCollar <- 0
data$whiteCollar[data$OCC == 4522] <- 1
data$whiteCollar[data$OCC == 2545] <- 1
data$whiteCollar[data$OCC == 1822] <- 1
data$whiteCollar[data$OCC == 4930] <- 1
data$whiteCollar[data$OCC == 0150] <- 1
data$whiteCollar[data$OCC == 2825] <- 1
data$whiteCollar[data$OCC == 2205] <- 1
data$whiteCollar[data$OCC == 1650] <- 1
data$whiteCollar[data$OCC == 1450] <- 1
data$whiteCollar[data$OCC == 0051] <- 1
data$whiteCollar[data$OCC == 0340] <- 1
data$whiteCollar[data$OCC == 0010] <- 1
data$whiteCollar[data$OCC == 5230] <- 1
data$whiteCollar[data$OCC == 5240] <- 1
data$whiteCollar[data$OCC == 0230] <- 1
data$whiteCollar[data$OCC == 2632] <- 1
data$whiteCollar[data$OCC == 0900] <- 1
data$whiteCollar[data$OCC == 0136] <- 1
data$whiteCollar[data$OCC == 3250] <- 1

data$whiteCollar[data$OCC == 1542] <- 1
data$whiteCollar[data$OCC == 5110] <- 1
data$whiteCollar[data$OCC == 1910] <- 1
data$whiteCollar[data$OCC == 5120] <- 1
data$whiteCollar[data$OCC == 2631] <- 1
data$whiteCollar[data$OCC == 1400] <- 1
data$whiteCollar[data$OCC == 2862] <- 1
data$whiteCollar[data$OCC == 0830] <- 1
data$whiteCollar[data$OCC == 5810] <- 1
data$whiteCollar[data$OCC == 2105] <- 1
data$whiteCollar[data$OCC == 5330] <- 1
data$whiteCollar[data$OCC == 3646] <- 1
data$whiteCollar[data$OCC == 1545] <- 1
data$whiteCollar[data$OCC == 2145] <- 1
data$whiteCollar[data$OCC == 5140] <- 1
data$whiteCollar[data$OCC == 5600] <- 1
data$whiteCollar[data$OCC == 5910] <- 1
data$whiteCollar[data$OCC == 5010] <- 1
data$whiteCollar[data$OCC == 0940] <- 1
data$whiteCollar[data$OCC == 2170] <- 1

collarModelBlack <- lm(data$aiExposure ~ data$whiteCollar + data$isBlack + data$whiteCollar*data$isBlack)
summary(collarModelBlack)

collarModelHispanic <- lm(data$aiExposure ~ data$whiteCollar + data$isHispanic + data$whiteCollar*data$isHispanic)
summary(collarModelHispanic)

collarModelWhite <- lm(data$aiExposure ~ data$whiteCollar + data$isWhite + data$whiteCollar*data$isWhite)
summary(collarModelWhite)

collarModelAsian <- lm(data$aiExposure ~ data$whiteCollar + data$isAsian + data$whiteCollar*data$isAsian)
summary(collarModelAsian)

collarModelNative <- lm(data$aiExposure ~ data$whiteCollar + data$isNative + data$whiteCollar*data$isNative)
summary(collarModelNative)

#Creating linear models to see how different demographic variables affect AI Exposure
genderModel <- lm(aiExposure ~ SEX + as.factor(YEAR), data = data)
summary(genderModel)
# ggplot(data = data, aes(x = SEX, y = aiExposure)) +
#   geom_point(color = "darkred") +
#   geom_smooth(method = "lm", se = FALSE, color = "black", linetype = "dashed") +
#   labs(x = "Sex", y = "AI Exposure") +
#   expand_limits(x = 0, y = 0)

ageModel <- lm(aiExposure ~ AGE + as.factor(YEAR), data = data)
summary(ageModel)
# ggplot(data = data, aes(x = AGE, y = aiExposure)) +
#   geom_point(color = "darkred") +
#   geom_smooth(method = "lm", se = FALSE, color = "black", linetype = "dashed") +
#   labs(x = "Age", y = "AI Exposure") +
#   expand_limits(x = 0, y = 0)

educModel <- lm(aiExposure ~ EDUC + as.factor(YEAR), data = data)
summary(educModel)
# ggplot(data = data, aes(x = EDUC, y = aiExposure)) +
#   geom_point(color = "darkred") +
#   geom_smooth(method = "lm", se = FALSE, color = "black", linetype = "dashed") +
#   labs(x = "Education Level", y = "AI Exposure") +
#   expand_limits(x = 0, y = 0)

yrsInUSModel <- lm(aiExposure ~ YRSUSA1 + as.factor(YEAR), data = data)
summary(yrsInUSModel)
# ggplot(data = data, aes(x = YRSUSA1, y = aiExposure)) +
#   geom_point(color = "darkred") +
#   geom_smooth(method = "lm", se = FALSE, color = "black", linetype = "dashed") +
#   labs(x = "Years in the USA", y = "AI Exposure") +
#   expand_limits(x = 0, y = 0)

wageModel <- lm(aiExposure ~ INCWAGE + as.factor(YEAR), data = data)
summary(wageModel)
# ggplot(data = data, aes(x = INCWAGE, y = aiExposure)) +
#   geom_point(color = "darkred") +
#   geom_smooth(method = "lm", se = FALSE, color = "black", linetype = "dashed") +
#   labs(x = "Income", y = "AI Exposure") +
#   expand_limits(x = 0, y = 0)

raceModel <- lm(aiExposure ~ as.factor(RACHSING) + as.factor(YEAR), data = data)
summary(raceModel)
#ggplot(data = data, aes(x = RACHSING, y = aiExposure)) +
  #geom_point(color = "darkred") +
  #geom_smooth(method = "lm", se = FALSE, color = "black", linetype = "dashed") +
  #labs(x = "Race", y = "AI Exposure") +
  #expand_limits(x = 0, y = 0)

totalModelWhiteCollar <- lm(aiExposure ~ SEX + AGE + EDUC + as.factor(RACHSING) + whiteCollar + YRSUSA1 + as.factor(YEAR), data=data)
summary(totalModelWhiteCollar)
nobs(totalModelWhiteCollar)

whiteCollarModel <- lm(aiExposure ~ whiteCollar + as.factor(YEAR), data = data)
summary(whiteCollarModel)

totalModel <- lm(aiExposure ~ SEX + AGE + EDUC + as.factor(RACHSING) + INCWAGE + YRSUSA1 + as.factor(YEAR), data=data)
summary(totalModel)

nobs(genderModel)
nobs(ageModel)
nobs(educModel)
nobs(yrsInUSModel)
nobs(raceModel)
nobs(totalModelWhiteCollar)
nobs(collarModelBlack)
nobs(collarModelHispanic)
nobs(collarModelAsian)
nobs(collarModelWhite)
nobs(collarModelNative)
nobs(whiteCollarModel)
