
## This file is used to test the function

## Install the functions we need

library(rGeopoll)
library(openxlsx)
library(dplyr)
library(tidyr)

### Step 1: Generate a workbook name
wb <- createWorkbook()

###  Step 2: Add two sheets to the workbook, i.e one for count data, and the other for percentages
sheetname1 <- "Summary Tables (Count)"
addWorksheet(wb, sheetname1)

sheetname2 <- "Summary Tables (%)"
addWorksheet(wb, sheetname2)



##1. Read in the dataset, and clean it

df <- wafanyikazi ## these dataset is part of rGeopoll package

##2. Arguments
data <- df

vars <-c("Role","Department")


xlabs <- vars

gvars <- c("Gender", "Marital_Status","County")

grp_titles <- gvars

sr1s<-c(1,10,20,30)

sr2s<- sr1s+3

wbname<-"Wafanyikazi_SummaryTables"
path<-"~/Documents/PersonalDevelopment/R/"

##3. Generate a table of some of the arguements

tab <- data.frame(vars,xlabs, sr1s, sr2s)
tab <- tab %>%
  mutate_if(is.factor, as.character)

##4. Implement the function
for(i in 1:length(vars)){

r2xl(data,  tab$vars[i], tab$xlabs[i], gvars,grp_titles,wbname, tab$sr1s[i],tab$sr2s[i])

}

##4. Save the work book
saveWorkbook(wb, paste0(path,wbname,".xlsx"), overwrite = TRUE)
