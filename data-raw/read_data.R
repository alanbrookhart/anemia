# read_data.R
# Purpose: read-in NHANES anemia data for inclusion in package
# This file is run to rebuild the Shark data for the package

library(devtools)
library(tidyverse)
library(lubridate)
library(foreign)
library(forcats)

ds=as_tibble(read.dta("./data-raw/nhanes2009lab.dta"))

# make race factor variable
ds$ridreth1=ifelse(ds$ridreth1==1,2,ds$ridreth1)
ds$race <- factor(ds$ridreth1,
  levels = c(2,3,4,5),
  labels = c("Hispanic", "White","Black","Other"))

# make sex factor variable
ds$ridreth1=ifelse(ds$ridreth1==1,2,ds$ridreth1)
ds$riagendr <- factor(ds$riagendr,
                  levels = c(1,2),
                  labels = c("Male", "Female"))

anemia=with(ds,tibble(age=ridageyr,sex=riagendr,
                          tsat=lbxpct,iron=lbxirn,hgb=lbxhgb,ferr=lbxfer,
                          folate=lbxfol,vite=lbxvie,vita=lbxvia,
                          race,rdw=lbxrdw,wbc=lbxwbcsi))

anemia$anemia=with(anemia,ifelse((sex==1 & hgb<13) | (sex==0 & hgb<12),1,0))
anemia=na.omit(anemia)
use_data(anemia,overwrite=TRUE)

