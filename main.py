import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from patsy import dmatrices
import statsmodels.api as sm
from sklearn.preprocessing import PolynomialFeatures
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error
import os

# Load data
data = pd.read_csv("DATA/usa_00008.csv.gz", low_memory=False)

# Initialize new columns
data['aiExposure'] = 0.0
data['whiteCollar'] = 0
data['industry'] = 0

# Replace this with the full mappings from the R script (abbreviated here)
ai_exposure_map = {
    1200: 0.66,
    3050: 0.64,
    3421: 0.64,
    3647: 0.64,
    1320: 0.63,
    1305: 0.61,
    1306: 0.61,
    1360: 0.6,
    1460: 0.6,
    1420: 0.59,
    1007: 0.59,
    1710: 0.59,
    1410: 0.58,
    1520: 0.58,
    800: 0.58,
    2145: 0.57,
    1005: 0.55,
    1400: 0.55,
    2634: 0.55,
    1006: 0.55,
    1720: 0.48,
    1750: 0.54,
    1010: 0.54,
    1108: 0.54,
    1350: 0.54,
    9030: 0.53,
    9040: 0.53,
    9150: 0.53,
    9210: 0.53,
    9300: 0.53,
    9310: 0.53,
    1551: 0.52,
    5920: 0.51,
    1450: 0.51,
    110: 0.49,
    1340: 0.48,
    6800: 0.48,
    6825: 0.48,
    6835: 0.48,
    6950: 0.48,
    845: 0.46,
    850: 0.46,
    900: 0.46,
    960: 0.46,
    120: 0.46,
    820: 0.46,
    830: 0.46,
    860: 0.46,
    910: 0.46,
    930: 0.46,
    940: 0.46,
    1440: 0.45,
    2810: 0.45,
    1530: 0.45,
    1430: 0.44,
    5120: 0.44,
    5140: 0.44,
    5150: 0.44,
    5160: 0.44,
    5230: 0.44,
    1700: 0.43,
    1555: 0.43,
    1800: 0.43,
    1745: 0.43,
    360: 0.41,
    2825: 0.41,
    4800: 0.41,
    4750: 0.41,
    4760: 0.41,
    4810: 0.41,
    4820: 0.41,
    4840: 0.41,
    4850: 0.41,
    4900: 0.41,
    4940: 0.41,
    4965: 0.41,
    40: 0.41,
    51: 0.41,
    52: 0.41,
    60: 0.41,
    6120: 0.4,
    6130: 0.4,
    5000: 0.4,
    5100: 0.4,
    5110: 0.4,
    5220: 0.4,
    5240: 0.4,
    5260: 0.4,
    5300: 0.4,
    5250: 0.4,
    5310: 0.4,
    5330: 0.4,
    5340: 0.4,
    5350: 0.4,
    5400: 0.4,
    5410: 0.4,
    5420: 0.4,
    5710: 0.4,
    5720: 0.4,
    5740: 0.4,
    5810: 0.4,
    5820: 0.4,
    5840: 0.4,
    5860: 0.4,
    5910: 0.4,
    5940: 0.4,
    5500: 0.39,
    5510: 0.39,
    5540: 0.39,
    1600: 0.39,
    700: 0.39,
    750: 0.39,
    5010: 0.39,
    5020: 0.39,
    5040: 0.39,
    20: 0.39,
    101: 0.38,
    102: 0.38,
    135: 0.38,
    137: 0.38,
    150: 0.38,
    160: 0.38,
    710: 0.38,
    735: 0.38,
    2600: 0.26,
    2920: 0.37,
    2910: 0.37,
    1860: 0.37,
    140: 0.36,
    300: 0.36,
    350: 0.33,
    2861: 0.32,
    1760: 0.32,
    2060: 0.32,
    3700: 0.32,
    3710: 0.32,
    3720: 0.32,
    3740: 0.32,
    3750: 0.32,
    3801: 0.32,
    3802: 0.32,
    3820: 0.32,
    3870: 0.32,
    3910: 0.32,
    3930: 0.32,
    3945: 0.32,
    2700: 0.31,
    2710: 0.31,
    6050: 0.29,
    6040: 0.29,
    205: 0.29,
    136: 0.28,
    1610: 0.28,
    1825: 0.26,
    310: 0.26,
    340: 0.26,
    7000: 0.26,
    7010: 0.26,
    7020: 0.26,
    7030: 0.26,
    7040: 0.26,
    7100: 0.26,
    7120: 0.26,
    7130: 0.26,
    7140: 0.26,
    7150: 0.26,
    7160: 0.26,
    7200: 0.26,
    7220: 0.26,
    7260: 0.26,
    7300: 0.26,
    7315: 0.26,
    7320: 0.26,
    7340: 0.26,
    7410: 0.26,
    7420: 0.26,
    7610: 0.26,
    7640: 0.26,
    6200: 0.25,
    6210: 0.25,
    6220: 0.25,
    6230: 0.25,
    6240: 0.25,
    6250: 0.25,
    6330: 0.25,
    6360: 0.25,
    6400: 0.25,
    6410: 0.25,
    6441: 0.25,
    6442: 0.25,
    6460: 0.25,
    6515: 0.25,
    6520: 0.25,
    6530: 0.25,
    6540: 0.25,
    6660: 0.25,
    6700: 0.25,
    6710: 0.25,
    6720: 0.25,
    6730: 0.25,
    6740: 0.25,
    6260: 0.25,
    6305: 0.25,
    6600: 0.25,
    6765: 0.25,
    220: 0.25,
    2016: 0.25,
    3648: 0.24,
    3250: 0.24,
    3424: 0.24,
    2555: 0.23,
    2751: 0.22,
    2752: 0.22,
    3401: 0.22,
    3430: 0.22,
    8760: 0.22,
    2011: 0.22,
    2012: 0.22,
    2013: 0.22,
    2014: 0.22,
    3090: 0.22,
    3110: 0.22,
    4621: 0.22,
    4622: 0.22,
    335: 0.22,
    0: 0.2,
    3030: 0.19,
    2050: 0.19,
    1821: 0.17,
    3545: 0.18,
    3550: 0.18,
    2320: 0.17,
    4510: 0.15,
    4500: 0.15,
    4521: 0.15,
    4525: 0.15,
    4000: 0.15,
    4020: 0.15,
    4010: 0.15,
    4030: 0.15,
    4160: 0.15,
    5730: 0.15,
    1935: 0.13,
    1822: 0.12,
    2310: 0.12,
    2300: 0.12,
    2003: 0.11,
    3150: 0.11,
    3160: 0.11,
    3200: 0.11,
    3210: 0.11,
    3220: 0.11,
    3245: 0.11,
    3610: 0.11,
    3620: 0.11,
    3630: 0.11,
    2002: 0.1,
    2330: 0.09,
    230: 0.09,
    3603: 0.06,
    3255: 0.06,
    3256: 0.06,
    3258: 0.06,
    3500: 0.06,
}


industry_map = {
    20: 1,
    40: 11,
    51: 11,
    52: 11,
    60: 1,
    101: 1,
    102: 1,
    110: 2,
    120: 1,
    135: 1,
    136: 1,
    137: 1,
    140: 5,
    150: 1,
    160: 6,
    205: 4,
    220: 12,
    230: 7,
    300: 10,
    310: 9,
    335: 9,
    340: 9,
    350: 8,
    360: 10,
    700: 6,
    710: 1,
    735: 1,
    750: 1,
    800: 1,
    820: 1,
    830: 1,
    845: 1,
    850: 1,
    860: 1,
    900: 1,
    910: 1,
    930: 1,
    940: 1,
    960: 1,
    1005: 2,
    1006: 2,
    1007: 2,
    1010: 2,
    1108: 2,
    1200: 1,
    1305: 10,
    1306: 10,
    1320: 10,
    1340: 10,
    1350: 10,
    1360: 10,
    1400: 2,
    1410: 10,
    1420: 10,
    1430: 10,
    1440: 10,
    1450: 10,
    1460: 10,
    1520: 4,
    1530: 10,
    1551: 10,
    1555: 10,
    1600: 4,
    1610: 8,
    1700: 10,
    1710: 10,
    1720: 10,
    1745: 10,
    1750: 10,
    1760: 10,
    1800: 1,
    1821: 8,
    1822: 7,
    1825: 8,
    1860: 10,
    1935: 10,
    2002: 7,
    2003: 8,
    2011: 7,
    2012: 7,
    2013: 7,
    2014: 7,
    2016: 7,
    2050: 7,
    2060: 7,
    2145: 11,
    2300: 7,
    2310: 7,
    2320: 7,
    2330: 7,
    2555: 7,
    2600: 9,
    2634: 9,
    2700: 9,
    2710: 9,
    2751: 7,
    2752: 9,
    2810: 3,
    2825: 11,
    2861: 3,
    2910: 3,
    2920: 3,
    3030: 8,
    3050: 8,
    3090: 8,
    3110: 8,
    3150: 8,
    3160: 8,
    3200: 8,
    3210: 8,
    3220: 8,
    3245: 8,
    3250: 8,
    3255: 8,
    3256: 8,
    3258: 8,
    3401: 8,
    3421: 8,
    3424: 8,
    3430: 8,
    3500: 8,
    3545: 8,
    3550: 8,
    3603: 8,
    3610: 8,
    3620: 8,
    3630: 8,
    3647: 8,
    3648: 8,
    3700: 7,
    3710: 7,
    3720: 7,
    3740: 7,
    3750: 7,
    3801: 7,
    3802: 7,
    3820: 7,
    3870: 7,
    3910: 11,
    3930: 7,
    3945: 7,
    4000: 9,
    4010: 9,
    4020: 9,
    4030: 9,
    4160: 9,
    4500: 9,
    4510: 7,
    4521: 9,
    4525: 9,
    4621: 8,
    4622: 9,
    4750: 5,
    4760: 5,
    4800: 11,
    4810: 1,
    4820: 1,
    4840: 5,
    4850: 5,
    4900: 11,
    4940: 11,
    4965: 11,
    5000: 11,
    5010: 11,
    5020: 11,
    5040: 11,
    5100: 11,
    5110: 11,
    5120: 11,
    5140: 11,
    5150: 11,
    5160: 11,
    5220: 11,
    5230: 1,
    5240: 11,
    5250: 7,
    5260: 11,
    5300: 9,
    5310: 11,
    5330: 1,
    5340: 1,
    5350: 11,
    5400: 11,
    5410: 11,
    5420: 11,
    5500: 6,
    5510: 6,
    5540: 6,
    5710: 11,
    5720: 11,
    5730: 8,
    5740: 11,
    5810: 11,
    5820: 11,
    5840: 1,
    5860: 11,
    5910: 11,
    5920: 11,
    5940: 11,
    6040: 4,
    6050: 4,
    6120: 4,
    6130: 4,
    6200: 12,
    6210: 12,
    6220: 12,
    6230: 12,
    6240: 12,
    6250: 12,
    6260: 12,
    6305: 12,
    6330: 12,
    6360: 12,
    6400: 12,
    6410: 12,
    6441: 12,
    6442: 12,
    6460: 12,
    6515: 12,
    6520: 12,
    6530: 12,
    6540: 12,
    6600: 12,
    6660: 12,
    6700: 12,
    6710: 12,
    6720: 12,
    6730: 12,
    6740: 12,
    6765: 12,
    6800: 4,
    6825: 4,
    6835: 4,
    6950: 4,
    7000: 12,
    7010: 12,
    7020: 12,
    7030: 12,
    7040: 12,
    7100: 12,
    7120: 12,
    7130: 12,
    7140: 6,
    7150: 6,
    7160: 6,
    7200: 6,
    7220: 6,
    7260: 6,
    7300: 12,
    7315: 12,
    7320: 12,
    7340: 12,
    7410: 12,
    7420: 12,
    7610: 12,
    7640: 12,
    8760: 8,
    9030: 6,
    9040: 6,
    9150: 6,
    9210: 6,
    9300: 6,
    9310: 6,
}


white_collar_set = {
    20,
    40,
    51,
    52,
    60,
    101,
    102,
    110,
    120,
    135,
    136,
    137,
    140,
    150,
    160,
    220,
    230,
    300,
    310,
    335,
    340,
    350,
    360,
    700,
    710,
    735,
    750,
    800,
    820,
    830,
    845,
    850,
    860,
    900,
    910,
    930,
    940,
    960,
    1005,
    1006,
    1007,
    1010,
    1108,
    1200,
    1305,
    1306,
    1320,
    1340,
    1350,
    1360,
    1400,
    1410,
    1420,
    1430,
    1440,
    1450,
    1460,
    1520,
    1530,
    1551,
    1555,
    1600,
    1610,
    1700,
    1710,
    1720,
    1745,
    1750,
    1760,
    1800,
    1821,
    1822,
    1825,
    1860,
    1935,
    2002,
    2003,
    2011,
    2012,
    2013,
    2014,
    2016,
    2050,
    2060,
    2145,
    2300,
    2310,
    2320,
    2330,
    2555,
    2634,
    2710,
    2751,
    2810,
    2825,
    2861,
    3030,
    3050,
    3090,
    3110,
    3150,
    3160,
    3200,
    3210,
    3220,
    3245,
    3250,
    3255,
    3256,
    3401,
    3421,
    3424,
    3430,
    3500,
    3545,
    3550,
    3603,
    3610,
    3620,
    3630,
    3647,
    3648,
    3820,
    3910,
    4621,
    4622,
    4800,
    4810,
    4820,
    4850,
    4900,
    4940,
    4965,
    5000,
    5010,
    5020,
    5040,
    5100,
    5110,
    5120,
    5140,
    5150,
    5160,
    5220,
    5230,
    5240,
    5250,
    5260,
    5300,
    5310,
    5330,
    5340,
    5350,
    5400,
    5410,
    5420,
    5500,
    5540,
    5710,
    5720,
    5730,
    5740,
    5810,
    5820,
    5840,
    5860,
    5910,
    5920,
    5940,
    6200,
    7000,
    8760,
    9030,
    9040,
}


# Apply mappings
data['aiExposure'] = data['OCC'].map(ai_exposure_map).fillna(0)
data['industry'] = data['OCC'].map(industry_map).fillna(0).astype(int)
data['whiteCollar'] = data['OCC'].apply(lambda x: 1 if x in white_collar_set else 0)


gender_model = smf.ols('aiExposure ~ C(SEX) + C(YEAR)', data=data).fit()

plt.figure(figsize=(8, 6))
sns.boxplot(data=data, x='SEX', y='aiExposure', palette='Blues')
plt.title("AI Exposure by Sex")
plt.xlabel("Sex")
plt.ylabel("AI Exposure")
plt.tight_layout()
plt.savefig("sexPlot.jpg")
plt.close()

# Education level
educ_model = smf.ols('aiExposure ~ C(EDUC) + C(YEAR)', data=data).fit()

# Age Model
age_model = smf.ols('aiExposure ~ np.power(AGE, 2) + AGE + C(YEAR)', data=data).fit()

# Years in the US
yrsus_model = smf.ols('aiExposure ~ np.power(YRSUSA1, 2) + YRSUSA1 + C(YEAR)', data=data).fit()

# Income
inc_model = smf.ols('aiExposure ~ np.power(INCWAGE, 2) + INCWAGE + C(YEAR)', data=data).fit()

# Race
race_model = smf.ols('aiExposure ~ C(RACHSING) + C(YEAR)', data=data).fit()

# Industry
industry_model = smf.ols('aiExposure ~ C(industry) + C(YEAR)', data=data).fit()
