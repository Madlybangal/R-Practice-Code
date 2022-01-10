#http://open.canada.ca/data/en/dataset/e80851b8-de68-43bd-a85c-c72e1b3a3890
setwd("C:/Users/703221527/Desktop/Today/CanadaLabourdata/")
library(tidyr)
library(dplyr)
file <- list.files(path = ".", pattern = NULL, full.names = FALSE, ignore.case = FALSE)

data <- list()
occupdata <-list()
j=0
for (i in 1:length(file)){
  data[[i]] <- read.csv(file[i],header=T,quote='"')
 
  if (("Occupation_Name" %in% colnames(data[[i]])) & ("X2019" %in% colnames(data[[i]]))){
    j=j+1
    
    occupdata[[j]] <- read.csv(file[i],header=T,quote='"')
        if(!exists("datasets")){
            datasets <- occupdata[[j]]
        }     
        if (exists("datasets")){
          temp <-occupdata[[j]]
          datasets <-(rbind(datasets, temp))
          rm(temp)
        }
  }
    
}

View(datasets)

# remove NA values from data frame
datasets1<-na.omit(datasets)
View(datasets1)
#Question 3
#Rearrange data using gather
datasets2 <- datasets1 %>% gather(Year,Value, X2018:X2028)
View(datasets2)
#Question 4
#Remove X from Year column
datasets3 <- datasets2 %>% mutate(Year= as.numeric(substring(Year,2,5)))
View(datasets3)
#Question 5,6
#get industry data set
idata <- list()
inddata <-list()
file <- list.files(path = ".", pattern = NULL, full.names = FALSE, ignore.case = FALSE)
j=0

for (i in 1:length(file)){
  idata[[i]] <- read.csv(file[i],header=T,quote='"')
  
  browser()
 
  if (("Industry" %in% colnames(idata[[i]])) & ("X2019" %in% colnames(idata[[i]]))){
    j=j+1
    print(file[i])  
    inddata[[j]] <- read.csv(file[i],header=T,quote='"')
    if(!exists("idatasets")){
      idatasets <- mutate(inddata[[j]],Description=file[i])
      #idatasets <- inddata[[j]]
      View(idatasets)
    }     
    if (exists("idatasets")){
      temp1 <-mutate(inddata[[j]],Description=file[i])
      #temp1 <-inddata[[j]]
      idatasets <-rbind(idatasets, temp1)
      rm(temp1)
      View(idatasets)
    }
      
  }
  
}
View(idatasets)
#Rearrange data using gather
fiddatsets <-idatasets %>% gather(Year,Value, X2018:X2028)
View(fiddatsets)
#Question 7
# remove NA values from data frame
fiddatasets1<-na.omit(fiddatsets)
View(fiddatasets1)
fiddatasets2 <- fiddatasets1 %>% mutate(Year= as.numeric(substring(Year,2,5)))
View(fiddatasets2)
jobseekers <- filter(fiddatasets2, Description == "industrial_jo_pe_par_secteur_2019_2028.csv") %>% select(-Description,-Secteur) %>% mutate(Value=as.numeric(Value))
#Question 8
View(jobseekers)
jobSeekerSum <- summarise(group_by(jobseekers, Industry), Total = sum(Value))
jobSeekerSum <- arrange(jobSeekerSum, (Total))
topIndustries <- jobSeekerSum[1:5,]
topIndustries
