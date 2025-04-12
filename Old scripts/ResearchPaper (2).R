if (!requireNamespace("readr", quietly = TRUE)) {
  install.packages("readr")
}
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}
if (!requireNamespace("car", quietly = TRUE)) {
  install.packages("car")
}
if (!requireNamespace("dplyr", quietly = TRUE)) {
  install.packages("dplyr")
}
if (!requireNamespace("tidyr", quietly = TRUE)) {
  install.packages("tidyr")
}

library(readr)
library(ggplot2)
library(car)
library(dplyr)
library(tidyr)

#Importing data
data <- read_csv("C:/Users/akshi/Downloads/usa_00008.csv.gz")
#data <- filter(data, data$OCC != 9920 & data$SEX != 9 & data$AGE != 999 & data$EDUC != 99 & data$YRSUSA1 != 98 & data$YRSUSA1 != 99 & data$INCWAGE != 999999& data$INCWAGE != 999998)
data$aiExposure <- 0
data$whiteCollar <- 0
data$industry <- 0

data$aiExposure[data$OCC == 1200] <- 0.66
data$aiExposure[data$OCC == 3050] <- 0.64
data$aiExposure[data$OCC == 3421] <- 0.64
data$aiExposure[data$OCC == 3647] <- 0.64
data$aiExposure[data$OCC == 1320] <- 0.63
data$aiExposure[data$OCC == 1305] <- 0.61
data$aiExposure[data$OCC == 1306] <- 0.61
data$aiExposure[data$OCC == 1360] <- 0.60
data$aiExposure[data$OCC == 1460] <- 0.60
data$aiExposure[data$OCC == 1420] <- 0.59
data$aiExposure[data$OCC == 1007] <- 0.59
data$aiExposure[data$OCC == 1710] <- 0.59
data$aiExposure[data$OCC == 0300] <- 0.58
data$aiExposure[data$OCC == 1410] <- 0.58
data$aiExposure[data$OCC == 1520] <- 0.58
data$aiExposure[data$OCC == 0800] <- 0.58
data$aiExposure[data$OCC == 2145] <- 0.57
data$aiExposure[data$OCC == 1005] <- 0.55
data$aiExposure[data$OCC == 1400] <- 0.55
data$aiExposure[data$OCC == 2634] <- 0.55
data$aiExposure[data$OCC == 1006] <- 0.55
data$aiExposure[data$OCC == 1720] <- 0.48
data$aiExposure[data$OCC == 1750] <- 0.54
data$aiExposure[data$OCC == 1010] <- 0.54
data$aiExposure[data$OCC == 1108] <- 0.54
data$aiExposure[data$OCC == 1350] <- 0.54
data$aiExposure[data$OCC == 9030] <- 0.53
data$aiExposure[data$OCC == 9040] <- 0.53
data$aiExposure[data$OCC == 9150] <- 0.53
data$aiExposure[data$OCC == 9210] <- 0.53
data$aiExposure[data$OCC == 9300] <- 0.53
data$aiExposure[data$OCC == 9310] <- 0.53
data$aiExposure[data$OCC == 1551] <- 0.52
data$aiExposure[data$OCC == 5920] <- 0.51
data$aiExposure[data$OCC == 1450] <- 0.51
data$aiExposure[data$OCC == 0110] <- 0.49
data$aiExposure[data$OCC == 1340] <- 0.48
data$aiExposure[data$OCC == 6800] <- 0.48
data$aiExposure[data$OCC == 6825] <- 0.48
data$aiExposure[data$OCC == 6835] <- 0.48
data$aiExposure[data$OCC == 6950] <- 0.48
data$aiExposure[data$OCC == 1700] <- 0.45
data$aiExposure[data$OCC == 0845] <- 0.46
data$aiExposure[data$OCC == 0850] <- 0.46
data$aiExposure[data$OCC == 0900] <- 0.46
data$aiExposure[data$OCC == 0960] <- 0.46
data$aiExposure[data$OCC == 0120] <- 0.46
data$aiExposure[data$OCC == 0820] <- 0.46
data$aiExposure[data$OCC == 0830] <- 0.46
data$aiExposure[data$OCC == 0860] <- 0.46
data$aiExposure[data$OCC == 0910] <- 0.46
data$aiExposure[data$OCC == 0930] <- 0.46
data$aiExposure[data$OCC == 0940] <- 0.46
data$aiExposure[data$OCC == 1440] <- 0.45
data$aiExposure[data$OCC == 2810] <- 0.45
data$aiExposure[data$OCC == 1530] <- 0.45
data$aiExposure[data$OCC == 1430] <- 0.44
data$aiExposure[data$OCC == 5120] <- 0.44
data$aiExposure[data$OCC == 5140] <- 0.44
data$aiExposure[data$OCC == 5150] <- 0.44
data$aiExposure[data$OCC == 5160] <- 0.44
data$aiExposure[data$OCC == 5230] <- 0.44
data$aiExposure[data$OCC == 1700] <- 0.43
data$aiExposure[data$OCC == 1555] <- 0.43
data$aiExposure[data$OCC == 1800] <- 0.43
data$aiExposure[data$OCC == 1745] <- 0.43
data$aiExposure[data$OCC == 0360] <- 0.41
data$aiExposure[data$OCC == 2825] <- 0.41
data$aiExposure[data$OCC == 4800] <- 0.41
data$aiExposure[data$OCC == 4750] <- 0.41
data$aiExposure[data$OCC == 4760] <- 0.41
data$aiExposure[data$OCC == 4810] <- 0.41
data$aiExposure[data$OCC == 4820] <- 0.41
data$aiExposure[data$OCC == 4840] <- 0.41
data$aiExposure[data$OCC == 4850] <- 0.41
data$aiExposure[data$OCC == 4900] <- 0.41
data$aiExposure[data$OCC == 4940] <- 0.41
data$aiExposure[data$OCC == 4965] <- 0.41
data$aiExposure[data$OCC == 0040] <- 0.41
data$aiExposure[data$OCC == 0051] <- 0.41
data$aiExposure[data$OCC == 0052] <- 0.41
data$aiExposure[data$OCC == 0060] <- 0.41
data$aiExposure[data$OCC == 6120] <- 0.40
data$aiExposure[data$OCC == 6130] <- 0.40
data$aiExposure[data$OCC == 0750] <- 0.40
data$aiExposure[data$OCC == 5000] <- 0.40
data$aiExposure[data$OCC == 5100] <- 0.40
data$aiExposure[data$OCC == 5110] <- 0.40
data$aiExposure[data$OCC == 5220] <- 0.40
data$aiExposure[data$OCC == 5240] <- 0.40
data$aiExposure[data$OCC == 5260] <- 0.40
data$aiExposure[data$OCC == 5300] <- 0.40
data$aiExposure[data$OCC == 5250] <- 0.40
data$aiExposure[data$OCC == 5310] <- 0.40
data$aiExposure[data$OCC == 5330] <- 0.40
data$aiExposure[data$OCC == 5340] <- 0.40
data$aiExposure[data$OCC == 5350] <- 0.40
data$aiExposure[data$OCC == 5400] <- 0.40
data$aiExposure[data$OCC == 5410] <- 0.40
data$aiExposure[data$OCC == 5420] <- 0.40
data$aiExposure[data$OCC == 5710] <- 0.40
data$aiExposure[data$OCC == 5720] <- 0.40
data$aiExposure[data$OCC == 5740] <- 0.40
data$aiExposure[data$OCC == 5810] <- 0.40
data$aiExposure[data$OCC == 5820] <- 0.40
data$aiExposure[data$OCC == 5840] <- 0.40
data$aiExposure[data$OCC == 5860] <- 0.40
data$aiExposure[data$OCC == 5910] <- 0.40
data$aiExposure[data$OCC == 5940] <- 0.40
data$aiExposure[data$OCC == 5500] <- 0.39
data$aiExposure[data$OCC == 5510] <- 0.39
data$aiExposure[data$OCC == 5540] <- 0.39
data$aiExposure[data$OCC == 1600] <- 0.39
data$aiExposure[data$OCC == 0700] <- 0.39
data$aiExposure[data$OCC == 0750] <- 0.39
data$aiExposure[data$OCC == 0735] <- 0.39
data$aiExposure[data$OCC == 5010] <- 0.39
data$aiExposure[data$OCC == 5020] <- 0.39
data$aiExposure[data$OCC == 5040] <- 0.39
data$aiExposure[data$OCC == 0020] <- 0.39
data$aiExposure[data$OCC == 0101] <- 0.38
data$aiExposure[data$OCC == 0102] <- 0.38
data$aiExposure[data$OCC == 0135] <- 0.38
data$aiExposure[data$OCC == 0137] <- 0.38
data$aiExposure[data$OCC == 0150] <- 0.38
data$aiExposure[data$OCC == 0160] <- 0.38
data$aiExposure[data$OCC == 0710] <- 0.38
data$aiExposure[data$OCC == 0735] <- 0.38
data$aiExposure[data$OCC == 2600] <- 0.26
data$aiExposure[data$OCC == 2920] <- 0.37
data$aiExposure[data$OCC == 2910] <- 0.37
data$aiExposure[data$OCC == 1860] <- 0.37
data$aiExposure[data$OCC == 0140] <- 0.36
data$aiExposure[data$OCC == 0300] <- 0.36
data$aiExposure[data$OCC == 0350] <- 0.33
data$aiExposure[data$OCC == 2861] <- 0.32
data$aiExposure[data$OCC == 1760] <- 0.32
data$aiExposure[data$OCC == 2060] <- 0.32
data$aiExposure[data$OCC == 3700] <- 0.32
data$aiExposure[data$OCC == 3710] <- 0.32
data$aiExposure[data$OCC == 3720] <- 0.32
data$aiExposure[data$OCC == 3740] <- 0.32
data$aiExposure[data$OCC == 3750] <- 0.32
data$aiExposure[data$OCC == 3801] <- 0.32
data$aiExposure[data$OCC == 3802] <- 0.32
data$aiExposure[data$OCC == 3820] <- 0.32
data$aiExposure[data$OCC == 3870] <- 0.32
data$aiExposure[data$OCC == 3910] <- 0.32
data$aiExposure[data$OCC == 3930] <- 0.32
data$aiExposure[data$OCC == 3945] <- 0.32
data$aiExposure[data$OCC == 2700] <- 0.31
data$aiExposure[data$OCC == 2710] <- 0.31
data$aiExposure[data$OCC == 6050] <- 0.29
data$aiExposure[data$OCC == 6040] <- 0.29
data$aiExposure[data$OCC == 0205] <- 0.29
data$aiExposure[data$OCC == 0136] <- 0.28
data$aiExposure[data$OCC == 1610] <- 0.28
data$aiExposure[data$OCC == 1825] <- 0.26
data$aiExposure[data$OCC == 0310] <- 0.26
data$aiExposure[data$OCC == 0340] <- 0.26
data$aiExposure[data$OCC == 7000] <- 0.26
data$aiExposure[data$OCC == 7010] <- 0.26
data$aiExposure[data$OCC == 7020] <- 0.26
data$aiExposure[data$OCC == 7030] <- 0.26
data$aiExposure[data$OCC == 7040] <- 0.26
data$aiExposure[data$OCC == 7100] <- 0.26
data$aiExposure[data$OCC == 7120] <- 0.26
data$aiExposure[data$OCC == 7130] <- 0.26
data$aiExposure[data$OCC == 7140] <- 0.26
data$aiExposure[data$OCC == 7150] <- 0.26
data$aiExposure[data$OCC == 7160] <- 0.26
data$aiExposure[data$OCC == 7200] <- 0.26
data$aiExposure[data$OCC == 7220] <- 0.26
data$aiExposure[data$OCC == 7260] <- 0.26
data$aiExposure[data$OCC == 7300] <- 0.26
data$aiExposure[data$OCC == 7315] <- 0.26
data$aiExposure[data$OCC == 7320] <- 0.26
data$aiExposure[data$OCC == 7340] <- 0.26
data$aiExposure[data$OCC == 7410] <- 0.26
data$aiExposure[data$OCC == 7420] <- 0.26
data$aiExposure[data$OCC == 7610] <- 0.26
data$aiExposure[data$OCC == 7640] <- 0.26
data$aiExposure[data$OCC == 6200] <- 0.25
data$aiExposure[data$OCC == 6210] <- 0.25
data$aiExposure[data$OCC == 6220] <- 0.25
data$aiExposure[data$OCC == 6230] <- 0.25
data$aiExposure[data$OCC == 6240] <- 0.25
data$aiExposure[data$OCC == 6250] <- 0.25
data$aiExposure[data$OCC == 6330] <- 0.25
data$aiExposure[data$OCC == 6360] <- 0.25
data$aiExposure[data$OCC == 6400] <- 0.25
data$aiExposure[data$OCC == 6410] <- 0.25
data$aiExposure[data$OCC == 6441] <- 0.25
data$aiExposure[data$OCC == 6442] <- 0.25
data$aiExposure[data$OCC == 6460] <- 0.25
data$aiExposure[data$OCC == 6515] <- 0.25
data$aiExposure[data$OCC == 6520] <- 0.25
data$aiExposure[data$OCC == 6530] <- 0.25
data$aiExposure[data$OCC == 6540] <- 0.25
data$aiExposure[data$OCC == 6660] <- 0.25
data$aiExposure[data$OCC == 6700] <- 0.25
data$aiExposure[data$OCC == 6710] <- 0.25
data$aiExposure[data$OCC == 6720] <- 0.25
data$aiExposure[data$OCC == 6730] <- 0.25
data$aiExposure[data$OCC == 6740] <- 0.25
data$aiExposure[data$OCC == 6260] <- 0.25
data$aiExposure[data$OCC == 6305] <- 0.25
data$aiExposure[data$OCC == 6600] <- 0.25
data$aiExposure[data$OCC == 6765] <- 0.25
data$aiExposure[data$OCC == 0220] <- 0.25
data$aiExposure[data$OCC == 2016] <- 0.25
data$aiExposure[data$OCC == 3648] <- 0.24
data$aiExposure[data$OCC == 3250] <- 0.24
data$aiExposure[data$OCC == 3424] <- 0.24
data$aiExposure[data$OCC == 2555] <- 0.23
data$aiExposure[data$OCC == 2751] <- 0.22
data$aiExposure[data$OCC == 2752] <- 0.22
data$aiExposure[data$OCC == 3401] <- 0.22
data$aiExposure[data$OCC == 3430] <- 0.22
data$aiExposure[data$OCC == 8760] <- 0.22
data$aiExposure[data$OCC == 2011] <- 0.22
data$aiExposure[data$OCC == 2012] <- 0.22
data$aiExposure[data$OCC == 2013] <- 0.22
data$aiExposure[data$OCC == 2014] <- 0.22
data$aiExposure[data$OCC == 3090] <- 0.22
data$aiExposure[data$OCC == 3110] <- 0.22
data$aiExposure[data$OCC == 3160] <- 0.22
data$aiExposure[data$OCC == 4621] <- 0.22
data$aiExposure[data$OCC == 4622] <- 0.22
data$aiExposure[data$OCC == 0335] <- 0.22
data$aiExposure[data$OCC == 000] <- 0.20
data$aiExposure[data$OCC == 3030] <- 0.19
data$aiExposure[data$OCC == 2050] <- 0.19
data$aiExposure[data$OCC == 1821] <- 0.17
data$aiExposure[data$OCC == 3545] <- 0.18
data$aiExposure[data$OCC == 3550] <- 0.18
data$aiExposure[data$OCC == 2320] <- 0.17
data$aiExposure[data$OCC == 4510] <- 0.15
data$aiExposure[data$OCC == 4500] <- 0.15
data$aiExposure[data$OCC == 4521] <- 0.15
data$aiExposure[data$OCC == 4525] <- 0.15
data$aiExposure[data$OCC == 4000] <- 0.15
data$aiExposure[data$OCC == 4020] <- 0.15
data$aiExposure[data$OCC == 4010] <- 0.15
data$aiExposure[data$OCC == 4030] <- 0.15
data$aiExposure[data$OCC == 4160] <- 0.15
data$aiExposure[data$OCC == 5730] <- 0.15
data$aiExposure[data$OCC == 1935] <- 0.13
data$aiExposure[data$OCC == 1822] <- 0.12
data$aiExposure[data$OCC == 2310] <- 0.12
data$aiExposure[data$OCC == 2300] <- 0.12
data$aiExposure[data$OCC == 2003] <- 0.11
data$aiExposure[data$OCC == 3150] <- 0.11
data$aiExposure[data$OCC == 3160] <- 0.11
data$aiExposure[data$OCC == 3200] <- 0.11
data$aiExposure[data$OCC == 3210] <- 0.11
data$aiExposure[data$OCC == 3220] <- 0.11
data$aiExposure[data$OCC == 3245] <- 0.11
data$aiExposure[data$OCC == 3610] <- 0.11
data$aiExposure[data$OCC == 3620] <- 0.11
data$aiExposure[data$OCC == 3630] <- 0.11
data$aiExposure[data$OCC == 2002] <- 0.10
data$aiExposure[data$OCC == 2330] <- 0.09
data$aiExposure[data$OCC == 0230] <- 0.09
data$aiExposure[data$OCC == 3603] <- 0.06
data$aiExposure[data$OCC == 3255] <- 0.06
data$aiExposure[data$OCC == 3256] <- 0.06
data$aiExposure[data$OCC == 3258] <- 0.06
data$aiExposure[data$OCC == 3500] <- 0.06

#Assigning Occupations to Industry
# 1- Business, Finance, Management, & Real Estate
# 2- Information Technology 
# 3- Media and Communications
# 4- Agriculture, Natural Resources & Mining
# 5- Wholesale, Retail, & Manufacturing
# 6- Transportation & Logistics
# 7- Education & Public Services
# 8- Healthcare & Life Sciences
# 9- Arts, Entertainment & Hospitality
# 10- Science, Engineering, & Technical Services
# 11- Professional Services & Administrative Support (e.g., Marketing, Accounting, Bookkeeping, Clerical, Consulting, Administrative Support)
# 12- Construction & Repair

data$industry[data$OCC == 1200] <- 1
data$industry[data$OCC == 3050] <- 8
data$industry[data$OCC == 3421] <- 8
data$industry[data$OCC == 3647] <- 8
data$industry[data$OCC == 1320] <- 10
data$industry[data$OCC == 1305] <- 10
data$industry[data$OCC == 1306] <- 10
data$industry[data$OCC == 1360] <- 10
data$industry[data$OCC == 1460] <- 10
data$industry[data$OCC == 1420] <- 10
data$industry[data$OCC == 1007] <- 2
data$industry[data$OCC == 1710] <- 10
data$industry[data$OCC == 0300] <- 10
data$industry[data$OCC == 1410] <- 10
data$industry[data$OCC == 1520] <- 4
data$industry[data$OCC == 0800] <- 1
data$industry[data$OCC == 2145] <- 11
data$industry[data$OCC == 1005] <- 2
data$industry[data$OCC == 1400] <- 2
data$industry[data$OCC == 2634] <- 9
data$industry[data$OCC == 1006] <- 2
data$industry[data$OCC == 1720] <- 10
data$industry[data$OCC == 1750] <- 10
data$industry[data$OCC == 1010] <- 2
data$industry[data$OCC == 1108] <- 2
data$industry[data$OCC == 1350] <- 10
data$industry[data$OCC == 9030] <- 6
data$industry[data$OCC == 9040] <- 6
data$industry[data$OCC == 9150] <- 6
data$industry[data$OCC == 9210] <- 6
data$industry[data$OCC == 9300] <- 6
data$industry[data$OCC == 9310] <- 6
data$industry[data$OCC == 1551] <- 10
data$industry[data$OCC == 5920] <- 11
data$industry[data$OCC == 1450] <- 10
data$industry[data$OCC == 0110] <- 2
data$industry[data$OCC == 1340] <- 10
data$industry[data$OCC == 6800] <- 4
data$industry[data$OCC == 6825] <- 4
data$industry[data$OCC == 6835] <- 4
data$industry[data$OCC == 6950] <- 4
data$industry[data$OCC == 1700] <- 10
data$industry[data$OCC == 0845] <- 1
data$industry[data$OCC == 0850] <- 1
data$industry[data$OCC == 0900] <- 1
data$industry[data$OCC == 0960] <- 1
data$industry[data$OCC == 0120] <- 1
data$industry[data$OCC == 0820] <- 1
data$industry[data$OCC == 0830] <- 1
data$industry[data$OCC == 0860] <- 1
data$industry[data$OCC == 0910] <- 1
data$industry[data$OCC == 0930] <- 1
data$industry[data$OCC == 0940] <- 1
data$industry[data$OCC == 1440] <- 10
data$industry[data$OCC == 2810] <- 3
data$industry[data$OCC == 1530] <- 10
data$industry[data$OCC == 1430] <- 10
data$industry[data$OCC == 5120] <- 11
data$industry[data$OCC == 5140] <- 11
data$industry[data$OCC == 5150] <- 11
data$industry[data$OCC == 5160] <- 11
data$industry[data$OCC == 5230] <- 1
data$industry[data$OCC == 1700] <- 10
data$industry[data$OCC == 1555] <- 10
data$industry[data$OCC == 1800] <- 1
data$industry[data$OCC == 1745] <- 10
data$industry[data$OCC == 0360] <- 10
data$industry[data$OCC == 2825] <- 11
data$industry[data$OCC == 4800] <- 11
data$industry[data$OCC == 4750] <- 5
data$industry[data$OCC == 4760] <- 5
data$industry[data$OCC == 4810] <- 1
data$industry[data$OCC == 4820] <- 1
data$industry[data$OCC == 4840] <- 5
data$industry[data$OCC == 4850] <- 5
data$industry[data$OCC == 4900] <- 11
data$industry[data$OCC == 4940] <- 11
data$industry[data$OCC == 4965] <- 11
data$industry[data$OCC == 0040] <- 11
data$industry[data$OCC == 0051] <- 11
data$industry[data$OCC == 0052] <- 11
data$industry[data$OCC == 0060] <- 1
data$industry[data$OCC == 6120] <- 4
data$industry[data$OCC == 6130] <- 4
data$industry[data$OCC == 0750] <- 1
data$industry[data$OCC == 5000] <- 11
data$industry[data$OCC == 5100] <- 11
data$industry[data$OCC == 5110] <- 11
data$industry[data$OCC == 5220] <- 11
data$industry[data$OCC == 5240] <- 11
data$industry[data$OCC == 5260] <- 11
data$industry[data$OCC == 5300] <- 9
data$industry[data$OCC == 5250] <- 7
data$industry[data$OCC == 5310] <- 11
data$industry[data$OCC == 5330] <- 1
data$industry[data$OCC == 5340] <- 1
data$industry[data$OCC == 5350] <- 11
data$industry[data$OCC == 5400] <- 11
data$industry[data$OCC == 5410] <- 11
data$industry[data$OCC == 5420] <- 11
data$industry[data$OCC == 5710] <- 11
data$industry[data$OCC == 5720] <- 11
data$industry[data$OCC == 5740] <- 11
data$industry[data$OCC == 5810] <- 11
data$industry[data$OCC == 5820] <- 11
data$industry[data$OCC == 5840] <- 1
data$industry[data$OCC == 5860] <- 11
data$industry[data$OCC == 5910] <- 11
data$industry[data$OCC == 5940] <- 11
data$industry[data$OCC == 5500] <- 6
data$industry[data$OCC == 5510] <- 6
data$industry[data$OCC == 5540] <- 6
data$industry[data$OCC == 1600] <- 4
data$industry[data$OCC == 0700] <- 6
data$industry[data$OCC == 0750] <- 1
data$industry[data$OCC == 0735] <- 1
data$industry[data$OCC == 5010] <- 11
data$industry[data$OCC == 5020] <- 11
data$industry[data$OCC == 5040] <- 11
data$industry[data$OCC == 0020] <- 1
data$industry[data$OCC == 0101] <- 1
data$industry[data$OCC == 0102] <- 1
data$industry[data$OCC == 0135] <- 1
data$industry[data$OCC == 0137] <- 1
data$industry[data$OCC == 0150] <- 1
data$industry[data$OCC == 0160] <- 6
data$industry[data$OCC == 0710] <- 1
data$industry[data$OCC == 0735] <- 1
data$industry[data$OCC == 2600] <- 9
data$industry[data$OCC == 2920] <- 3
data$industry[data$OCC == 2910] <- 3
data$industry[data$OCC == 1860] <- 10
data$industry[data$OCC == 0140] <- 5
data$industry[data$OCC == 0300] <- 10
data$industry[data$OCC == 0350] <- 8
data$industry[data$OCC == 2861] <- 3
data$industry[data$OCC == 1760] <- 10
data$industry[data$OCC == 2060] <- 7
data$industry[data$OCC == 3700] <- 7
data$industry[data$OCC == 3710] <- 7
data$industry[data$OCC == 3720] <- 7
data$industry[data$OCC == 3740] <- 7
data$industry[data$OCC == 3750] <- 7
data$industry[data$OCC == 3801] <- 7
data$industry[data$OCC == 3802] <- 7
data$industry[data$OCC == 3820] <- 7
data$industry[data$OCC == 3870] <- 7
data$industry[data$OCC == 3910] <- 11
data$industry[data$OCC == 3930] <- 7
data$industry[data$OCC == 3945] <- 7
data$industry[data$OCC == 2700] <- 9
data$industry[data$OCC == 2710] <- 9
data$industry[data$OCC == 6050] <- 4
data$industry[data$OCC == 6040] <- 4
data$industry[data$OCC == 0205] <- 4
data$industry[data$OCC == 0136] <- 1
data$industry[data$OCC == 1610] <- 8
data$industry[data$OCC == 1825] <- 8
data$industry[data$OCC == 0310] <- 9
data$industry[data$OCC == 0340] <- 9
data$industry[data$OCC == 7000] <- 12
data$industry[data$OCC == 7010] <- 12
data$industry[data$OCC == 7020] <- 12
data$industry[data$OCC == 7030] <- 12
data$industry[data$OCC == 7040] <- 12
data$industry[data$OCC == 7100] <- 12
data$industry[data$OCC == 7120] <- 12
data$industry[data$OCC == 7130] <- 12
data$industry[data$OCC == 7140] <- 6
data$industry[data$OCC == 7150] <- 6
data$industry[data$OCC == 7160] <- 6
data$industry[data$OCC == 7200] <- 6
data$industry[data$OCC == 7220] <- 6
data$industry[data$OCC == 7260] <- 6
data$industry[data$OCC == 7300] <- 12
data$industry[data$OCC == 7315] <- 12
data$industry[data$OCC == 7320] <- 12
data$industry[data$OCC == 7340] <- 12
data$industry[data$OCC == 7410] <- 12
data$industry[data$OCC == 7420] <- 12
data$industry[data$OCC == 7610] <- 12
data$industry[data$OCC == 7640] <- 12
data$industry[data$OCC == 6200] <- 12
data$industry[data$OCC == 6210] <- 12
data$industry[data$OCC == 6220] <- 12
data$industry[data$OCC == 6230] <- 12
data$industry[data$OCC == 6240] <- 12
data$industry[data$OCC == 6250] <- 12
data$industry[data$OCC == 6330] <- 12
data$industry[data$OCC == 6360] <- 12
data$industry[data$OCC == 6400] <- 12
data$industry[data$OCC == 6410] <- 12
data$industry[data$OCC == 6441] <- 12
data$industry[data$OCC == 6442] <- 12
data$industry[data$OCC == 6460] <- 12
data$industry[data$OCC == 6515] <- 12
data$industry[data$OCC == 6520] <- 12
data$industry[data$OCC == 6530] <- 12
data$industry[data$OCC == 6540] <- 12
data$industry[data$OCC == 6660] <- 12
data$industry[data$OCC == 6700] <- 12
data$industry[data$OCC == 6710] <- 12
data$industry[data$OCC == 6720] <- 12
data$industry[data$OCC == 6730] <- 12
data$industry[data$OCC == 6740] <- 12
data$industry[data$OCC == 6260] <- 12
data$industry[data$OCC == 6305] <- 12
data$industry[data$OCC == 6600] <- 12
data$industry[data$OCC == 6765] <- 12
data$industry[data$OCC == 0220] <- 12
data$industry[data$OCC == 2016] <- 7
data$industry[data$OCC == 3648] <- 8
data$industry[data$OCC == 3250] <- 8
data$industry[data$OCC == 3424] <- 8
data$industry[data$OCC == 2555] <- 7
data$industry[data$OCC == 2751] <- 7
data$industry[data$OCC == 2752] <- 9
data$industry[data$OCC == 3401] <- 8
data$industry[data$OCC == 3430] <- 8
data$industry[data$OCC == 8760] <- 8
data$industry[data$OCC == 2011] <- 7
data$industry[data$OCC == 2012] <- 7
data$industry[data$OCC == 2013] <- 7
data$industry[data$OCC == 2014] <- 7
data$industry[data$OCC == 3090] <- 8
data$industry[data$OCC == 3110] <- 8
data$industry[data$OCC == 3160] <- 8
data$industry[data$OCC == 4621] <- 8
data$industry[data$OCC == 4622] <- 9
data$industry[data$OCC == 0335] <- 9
data$industry[data$OCC == 3030] <- 8
data$industry[data$OCC == 2050] <- 7
data$industry[data$OCC == 1821] <- 8
data$industry[data$OCC == 3545] <- 8
data$industry[data$OCC == 3550] <- 8
data$industry[data$OCC == 2320] <- 7
data$industry[data$OCC == 4510] <- 7
data$industry[data$OCC == 4500] <- 9
data$industry[data$OCC == 4521] <- 9
data$industry[data$OCC == 4525] <- 9
data$industry[data$OCC == 4000] <- 9
data$industry[data$OCC == 4020] <- 9
data$industry[data$OCC == 4010] <- 9
data$industry[data$OCC == 4030] <- 9
data$industry[data$OCC == 4160] <- 9
data$industry[data$OCC == 5730] <- 8
data$industry[data$OCC == 1935] <- 10
data$industry[data$OCC == 1822] <- 7
data$industry[data$OCC == 2310] <- 7
data$industry[data$OCC == 2300] <- 7
data$industry[data$OCC == 2003] <- 8
data$industry[data$OCC == 3150] <- 8
data$industry[data$OCC == 3160] <- 8
data$industry[data$OCC == 3200] <- 8
data$industry[data$OCC == 3210] <- 8
data$industry[data$OCC == 3220] <- 8
data$industry[data$OCC == 3245] <- 8
data$industry[data$OCC == 3610] <- 8
data$industry[data$OCC == 3620] <- 8
data$industry[data$OCC == 3630] <- 8
data$industry[data$OCC == 2002] <- 7
data$industry[data$OCC == 2330] <- 7
data$industry[data$OCC == 0230] <- 7
data$industry[data$OCC == 3603] <- 8
data$industry[data$OCC == 3255] <- 8
data$industry[data$OCC == 3256] <- 8
data$industry[data$OCC == 3258] <- 8
data$industry[data$OCC == 3500] <- 8


# data$isWhite <- 0
# data$isWhite[data$RACHSING == 1] <- 1
# data$isBlack <- 0
# data$isBlack[data$RACHSING == 2] <- 1
# data$isNative <- 0
# data$isNative[data$RACHSING == 3] <- 1
# data$isAsian <- 0
# data$isAsian[data$RACHSING == 4] <- 1
# data$isHispanic <- 0
# data$isHispanic[data$RACHSING == 5] <- 1
# 

data$whiteCollar[data$OCC == 1200] <- 1
data$whiteCollar[data$OCC == 3050] <- 1
data$whiteCollar[data$OCC == 3421] <- 1
data$whiteCollar[data$OCC == 3647] <- 1
data$whiteCollar[data$OCC == 1320] <- 1
data$whiteCollar[data$OCC == 1305] <- 1
data$whiteCollar[data$OCC == 1306] <- 1
data$whiteCollar[data$OCC == 1360] <- 1
data$whiteCollar[data$OCC == 1460] <- 1
data$whiteCollar[data$OCC == 1420] <- 1
data$whiteCollar[data$OCC == 1007] <- 1
data$whiteCollar[data$OCC == 1710] <- 1
data$whiteCollar[data$OCC == 0300] <- 1
data$whiteCollar[data$OCC == 1410] <- 1
data$whiteCollar[data$OCC == 1520] <- 1
data$whiteCollar[data$OCC == 0800] <- 1
data$whiteCollar[data$OCC == 2145] <- 1
data$whiteCollar[data$OCC == 1005] <- 1
data$whiteCollar[data$OCC == 1400] <- 1
data$whiteCollar[data$OCC == 2634] <- 1
data$whiteCollar[data$OCC == 1006] <- 1
data$whiteCollar[data$OCC == 1720] <- 1
data$whiteCollar[data$OCC == 1750] <- 1
data$whiteCollar[data$OCC == 1010] <- 1
data$whiteCollar[data$OCC == 1108] <- 1
data$whiteCollar[data$OCC == 1350] <- 1
data$whiteCollar[data$OCC == 9030] <- 1
data$whiteCollar[data$OCC == 9040] <- 1
data$whiteCollar[data$OCC == 1551] <- 1
data$whiteCollar[data$OCC == 5920] <- 1
data$whiteCollar[data$OCC == 1450] <- 1
data$whiteCollar[data$OCC == 0110] <- 1
data$whiteCollar[data$OCC == 1340] <- 1
data$whiteCollar[data$OCC == 1700] <- 1
data$whiteCollar[data$OCC == 0845] <- 1
data$whiteCollar[data$OCC == 0850] <- 1
data$whiteCollar[data$OCC == 0900] <- 1
data$whiteCollar[data$OCC == 0960] <- 1
data$whiteCollar[data$OCC == 0120] <- 1
data$whiteCollar[data$OCC == 0820] <- 1
data$whiteCollar[data$OCC == 0830] <- 1
data$whiteCollar[data$OCC == 0860] <- 1
data$whiteCollar[data$OCC == 0910] <- 1
data$whiteCollar[data$OCC == 0930] <- 1
data$whiteCollar[data$OCC == 0940] <- 1
data$whiteCollar[data$OCC == 1440] <- 1
data$whiteCollar[data$OCC == 2810] <- 1
data$whiteCollar[data$OCC == 1530] <- 1
data$whiteCollar[data$OCC == 1430] <- 1
data$whiteCollar[data$OCC == 5120] <- 1
data$whiteCollar[data$OCC == 5140] <- 1
data$whiteCollar[data$OCC == 5150] <- 1
data$whiteCollar[data$OCC == 5160] <- 1
data$whiteCollar[data$OCC == 5230] <- 1
data$whiteCollar[data$OCC == 1700] <- 1
data$whiteCollar[data$OCC == 1555] <- 1
data$whiteCollar[data$OCC == 1800] <- 1
data$whiteCollar[data$OCC == 1745] <- 1
data$whiteCollar[data$OCC == 0360] <- 1
data$whiteCollar[data$OCC == 2825] <- 1
data$whiteCollar[data$OCC == 4800] <- 1
data$whiteCollar[data$OCC == 4810] <- 1
data$whiteCollar[data$OCC == 4820] <- 1
data$whiteCollar[data$OCC == 4850] <- 1
data$whiteCollar[data$OCC == 4900] <- 1
data$whiteCollar[data$OCC == 4940] <- 1
data$whiteCollar[data$OCC == 4965] <- 1
data$whiteCollar[data$OCC == 0040] <- 1
data$whiteCollar[data$OCC == 0051] <- 1
data$whiteCollar[data$OCC == 0052] <- 1
data$whiteCollar[data$OCC == 0060] <- 1
data$whiteCollar[data$OCC == 0750] <- 1
data$whiteCollar[data$OCC == 5000] <- 1
data$whiteCollar[data$OCC == 5100] <- 1
data$whiteCollar[data$OCC == 5110] <- 1
data$whiteCollar[data$OCC == 5220] <- 1
data$whiteCollar[data$OCC == 5240] <- 1
data$whiteCollar[data$OCC == 5260] <- 1
data$whiteCollar[data$OCC == 5300] <- 1
data$whiteCollar[data$OCC == 5250] <- 1
data$whiteCollar[data$OCC == 5310] <- 1
data$whiteCollar[data$OCC == 5330] <- 1
data$whiteCollar[data$OCC == 5340] <- 1
data$whiteCollar[data$OCC == 5350] <- 1
data$whiteCollar[data$OCC == 5400] <- 1
data$whiteCollar[data$OCC == 5410] <- 1
data$whiteCollar[data$OCC == 5420] <- 1
data$whiteCollar[data$OCC == 5710] <- 1
data$whiteCollar[data$OCC == 5720] <- 1
data$whiteCollar[data$OCC == 5740] <- 1
data$whiteCollar[data$OCC == 5810] <- 1
data$whiteCollar[data$OCC == 5820] <- 1
data$whiteCollar[data$OCC == 5840] <- 1
data$whiteCollar[data$OCC == 5860] <- 1
data$whiteCollar[data$OCC == 5910] <- 1
data$whiteCollar[data$OCC == 5940] <- 1
data$whiteCollar[data$OCC == 5500] <- 1
data$whiteCollar[data$OCC == 5540] <- 1
data$whiteCollar[data$OCC == 1600] <- 1
data$whiteCollar[data$OCC == 0700] <- 1
data$whiteCollar[data$OCC == 0750] <- 1
data$whiteCollar[data$OCC == 0735] <- 1
data$whiteCollar[data$OCC == 5010] <- 1
data$whiteCollar[data$OCC == 5020] <- 1
data$whiteCollar[data$OCC == 5040] <- 1
data$whiteCollar[data$OCC == 0020] <- 1
data$whiteCollar[data$OCC == 0101] <- 1
data$whiteCollar[data$OCC == 0102] <- 1
data$whiteCollar[data$OCC == 0135] <- 1
data$whiteCollar[data$OCC == 0137] <- 1
data$whiteCollar[data$OCC == 0150] <- 1
data$whiteCollar[data$OCC == 0160] <- 1
data$whiteCollar[data$OCC == 0710] <- 1
data$whiteCollar[data$OCC == 0735] <- 1
data$whiteCollar[data$OCC == 1860] <- 1
data$whiteCollar[data$OCC == 0140] <- 1
data$whiteCollar[data$OCC == 0300] <- 1
data$whiteCollar[data$OCC == 0350] <- 1
data$whiteCollar[data$OCC == 2861] <- 1
data$whiteCollar[data$OCC == 1760] <- 1
data$whiteCollar[data$OCC == 2060] <- 1
data$whiteCollar[data$OCC == 3820] <- 1
data$whiteCollar[data$OCC == 3910] <- 1
data$whiteCollar[data$OCC == 2710] <- 1
data$whiteCollar[data$OCC == 0136] <- 1
data$whiteCollar[data$OCC == 1610] <- 1
data$whiteCollar[data$OCC == 1825] <- 1
data$whiteCollar[data$OCC == 0310] <- 1
data$whiteCollar[data$OCC == 0340] <- 1
data$whiteCollar[data$OCC == 7000] <- 1
data$whiteCollar[data$OCC == 6200] <- 1
data$whiteCollar[data$OCC == 0220] <- 1
data$whiteCollar[data$OCC == 2016] <- 1
data$whiteCollar[data$OCC == 3648] <- 1
data$whiteCollar[data$OCC == 3250] <- 1
data$whiteCollar[data$OCC == 3424] <- 1
data$whiteCollar[data$OCC == 2555] <- 1
data$whiteCollar[data$OCC == 2751] <- 1
data$whiteCollar[data$OCC == 3401] <- 1
data$whiteCollar[data$OCC == 3430] <- 1
data$whiteCollar[data$OCC == 8760] <- 1
data$whiteCollar[data$OCC == 2011] <- 1
data$whiteCollar[data$OCC == 2012] <- 1
data$whiteCollar[data$OCC == 2013] <- 1
data$whiteCollar[data$OCC == 2014] <- 1
data$whiteCollar[data$OCC == 3090] <- 1
data$whiteCollar[data$OCC == 3110] <- 1
data$whiteCollar[data$OCC == 3160] <- 1
data$whiteCollar[data$OCC == 4621] <- 1
data$whiteCollar[data$OCC == 4622] <- 1
data$whiteCollar[data$OCC == 0335] <- 1
data$whiteCollar[data$OCC == 3030] <- 1
data$whiteCollar[data$OCC == 2050] <- 1
data$whiteCollar[data$OCC == 1821] <- 1
data$whiteCollar[data$OCC == 3545] <- 1
data$whiteCollar[data$OCC == 3550] <- 1
data$whiteCollar[data$OCC == 2320] <- 1
data$whiteCollar[data$OCC == 5730] <- 1
data$whiteCollar[data$OCC == 1935] <- 1
data$whiteCollar[data$OCC == 1822] <- 1
data$whiteCollar[data$OCC == 2310] <- 1
data$whiteCollar[data$OCC == 2300] <- 1
data$whiteCollar[data$OCC == 2003] <- 1
data$whiteCollar[data$OCC == 3150] <- 1
data$whiteCollar[data$OCC == 3160] <- 1
data$whiteCollar[data$OCC == 3200] <- 1
data$whiteCollar[data$OCC == 3210] <- 1
data$whiteCollar[data$OCC == 3220] <- 1
data$whiteCollar[data$OCC == 3245] <- 1
data$whiteCollar[data$OCC == 3610] <- 1
data$whiteCollar[data$OCC == 3620] <- 1
data$whiteCollar[data$OCC == 3630] <- 1
data$whiteCollar[data$OCC == 2002] <- 1
data$whiteCollar[data$OCC == 2330] <- 1
data$whiteCollar[data$OCC == 0230] <- 1
data$whiteCollar[data$OCC == 3603] <- 1
data$whiteCollar[data$OCC == 3255] <- 1
data$whiteCollar[data$OCC == 3256] <- 1
data$whiteCollar[data$OCC == 3500] <- 1

# data <- data %>%
#   arrange(OCC, YEAR) %>%
#   group_by(OCC) %>%
#   mutate(aiExposure_lag1 = lag(aiExposure, 1)) %>%
#   ungroup()
# 
# collarModelBlack <- lm(data$aiExposure ~ data + data$isBlack + data$INCWAGE*data$isBlack)
# summary(collarModelBlack)
# 
# collarModelHispanic <- lm(data$aiExposure ~ data$whiteCollar + data$isHispanic + data$whiteCollar*data$isHispanic)
# summary(collarModelHispanic)
# 
# collarModelWhite <- lm(data$aiExposure ~ data$whiteCollar + data$isWhite + data$whiteCollar*data$isWhite)
# summary(collarModelWhite)
# 
# collarModelAsian <- lm(data$aiExposure ~ data$whiteCollar + data$isAsian + data$whiteCollar*data$isAsian)
# summary(collarModelAsian)
# 
# collarModelNative <- lm(data$aiExposure ~ data$whiteCollar + data$isNative + data$whiteCollar*data$isNative)
# summary(collarModelNative)
# 
# INCEDUCInteract <- lm(data$aiExposure ~ data$INCWAGE*data$EDUC)
# summary(INCEDUCInteract)

#Creating linear models to see how different demographic variables affect AI Exposure
genderModel <- lm(aiExposure ~ as.factor(SEX) + as.factor(YEAR), data = data)
# summary(genderModel)
ggplot(data, aes(x = SEX, y = aiExposure)) +
  geom_boxplot(fill = "lightblue") +
  labs(title = "AI Exposure by Sex", x = "Sex", y = "AI Exposure") +
  theme_minimal()

# set.seed(123)  # For reproducibility
# 
# # Split the data into 80% for training and 20% for testing
# trainIndex <- sample(1:nrow(data), 0.8 * nrow(data))  
# trainData <- data[trainIndex, ]
# testData <- data[-trainIndex, ]
# 
# # Function to fit models, compute MSEs, and print full dataset regression results
# run_poly_regression <- function(var) {
#   for (deg in 1:3) {
#     cat("\n---", var, "Degree", deg, "---\n")
#     
#     # Fit model on training data
#     model <- lm(aiExposure ~ poly(get(var), deg) + as.factor(YEAR), data = trainData)
#     
#     # Predict on training and test data
#     train_predictions <- predict(model, newdata = trainData)
#     test_predictions <- predict(model, newdata = testData)
#     
#     # Calculate MSE for training and test data
#     train_mse <- mean((trainData$aiExposure - train_predictions)^2)
#     test_mse <- mean((testData$aiExposure - test_predictions)^2)
#     
#     cat("Training MSE:", train_mse, "\n")
#     cat("Test MSE:", test_mse, "\n")
#     
#     # Fit model on the full dataset
#     full_model <- lm(aiExposure ~ poly(get(var), deg) + as.factor(YEAR), data = data)
#     
#     # Print full dataset regression summary
#     print(summary(full_model))
#   }
# }
# 
# # Run regression for each variable
# variables <- c("AGE", "YRSUSA1", "INCWAGE")
# for (var in variables) {
#   run_poly_regression(var)
# }
# 
educModel <- lm(aiExposure ~ as.factor(EDUC) + as.factor(YEAR), data=data)
# summary(educModel)
ggplot(data, aes(x = EDUC, y = aiExposure)) +
  geom_boxplot(fill = "lightblue") +
  labs(title = "AI Exposure by Education Level", x = "Education", y = "AI Exposure") +
  theme_minimal()

ageModel <- lm(aiExposure ~ poly(AGE, 2) + as.factor(YEAR), data=data)
# summary(ageModel)
ggplot(data, aes(x = AGE, y = aiExposure)) +
  geom_point(alpha = 0.3, color = "gray") +
  geom_smooth(method = "lm", formula = y ~ poly(x, 2), color = "blue", se = FALSE) +
  labs(title = "AI Exposure vs. Age (Polynomial Fit)",
       x = "Age", y = "AI Exposure") +
  theme_minimal()

yrsInUSModel <- lm(aiExposure ~ poly(YRSUSA1, 2) + as.factor(YEAR), data=data)
# summary(yrsInUSModel)
ggplot(data, aes(x = YRSUSA1, y = aiExposure)) +
  geom_point(alpha = 0.3, color = "gray") +
  geom_smooth(method = "lm", formula = y ~ poly(x, 2), color = "blue", se = FALSE) +
  labs(title = "AI Exposure vs. Years in the U.S.",
       x = "Years in the U.S.", y = "AI Exposure") +
  theme_minimal()

IncModel <- lm(aiExposure ~ poly(INCWAGE, 2) + as.factor(YEAR), data=data)
# summary(IncModel)
ggplot(data, aes(x = INCWAGE, y = aiExposure)) +
  geom_point(alpha = 0.3, color = "gray") +
  geom_smooth(method = "lm", formula = y ~ poly(x, 2), color = "blue", se = FALSE) +
  labs(title = "AI Exposure vs. Income",
       x = "Income", y = "AI Exposure") +
  theme_minimal()

raceModel <- lm(aiExposure ~ as.factor(RACHSING) + as.factor(YEAR), data = data)
# summary(raceModel)
ggplot(data, aes(x = RACHSING, y = aiExposure)) +
  geom_boxplot(fill = "lightblue") +
  labs(title = "AI Exposure by Race", x = "Race", y = "AI Exposure") +
  theme_minimal()

indModel <- lm(aiExposure ~ as.factor(industry) + as.factor(YEAR), data=data)
# summary(indModel)
ggplot(data, aes(x = industry, y = aiExposure)) +
  geom_boxplot(fill = "lightblue") +
  labs(title = "AI Exposure by Industry", x = "Industry", y = "AI Exposure") +
  theme_minimal()

# whiteCollarModel <- lm(aiExposure ~ as.factor(whiteCollar) + as.factor(YEAR), data = data)
# summary(whiteCollarModel)

# totalModel <- lm(aiExposure ~ as.factor(SEX) + poly(AGE,2) + EDUC + as.factor(RACHSING) + poly(INCWAGE,2) + poly(YRSUSA1, 2) + as.factor(industry) + as.factor(whiteCollar) + as.factor(REGION), data=data)
# summary(totalModel)
# vif_total <- vif(totalModel)
# vif_total
# 
# totalModelwoWC <- lm(aiExposure ~  aiExposure_lag1 + as.factor(SEX) + poly(AGE,2) + EDUC + as.factor(RACHSING) + poly(INCWAGE,2) + poly(YRSUSA1, 2) + as.factor(industry) + as.factor(REGION) + as.factor(YEAR), data=na.omit(data))
# summary(totalModelwoWC)
# vif_woWC <- vif(totalModelwoWC)
# vif_woWC 
# 
# totalModelwoINC <- lm(aiExposure ~ as.factor(SEX) + poly(AGE,2) + EDUC + as.factor(RACHSING) + poly(YRSUSA1, 2) + as.factor(industry) + as.factor(REGION) + as.factor(YEAR), data=data)
# summary(totalModelwoINC)
# vif_woINC <- vif(totalModelwoINC)
# vif_woINC 
# 
# data %>%
#   group_by(OCC, YEAR) %>%
#   summarise(mean_exposure = mean(aiExposure)) %>%
#   spread(YEAR, mean_exposure)
# 
# summary(data$aiExposure - data$aiExposure_lag1)
# 
# testLagModel <- lm(aiExposure ~ aiExposure_lag1 + as.factor(YEAR), data = na.omit(data))
# summary(testLagModel)