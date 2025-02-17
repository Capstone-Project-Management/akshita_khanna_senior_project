import pandas as pd
import numpy as np
import statsmodels.api as sm

# Importing data
data = pd.read_csv("C:/Users/akshi/Downloads/usa_00005.csv")

# Initializing columns
data["aiExposure"] = 0
data["whiteCollar"] = 0

# Defining occupations with low, medium, and high exposure to AI
low_exposure = [4500, 4600, 4140, 6700, 6710, 3740, 4400, 7610, 4220, 4251, 4230, 3603, 3605, 9415, 3602, 6441, 8310, 8530, 4522]
medium_exposure = [10, 5230, 5240, 230, 2632, 900, 726, 136, 2861, 340, 51, 1450, 1650, 2205, 2825, 150, 4930, 1822, 2545, 3250]
high_exposure = [1541, 5110, 1910, 5120, 2631, 1400, 2862, 830, 5810, 2105, 5330, 3646, 1545, 2145, 5140, 5600, 5910, 5010, 940, 2170]

data.loc[data["OCC"].isin(low_exposure), "aiExposure"] = 1
data.loc[data["OCC"].isin(medium_exposure), "aiExposure"] = 2
data.loc[data["OCC"].isin(high_exposure), "aiExposure"] = 3

# Race categories
data["isWhite"] = (data["RACHSING"] == 1).astype(int)
data["isBlack"] = (data["RACHSING"] == 2).astype(int)
data["isNative"] = (data["RACHSING"] == 3).astype(int)
data["isAsian"] = (data["RACHSING"] == 4).astype(int)
data["isHispanic"] = (data["RACHSING"] == 5).astype(int)

# White-collar occupations
white_collar = low_exposure + medium_exposure + high_exposure
data.loc[data["OCC"].isin(white_collar), "whiteCollar"] = 1

# Running linear regression models
def run_model(formula, data):
    model = sm.OLS.from_formula(formula, data=data).fit()
    print(model.summary())
    return model

collarModelBlack = run_model("aiExposure ~ whiteCollar + isBlack + whiteCollar:isBlack", data)
collarModelHispanic = run_model("aiExposure ~ whiteCollar + isHispanic + whiteCollar:isHispanic", data)
collarModelWhite = run_model("aiExposure ~ whiteCollar + isWhite + whiteCollar:isWhite", data)
collarModelAsian = run_model("aiExposure ~ whiteCollar + isAsian + whiteCollar:isAsian", data)
collarModelNative = run_model("aiExposure ~ whiteCollar + isNative + whiteCollar:isNative", data)

genderModel = run_model("aiExposure ~ SEX + C(YEAR)", data)
ageModel = run_model("aiExposure ~ AGE + C(YEAR)", data)
educModel = run_model("aiExposure ~ EDUC + C(YEAR)", data)
yrsInUSModel = run_model("aiExposure ~ YRSUSA1 + C(YEAR)", data)
wageModel = run_model("aiExposure ~ INCWAGE + C(YEAR)", data)
