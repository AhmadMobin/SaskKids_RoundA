library(shiny)
library(shinydashboard)
library(rCharts) #Interactive Plots
library(lubridate) #Date Functions
library(sqldf)
library(ggplot2)
library(plotly)
library(DT) #Data Tables
library(googleVis) #correlation
library(rsconnect)
library(rdrop2)
library(RCurl)
library(foreign)


#LOADING DATA
#Criteria 3 Data Set: Time= 10 hrs/day; Number of Valid Days= 3
Criteria3_data <- read.csv(text=getURL("https://raw.githubusercontent.com/AhmadMobin/SaskKids_RoundA/645f5925243931f45b5c34a4e1b12f33d52e2883/Exported_MasterTable_Criteria3.csv?token=AXfVptolG4HRdhu1rJNjNlFSVegE_PwCks5YztlVwA%3D%3D"),header = TRUE, stringsAsFactors = FALSE, fileEncoding = "UTF-8")

Criteria3_data<- Criteria3_data[,-1]

Criteria3_data$Age<-as.factor(Criteria3_data$Age)
Criteria3_data$Grade<-as.factor(Criteria3_data$Grade)
Criteria3_data$Gender<-as.factor(Criteria3_data$Gender)
Criteria3_data$Newcomer<-as.factor(Criteria3_data$Newcomer)
Criteria3_data$Era<-as.factor(Criteria3_data$Era)
Criteria3_data$NALP_Cat<-as.factor(Criteria3_data$NALP_Cat)
Criteria3_data$TempCat<-as.factor(Criteria3_data$TempCat)
Criteria3_data$RainCat<-as.factor(Criteria3_data$RainCat)
Criteria3_data$SnowCat<-as.factor(Criteria3_data$SnowCat)
Criteria3_data$WindCat<-as.factor(Criteria3_data$WindCat)
Criteria3_data$DayLightCat<-as.factor(Criteria3_data$DayLightCat)
Criteria3_data$VDaySequence<-as.factor(Criteria3_data$VDaySequence)

#Criteria 1 Data Set: Time= 8 hrs/day; Number of Valid Days= 4
Criteria1_data <-read.csv(text=getURL("https://raw.githubusercontent.com/AhmadMobin/SaskKids_RoundA/645f5925243931f45b5c34a4e1b12f33d52e2883/Exported_MasterTable_Criteria1.csv?token=AXfVpvyWTVmZ5JoqVHyP_pIi_uCbiB7Zks5YztnawA%3D%3D"),header = TRUE, stringsAsFactors = FALSE, fileEncoding = "UTF-8")
Criteria1_data<- Criteria1_data[,-1]

Criteria1_data$Age<-as.factor(Criteria1_data$Age)
Criteria1_data$Grade<-as.factor(Criteria1_data$Grade)
Criteria1_data$Gender<-as.factor(Criteria1_data$Gender)
Criteria1_data$Newcomer<-as.factor(Criteria1_data$Newcomer)
Criteria1_data$Era<-as.factor(Criteria1_data$Era)
Criteria1_data$NALP_Cat<-as.factor(Criteria1_data$NALP_Cat)
Criteria1_data$TempCat<-as.factor(Criteria1_data$TempCat)
Criteria1_data$RainCat<-as.factor(Criteria1_data$RainCat)
Criteria1_data$SnowCat<-as.factor(Criteria1_data$SnowCat)
Criteria1_data$WindCat<-as.factor(Criteria1_data$WindCat)
Criteria1_data$DayLightCat<-as.factor(Criteria1_data$DayLightCat)
Criteria1_data$VDaySequence<-as.factor(Criteria1_data$VDaySequence)


#Criteria 2 Data Set: Time= 8 hrs/day; Number of Valid Days= 3
Criteria2_data <- read.csv(text=getURL("https://raw.githubusercontent.com/AhmadMobin/SaskKids_RoundA/645f5925243931f45b5c34a4e1b12f33d52e2883/Exported_MasterTable_Criteria2.csv?token=AXfVpsEKpF4D4ickr-oOFB6tBIPQA9F6ks5YztoLwA%3D%3D"),header = TRUE, stringsAsFactors = FALSE, fileEncoding = "UTF-8")
Criteria2_data<- Criteria2_data[,-1]

Criteria2_data$Age<-as.factor(Criteria2_data$Age)
Criteria2_data$Grade<-as.factor(Criteria2_data$Grade)
Criteria2_data$Gender<-as.factor(Criteria2_data$Gender)
Criteria2_data$Newcomer<-as.factor(Criteria2_data$Newcomer)
Criteria2_data$Era<-as.factor(Criteria2_data$Era)
Criteria2_data$NALP_Cat<-as.factor(Criteria2_data$NALP_Cat)
Criteria2_data$TempCat<-as.factor(Criteria2_data$TempCat)
Criteria2_data$RainCat<-as.factor(Criteria2_data$RainCat)
Criteria2_data$SnowCat<-as.factor(Criteria2_data$SnowCat)
Criteria2_data$WindCat<-as.factor(Criteria2_data$WindCat)
Criteria2_data$DayLightCat<-as.factor(Criteria2_data$DayLightCat)
Criteria2_data$VDaySequence<-as.factor(Criteria2_data$VDaySequence)

#Criteria 4 Data Set: Time= 10 hrs/day; Number of Valid Days= 3
Criteria4_data <- read.csv(text=getURL("https://raw.githubusercontent.com/AhmadMobin/SaskKids_RoundA/645f5925243931f45b5c34a4e1b12f33d52e2883/Exported_MasterTable_Criteria4.csv?token=AXfVpo9FZRJl17NRN-cuGQWG7HKuZykPks5YztpUwA%3D%3D"),header = TRUE, stringsAsFactors = FALSE, fileEncoding = "UTF-8")
Criteria4_data<- Criteria4_data[,-1]

Criteria4_data$Age<-as.factor(Criteria4_data$Age)
Criteria4_data$Grade<-as.factor(Criteria4_data$Grade)
Criteria4_data$Gender<-as.factor(Criteria4_data$Gender)
Criteria4_data$Newcomer<-as.factor(Criteria4_data$Newcomer)
Criteria4_data$Era<-as.factor(Criteria4_data$Era)
Criteria4_data$NALP_Cat<-as.factor(Criteria4_data$NALP_Cat)
Criteria4_data$TempCat<-as.factor(Criteria4_data$TempCat)
Criteria4_data$RainCat<-as.factor(Criteria4_data$RainCat)
Criteria4_data$SnowCat<-as.factor(Criteria4_data$SnowCat)
Criteria4_data$WindCat<-as.factor(Criteria4_data$WindCat)
Criteria4_data$DayLightCat<-as.factor(Criteria4_data$DayLightCat)
Criteria4_data$VDaySequence<-as.factor(Criteria4_data$VDaySequence)


#Original
Original_data<- read.csv(text=getURL("https://raw.githubusercontent.com/AhmadMobin/SaskKids_RoundA/645f5925243931f45b5c34a4e1b12f33d52e2883/accel_activity_summary.csv?token=AXfVplBDGWlsz7ZDoXN9B9El-nHXP3fGks5Yztq9wA%3D%3D"),header = TRUE, stringsAsFactors = FALSE, fileEncoding = "UTF-8")
#Student 4476616246 Disgard
Original_data<-Original_data[!Original_data$participant=="4476616246",]
#Student 2513035516 should be 2513503516
Original_data$participant[Original_data$participant=="2513035516"]<-"2513503516"
#Student 5167701295 should be 5167701102
Original_data$participant[Original_data$participant=="5167701295"]<-"5167701102"
#Student 7216898278 should be 7216818278
Original_data$participant[Original_data$participant=="7216898278"]<-"7216818278"
#Changing the format of the dates
Original_data$date<- mdy(Original_data$date) 


#Pre-Experiment Survey Data
Survey_Data<- read.csv(text=getURL("https://raw.githubusercontent.com/AhmadMobin/SaskKids_RoundA/645f5925243931f45b5c34a4e1b12f33d52e2883/SurveyData.csv?token=AXfVpqMfaNH7vJWxTyjKCvCxHzQN_nrtks5YztskwA%3D%3D"),header = TRUE, stringsAsFactors = FALSE, fileEncoding = "UTF-8")
#Re-coding NewComer Column: 1=Yes, 2=No
Survey_Data$Newcomer<-as.character(Survey_Data$Newcomer)
Survey_Data$Newcomer [Survey_Data$Newcomer=="No"] <- "0"
Survey_Data$Newcomer [Survey_Data$Newcomer=="Yes"] <- "1"
Survey_Data$Newcomer [Survey_Data$Newcomer=="no"] <- "0"
Survey_Data$Newcomer [Survey_Data$Newcomer=="no (2009)"] <- "0"
Survey_Data$Newcomer [Survey_Data$Newcomer=="Unsure"] <- NA
Survey_Data$Newcomer [Survey_Data$Newcomer=="yes"] <- "1"
#Survey Data has a student entered twice. Use this code to remove the duplicate:
Survey_Data<-Survey_Data[!duplicated(Survey_Data$ParticipantCode),]
#Change the format of the dates
Survey_Data$DOB<- mdy(Survey_Data$DOB)

#Neighbourhood Codes
NBHDCodes<- read.csv(text=getURL("https://raw.githubusercontent.com/AhmadMobin/SaskKids_RoundA/645f5925243931f45b5c34a4e1b12f33d52e2883/NBHDCodes2014.csv?token=AXfVpmFnuqmKA9gV-m2fESrAMIfphnBDks5YzttiwA%3D%3D"),header = TRUE, stringsAsFactors = FALSE, fileEncoding = "UTF-8")
#Add Blairmore
NBHDCodes$Neighbourhood<-as.character(NBHDCodes$Neighbourhood)
NBHDCodes<- rbind (NBHDCodes, c (74,"Blairmore SC", 4))
#Undefined Neighbourhoods
NBHDCodes$Era<-as.numeric(NBHDCodes$Era)

#NALP
NALP_Data<- read.csv(text=getURL("https://raw.githubusercontent.com/AhmadMobin/SaskKids_RoundA/645f5925243931f45b5c34a4e1b12f33d52e2883/Fuller_NALP.csv?token=AXfVpjkDAoJXju58Y9UMvgHP5t-hHCM2ks5YztudwA%3D%3D"),header = TRUE, stringsAsFactors = FALSE, fileEncoding = "UTF-8")
#SELECTING THE COLUMNS YOU NEED
NALP_Data<- sqldf ("SELECT Nghd_Name, NALP_AF, NALP_DD, NALP_SAFE, NALP_UA
              FROM NALP_Data")
#Removing Duplicates
NALP_Data<-NALP_Data[!duplicated(NALP_Data$Nghd_Name),]
#Making a Total NALP Category
Total_NALP<- c(NALP_Data$NALP_AF + NALP_Data$NALP_DD + NALP_Data$NALP_SAFE)
#Inserting TOTAL NALP into the table
NALP_Data$Total_NALP <- Total_NALP
#Splitting **NALP_Cat into Categories:** *1/Low Walkability*= 7.18749 to 10.68750; *2*= 10.36751 to 11.29167; *3*= 11.29168 to 12.54167; *4/High Walkability*= 12.54168 to 14.02084
NALP_Data$NALP_Cat<- cut (NALP_Data$Total_NALP, breaks=c(7.18749,10.68750,11.29167,12.54167,14.02084), labels=c("1","2","3","4"), right=TRUE)
#Re-coding Neighbourhood Names so they are in the same in both tables (NBHDCodes & NALP)
NALP_Data$Nghd_Name<-as.character(NALP_Data$Nghd_Name)
NALP_Data$Nghd_Name [NALP_Data$Nghd_Name=="Lawson Heights Suburban Centre"]<- "Lawson SC"
NALP_Data$Nghd_Name [NALP_Data$Nghd_Name=="Nutana Suburban Centre"]<- "Nutana SC"
NALP_Data$Nghd_Name [NALP_Data$Nghd_Name=="University Heights Suburban Centre"]<- "University Heights SC"
NALP_Data$Nghd_Name [NALP_Data$Nghd_Name=="Lakewood Suburban Centre"]<- "Lakewood SC"
NALP_Data$Nghd_Name [NALP_Data$Nghd_Name=="Adelaide/Churchill"]<- "Adelaide /Churchill"
NALP_Data$Nghd_Name [NALP_Data$Nghd_Name=="Kelsey - Woodlawn"]<- "Kelsey Woodlawn"

#2014 Weather Data
SaskatoonWeather2014<- read.csv(text=getURL("https://raw.githubusercontent.com/AhmadMobin/SaskKids_RoundA/master/SaskatoonWeather_2014.csv?token=AXfVpsQRgM-KjoR0RyTXeYepvtg0zdaSks5Yz0LcwA%3D%3D"),header = TRUE, stringsAsFactors = FALSE, fileEncoding = "UTF-8") 


#Cleaning up SaskatoonWeather2014
SaskatoonWeather2014<- SaskatoonWeather2014[c(1,6,20,22,26)]
names (SaskatoonWeather2014) [1]<-"Date"
names (SaskatoonWeather2014) [2]<-"Temp_C"
names (SaskatoonWeather2014) [3]<-"Rain_mm"
names (SaskatoonWeather2014) [4]<-"Snow_cm"
names (SaskatoonWeather2014) [5]<-"Wind_km"
#Changing the date formats 
SaskatoonWeather2014$Date<- mdy(SaskatoonWeather2014$Date) 


#2015 Weather Data
SaskatoonWeather2015 <-read.csv(text=getURL("https://raw.githubusercontent.com/AhmadMobin/SaskKids_RoundA/master/SaskatoonWeather_2015.csv?token=AXfVpl2ki3QqHoikhhg3SuGsS1FZfuZYks5Yz0MEwA%3D%3D"),header = TRUE, stringsAsFactors = FALSE, fileEncoding = "UTF-8")
#Cleaning up SaskatoonWeather2015
SaskatoonWeather2015<- SaskatoonWeather2015[c(1,6,20,22,26)]
names (SaskatoonWeather2015) [1]<-"Date"
names (SaskatoonWeather2015) [2]<-"Temp_C"
names (SaskatoonWeather2015) [3]<-"Rain_mm"
names (SaskatoonWeather2015) [4]<-"Snow_cm"
names (SaskatoonWeather2015) [5]<-"Wind_km"
#Changing the date formats 
SaskatoonWeather2015$Date<- mdy(SaskatoonWeather2015$Date) 

#WIND
#Changing <31 km/h into whole numbers 
SaskatoonWeather2014$Wind_km<- as.numeric (as.character(SaskatoonWeather2014$Wind_km))

#Sept. 28, 2014:
SaskatoonWeather2014$Wind_km [SaskatoonWeather2014$Date=="2014-09-28"]<- "15"
#Oct. 4, 2014
SaskatoonWeather2014$Wind_km [SaskatoonWeather2014$Date=="2014-10-04"]<- "18"
#Oct. 8th 2014
SaskatoonWeather2014$Wind_km [SaskatoonWeather2014$Date=="2014-10-08"]<- "16"
#Oct. 9, 2014
SaskatoonWeather2014$Wind_km [SaskatoonWeather2014$Date=="2014-10-09"]<- "17"
#Oct. 19, 2014
SaskatoonWeather2014$Wind_km [SaskatoonWeather2014$Date=="2014-10-19"]<- "14"
#Oct. 20, 2014
SaskatoonWeather2014$Wind_km [SaskatoonWeather2014$Date=="2014-10-20"]<- "19"
#Oct. 21, 2014
SaskatoonWeather2014$Wind_km [SaskatoonWeather2014$Date=="2014-10-21"]<- "21"
#Oct. 22, 2014
SaskatoonWeather2014$Wind_km [SaskatoonWeather2014$Date=="2014-10-22"]<- "18"
#Oct. 28, 2014
SaskatoonWeather2014$Wind_km [SaskatoonWeather2014$Date=="2014-10-28"]<- "16"
#Nov. 8, 2014
SaskatoonWeather2014$Wind_km [SaskatoonWeather2014$Date=="2014-11-08"]<- "18"
#Nov. 9, 2014
SaskatoonWeather2014$Wind_km [SaskatoonWeather2014$Date=="2014-11-09"]<- "17"
#Nov.14, 2014
SaskatoonWeather2014$Wind_km [SaskatoonWeather2014$Date=="2014-11-14"]<- "16"
#Nov.19, 2014
SaskatoonWeather2014$Wind_km [SaskatoonWeather2014$Date=="2014-11-19"]<- "21"
#Nov. 20, 2014
SaskatoonWeather2014$Wind_km [SaskatoonWeather2014$Date=="2014-11-20"]<- "17"
#Nov. 21, 2014
SaskatoonWeather2014$Wind_km [SaskatoonWeather2014$Date=="2014-11-21"]<- "17"
#Dec. 4, 2014
SaskatoonWeather2014$Wind_km [SaskatoonWeather2014$Date=="2014-12-04"]<- "17"
#Dec 5, 2014
SaskatoonWeather2014$Wind_km [SaskatoonWeather2014$Date=="2014-12-05"]<- "18"
#Dec 15, 2014
SaskatoonWeather2014$Wind_km [SaskatoonWeather2014$Date=="2014-12-15"]<- "15"
#Dec 16, 2014
SaskatoonWeather2014$Wind_km [SaskatoonWeather2014$Date=="2014-12-16"]<- "22"
#Dec 18, 2014
SaskatoonWeather2014$Wind_km [SaskatoonWeather2014$Date=="2014-12-18"]<- "15"
#Jan. 13, 2015:
SaskatoonWeather2015$Wind_km [SaskatoonWeather2015$Date=="2015-01-13"]<- "17"
#Jan. 18, 2015:
SaskatoonWeather2015$Wind_km [SaskatoonWeather2015$Date=="2015-01-18"]<- "14"
#Jan. 19, 2015:
SaskatoonWeather2015$Wind_km [SaskatoonWeather2015$Date=="2015-01-19"]<- "17"

#DAY LIGHT
#Week 1: Sept 23- Sept 31
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-09-23"]<- "13.26"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-09-24"]<- "13.19"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-09-25"]<- "13.13"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-09-26"]<- "13.06"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-09-27"]<- "12.99"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-09-28"]<- "12.92"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-09-29"]<- "12.86"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-09-30"]<- "12.79"
#Week 2: Oct 2 to Oct 8
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-10-02"]<- "12.66"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-10-03"]<- "12.59"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-10-04"]<- "12.53"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-10-05"]<- "12.46"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-10-06"]<- "12.39"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-10-07"]<- "12.33"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-10-08"]<- "12.26"
#Week 3: Oct 15 to Oct 21
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-10-15"]<- "11.81"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-10-16"]<- "11.75"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-10-17"]<- "11.69"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-10-18"]<- "11.62"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-10-19"]<- "11.56"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-10-20"]<- "11.50"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-10-21"]<- "11.44"
#Week 4: Oct 24 to Oct 30 
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-10-24"]<- "11.25"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-10-25"]<- "11.19"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-10-26"]<- "11.13"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-10-27"]<- "11.08"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-10-28"]<- "11.02"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-10-29"]<- "10.96"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-10-30"]<- "10.90"
#Week 5: Nov 5 to Nov 11
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-11-05"]<- "10.56"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-11-06"]<- "10.51"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-11-07"]<- "10.45"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-11-08"]<- "10.40"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-11-09"]<- "10.35"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-11-10"]<- "10.29"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-11-11"]<- "10.24"
#Week 6: Nov 6 to Nov 12 
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-11-12"]<- "10.19"
#Week 7: Nov 14 to Nov 20
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-11-14"]<- "10.09"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-11-15"]<- "10.05"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-11-16"]<- "10.00"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-11-17"]<- "9.95"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-11-18"]<- "9.91"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-11-19"]<- "9.86"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-11-20"]<- "9.82"
#Week 8: Nov 18 to Nov 24
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-11-21"]<- "9.78"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-11-22"]<- "9.73"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-11-23"]<- "9.69"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-11-24"]<- "9.65"
#Week 9: Nov 28 to Dec 4
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-11-28"]<- "9.51"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-11-29"]<- "9.47"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-11-30"]<- "9.44"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-12-01"]<- "9.41"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-12-02"]<- "9.38"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-12-03"]<- "9.35"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-12-04"]<- "9.32"
#Week 10: Dec 2 to Dec 8
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-12-05"]<- "9.30"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-12-06"]<- "9.27"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-12-07"]<- "9.25"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-12-08"]<- "9.23"
#Week 11: Dec 9 to Dec 15
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-12-09"]<- "9.21"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-12-10"]<- "9.19"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-12-11"]<- "9.17"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-12-12"]<- "9.16"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-12-13"]<- "9.14"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-12-14"]<- "9.13"
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-12-15"]<- "9.12"
#Week 12: Dec. 10th to Dec 16
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-12-16"]<- "9.11"
#Week 13: Dec. 11 to Dec 17
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-12-17"]<- "9.10"
#Week 14: Dec 12 to Dec 18
SaskatoonWeather2014$DayLight [SaskatoonWeather2014$Date=="2014-12-18"]<- "9.10"
#Week 15: Jan 13 to Jan 19 2015
SaskatoonWeather2015$DayLight [SaskatoonWeather2015$Date=="2015-01-13"]<- "9.50"
SaskatoonWeather2015$DayLight [SaskatoonWeather2015$Date=="2015-01-14"]<- "9.53"
SaskatoonWeather2015$DayLight [SaskatoonWeather2015$Date=="2015-01-15"]<- "9.57"
SaskatoonWeather2015$DayLight [SaskatoonWeather2015$Date=="2015-01-16"]<- "9.61"
SaskatoonWeather2015$DayLight [SaskatoonWeather2015$Date=="2015-01-17"]<- "9.64"
SaskatoonWeather2015$DayLight [SaskatoonWeather2015$Date=="2015-01-18"]<- "9.68"
SaskatoonWeather2015$DayLight [SaskatoonWeather2015$Date=="2015-01-19"]<- "9.73"

#TUHIN'S LIST
TuhinList <- read.csv(text=getURL("https://raw.githubusercontent.com/AhmadMobin/SaskKids_RoundA/645f5925243931f45b5c34a4e1b12f33d52e2883/ValidParticipants_Loose.csv?token=AXfVputlNuquQ10abG1aKLXsu0q5E6Juks5Yztv7wA%3D%3D"),header = TRUE, stringsAsFactors = FALSE, fileEncoding = "UTF-8")
TuhinList$participant<- as.numeric(TuhinList$participant)
TuhinList<- sqldf ("SELECT DISTINCT participant
                     FROM TuhinList")

#TARUN'S DATAFILE

Tarun_Data<- read.csv(text=getURL("https://raw.githubusercontent.com/AhmadMobin/SaskKids_RoundA/645f5925243931f45b5c34a4e1b12f33d52e2883/Exported_Tarun_Criteria3.csv?token=AXfVpi6OtBYk29P9jyUwfV-y0DjJzr_Nks5Yztw8wA%3D%3D"),header = TRUE, stringsAsFactors = FALSE, fileEncoding = "UTF-8")


#CODE BOOK
Code<- read.csv(text=getURL("https://raw.githubusercontent.com/AhmadMobin/SaskKids_RoundA/645f5925243931f45b5c34a4e1b12f33d52e2883/CodeBook_RoundA.csv?token=AXfVph4z4bdbmtaJg4LfXnQlYcMt0_Yaks5Yzti9wA%3D%3D"),header = TRUE, stringsAsFactors = FALSE, fileEncoding = "UTF-8")


#SAMPLE COMPARISON:

ValidSample<- data.frame(
  Criteria= factor(c("1", "1", "2", "2", "3", "3", "4", "4"),
                   levels=c("1","2","3","4")),
  wear_time=factor(c("Unstandardized", "Standardized")),
  sample_size= c (575, 483, 588, 500, 486, 167, 503, 222)
)

#GENDER-Criteria 3
Freq_Gender3<- sqldf ("SELECT DISTINCT participant, Gender
                         FROM Criteria3_data")
Freq_Gender_Criteria3<- sqldf ("SELECT Gender, COUNT(GENDER) as 'Frequency'
                               FROM Freq_Gender3 
                               GROUP BY Gender") 
Freq_Gender_Criteria3$Gender<-as.factor(Freq_Gender_Criteria3$Gender)

#GENDER-Criteria 1
Freq_Gender1<- sqldf ("SELECT DISTINCT participant, Gender
                     FROM Criteria1_data")
Freq_Gender_Criteria1<- sqldf ("SELECT Gender, COUNT(GENDER) as 'Frequency'
                               FROM Freq_Gender1 
                               GROUP BY Gender") 
Freq_Gender_Criteria1$Gender<-as.factor(Freq_Gender_Criteria1$Gender)


#GENDER-Criteria 2
Freq_Gender2<- sqldf ("SELECT DISTINCT participant, Gender
                      FROM Criteria2_data")
Freq_Gender_Criteria2<- sqldf ("SELECT Gender, COUNT(GENDER) as 'Frequency'
                               FROM Freq_Gender2 
                               GROUP BY Gender") 
Freq_Gender_Criteria2$Gender<-as.factor(Freq_Gender_Criteria2$Gender)

#GENDER-Criteria 4
Freq_Gender4<- sqldf ("SELECT DISTINCT participant, Gender
                      FROM Criteria4_data")
Freq_Gender_Criteria4<- sqldf ("SELECT Gender, COUNT(GENDER) as 'Frequency'
                               FROM Freq_Gender4 
                               GROUP BY Gender") 
Freq_Gender_Criteria4$Gender<-as.factor(Freq_Gender_Criteria4$Gender)

#AGE-Criteria 3
Freq_Age3<- sqldf ("SELECT DISTINCT participant, Age
                  FROM Criteria3_data")
Freq_Age_Criteria3<- sqldf ("SELECT Age, COUNT(Age) as 'Frequency'
                            FROM Freq_Age3 
                            GROUP BY Age")
#Make Age into a factor
Freq_Age_Criteria3$Age<-as.factor(Freq_Age_Criteria3$Age)

#AGE-Criteria 1
Freq_Age1<- sqldf ("SELECT DISTINCT participant, Age
                   FROM Criteria1_data")
Freq_Age_Criteria1<- sqldf ("SELECT Age, COUNT(Age) as 'Frequency'
                            FROM Freq_Age1 
                            GROUP BY Age")
#Make Age into a factor
Freq_Age_Criteria1$Age<-as.factor(Freq_Age_Criteria1$Age)

#AGE-Criteria 2
Freq_Age2<- sqldf ("SELECT DISTINCT participant, Age
                   FROM Criteria2_data")
Freq_Age_Criteria2<- sqldf ("SELECT Age, COUNT(Age) as 'Frequency'
                            FROM Freq_Age2 
                            GROUP BY Age")
#Make Age into a factor
Freq_Age_Criteria2$Age<-as.factor(Freq_Age_Criteria2$Age)

#AGE-Criteria 4
Freq_Age4<- sqldf ("SELECT DISTINCT participant, Age
                   FROM Criteria4_data")
Freq_Age_Criteria4<- sqldf ("SELECT Age, COUNT(Age) as 'Frequency'
                            FROM Freq_Age4 
                            GROUP BY Age")
#Make Age into a factor
Freq_Age_Criteria4$Age<-as.factor(Freq_Age_Criteria4$Age)

#GRADE-Criteria 3
Freq_Grade3<- sqldf ("SELECT DISTINCT participant, Grade
                    FROM Criteria3_data")
Freq_Grade_Criteria3<- sqldf ("SELECT Grade, COUNT(Grade) as 'Frequency'
                               FROM Freq_Grade3 
                               GROUP BY Grade")
#Make Grade into a factor
Freq_Grade_Criteria3$Grade<-as.factor(Freq_Grade_Criteria3$Grade)

#GRADE-Criteria 1
Freq_Grade1<- sqldf ("SELECT DISTINCT participant, Grade
                     FROM Criteria1_data")
Freq_Grade_Criteria1<- sqldf ("SELECT Grade, COUNT(Grade) as 'Frequency'
                              FROM Freq_Grade1 
                              GROUP BY Grade")
#Make Grade into a factor
Freq_Grade_Criteria1$Grade<-as.factor(Freq_Grade_Criteria1$Grade)

#GRADE-Criteria 2
Freq_Grade2<- sqldf ("SELECT DISTINCT participant, Grade
                     FROM Criteria2_data")
Freq_Grade_Criteria2<- sqldf ("SELECT Grade, COUNT(Grade) as 'Frequency'
                              FROM Freq_Grade2 
                              GROUP BY Grade")
#Make Grade into a factor
Freq_Grade_Criteria2$Grade<-as.factor(Freq_Grade_Criteria2$Grade)

#GRADE-Criteria 4
Freq_Grade4<- sqldf ("SELECT DISTINCT participant, Grade
                     FROM Criteria4_data")
Freq_Grade_Criteria4<- sqldf ("SELECT Grade, COUNT(Grade) as 'Frequency'
                              FROM Freq_Grade4 
                              GROUP BY Grade")
#Make Grade into a factor
Freq_Grade_Criteria4$Grade<-as.factor(Freq_Grade_Criteria4$Grade)


#NEWCOMER-Criteria 3
Freq_Newcomer3<- sqldf ("SELECT DISTINCT participant, Newcomer
                       FROM Criteria3_data
                       WHERE Newcomer IS NOT NULL")
Freq_Newcomer_Criteria3<- sqldf ("SELECT Newcomer, COUNT(Newcomer) as 'Frequency'
                                  FROM Freq_Newcomer3 
                                  GROUP BY Newcomer")
#Make Newcomer into a factor
Freq_Newcomer_Criteria3$Newcomer<-as.factor(Freq_Newcomer_Criteria3$Newcomer)


#NEWCOMER-Criteria 1
Freq_Newcomer1<- sqldf ("SELECT DISTINCT participant, Newcomer
                        FROM Criteria1_data
                        WHERE Newcomer IS NOT NULL")
Freq_Newcomer_Criteria1<- sqldf ("SELECT Newcomer, COUNT(Newcomer) as 'Frequency'
                                 FROM Freq_Newcomer1 
                                 GROUP BY Newcomer")
#Make Newcomer into a factor
Freq_Newcomer_Criteria1$Newcomer<-as.factor(Freq_Newcomer_Criteria1$Newcomer)

#NEWCOMER-Criteria 2
Freq_Newcomer2<- sqldf ("SELECT DISTINCT participant, Newcomer
                        FROM Criteria2_data
                        WHERE Newcomer IS NOT NULL")
Freq_Newcomer_Criteria2<- sqldf ("SELECT Newcomer, COUNT(Newcomer) as 'Frequency'
                                 FROM Freq_Newcomer2 
                                 GROUP BY Newcomer")
#Make Newcomer into a factor
Freq_Newcomer_Criteria2$Newcomer<-as.factor(Freq_Newcomer_Criteria2$Newcomer)

#NEWCOMER-Criteria 4
Freq_Newcomer4<- sqldf ("SELECT DISTINCT participant, Newcomer
                        FROM Criteria4_data
                        WHERE Newcomer IS NOT NULL")
Freq_Newcomer_Criteria4<- sqldf ("SELECT Newcomer, COUNT(Newcomer) as 'Frequency'
                                 FROM Freq_Newcomer4 
                                 GROUP BY Newcomer")
#Make Newcomer into a factor
Freq_Newcomer_Criteria4$Newcomer<-as.factor(Freq_Newcomer_Criteria4$Newcomer)



#ERA-Criteria 3
Freq_ERA3<- sqldf ("SELECT DISTINCT participant, Era
                  FROM Criteria3_data
                  WHERE Era IS NOT NULL")
Freq_ERA_Criteria3<- sqldf ("SELECT Era, COUNT(Era) as 'Frequency'
                  FROM Freq_ERA3 
                  GROUP BY Era")
#Make Era into a factor
Freq_ERA_Criteria3$Era<-as.factor(Freq_ERA_Criteria3$Era)


#ERA-Criteria 1
Freq_ERA1<- sqldf ("SELECT DISTINCT participant, Era
                   FROM Criteria1_data
                   WHERE Era IS NOT NULL")
Freq_ERA_Criteria1<- sqldf ("SELECT Era, COUNT(Era) as 'Frequency'
                            FROM Freq_ERA1 
                            GROUP BY Era")
#Make Era into a factor
Freq_ERA_Criteria1$Era<-as.factor(Freq_ERA_Criteria1$Era)

#ERA-Criteria 2
Freq_ERA2<- sqldf ("SELECT DISTINCT participant, Era
                   FROM Criteria2_data
                   WHERE Era IS NOT NULL")
Freq_ERA_Criteria2<- sqldf ("SELECT Era, COUNT(Era) as 'Frequency'
                            FROM Freq_ERA2 
                            GROUP BY Era")
#Make Era into a factor
Freq_ERA_Criteria2$Era<-as.factor(Freq_ERA_Criteria2$Era)

#ERA-Criteria 4
Freq_ERA4<- sqldf ("SELECT DISTINCT participant, Era
                   FROM Criteria4_data
                   WHERE Era IS NOT NULL")
Freq_ERA_Criteria4<- sqldf ("SELECT Era, COUNT(Era) as 'Frequency'
                            FROM Freq_ERA4 
                            GROUP BY Era")
#Make Era into a factor
Freq_ERA_Criteria4$Era<-as.factor(Freq_ERA_Criteria4$Era)

#NALP- Criteria 3
Freq_NALP3<- sqldf ("SELECT DISTINCT participant, NALP_Cat
                    FROM Criteria3_data
                    WHERE NALP_Cat IS NOT NULL")

Freq_NALP_Criteria3<- sqldf ("SELECT NALP_Cat, COUNT(NALP_Cat) as 'Frequency'
                             FROM Freq_NALP3 
                             GROUP BY NALP_Cat")
#Make NALP into a factor
Freq_NALP_Criteria3$NALP_Cat<-as.factor(Freq_NALP_Criteria3$NALP_Cat)

#NALP- Criteria 1
Freq_NALP1<- sqldf ("SELECT DISTINCT participant, NALP_Cat
                    FROM Criteria1_data
                    WHERE NALP_Cat IS NOT NULL")

Freq_NALP_Criteria1<- sqldf ("SELECT NALP_Cat, COUNT(NALP_Cat) as 'Frequency'
                             FROM Freq_NALP1 
                             GROUP BY NALP_Cat")
#Make NALP into a factor
Freq_NALP_Criteria1$NALP_Cat<-as.factor(Freq_NALP_Criteria1$NALP_Cat)

#NALP- Criteria 2
Freq_NALP2<- sqldf ("SELECT DISTINCT participant, NALP_Cat
                    FROM Criteria2_data
                    WHERE NALP_Cat IS NOT NULL")

Freq_NALP_Criteria2<- sqldf ("SELECT NALP_Cat, COUNT(NALP_Cat) as 'Frequency'
                             FROM Freq_NALP2 
                             GROUP BY NALP_Cat")
#Make NALP into a factor
Freq_NALP_Criteria2$NALP_Cat<-as.factor(Freq_NALP_Criteria2$NALP_Cat)

#NALP- Criteria 4
Freq_NALP4<- sqldf ("SELECT DISTINCT participant, NALP_Cat
                    FROM Criteria4_data
                    WHERE NALP_Cat IS NOT NULL")

Freq_NALP_Criteria4<- sqldf ("SELECT NALP_Cat, COUNT(NALP_Cat) as 'Frequency'
                             FROM Freq_NALP4 
                             GROUP BY NALP_Cat")
#Make NALP into a factor
Freq_NALP_Criteria4$NALP_Cat<-as.factor(Freq_NALP_Criteria4$NALP_Cat)

#NEIGHBOURHOOD- Criteria 3
Freq_NGH3<- sqldf ("SELECT DISTINCT participant, NGH, Neighbourhood
                   FROM Criteria3_data")
Freq_NGH3$NGH<-as.character(Freq_NGH3$NGH)
Freq_NGH3$Neighbourhood<-as.character(Freq_NGH3$Neighbourhood)
Freq_NGH_Criteria3<- sqldf ("SELECT NGH, Neighbourhood, COUNT(Neighbourhood) as 'Students'
                             FROM Freq_NGH3 
                             GROUP BY Neighbourhood")
Freq_NGH_Criteria3<- sqldf ("SELECT * FROM Freq_NGH_Criteria3 ORDER BY Students")

#NEIGHBOURHOOD- Criteria 1
Freq_NGH1<- sqldf ("SELECT DISTINCT participant, NGH, Neighbourhood
                   FROM Criteria1_data")
Freq_NGH1$NGH<-as.character(Freq_NGH1$NGH)
Freq_NGH1$Neighbourhood<-as.character(Freq_NGH1$Neighbourhood)
Freq_NGH_Criteria1<- sqldf ("SELECT NGH, Neighbourhood, COUNT(Neighbourhood) as 'Students'
                            FROM Freq_NGH1 
                            GROUP BY Neighbourhood")
Freq_NGH_Criteria1<- sqldf ("SELECT * FROM Freq_NGH_Criteria1 ORDER BY Students")

#NEIGHBOURHOOD- Criteria 2
Freq_NGH2<- sqldf ("SELECT DISTINCT participant, NGH, Neighbourhood
                   FROM Criteria2_data")
Freq_NGH2$NGH<-as.character(Freq_NGH2$NGH)
Freq_NGH2$Neighbourhood<-as.character(Freq_NGH2$Neighbourhood)
Freq_NGH_Criteria2<- sqldf ("SELECT NGH, Neighbourhood, COUNT(Neighbourhood) as 'Students'
                            FROM Freq_NGH2 
                            GROUP BY Neighbourhood")
Freq_NGH_Criteria2<- sqldf ("SELECT * FROM Freq_NGH_Criteria2 ORDER BY Students")

#NEIGHBOURHOOD- Criteria 4
Freq_NGH4<- sqldf ("SELECT DISTINCT participant, NGH, Neighbourhood
                   FROM Criteria4_data")
Freq_NGH4$NGH<-as.character(Freq_NGH4$NGH)
Freq_NGH4$Neighbourhood<-as.character(Freq_NGH4$Neighbourhood)
Freq_NGH_Criteria4<- sqldf ("SELECT NGH, Neighbourhood, COUNT(Neighbourhood) as 'Students'
                            FROM Freq_NGH4 
                            GROUP BY Neighbourhood")
Freq_NGH_Criteria4<- sqldf ("SELECT * FROM Freq_NGH_Criteria4 ORDER BY Students")

#SCHOOL- Criteria 3
Freq_School3<- sqldf ("SELECT DISTINCT participant, School_Cat, School
                       FROM Criteria3_data")
Freq_School_Criteria3<- sqldf ("SELECT School, COUNT(School) as 'Students'
                               FROM Freq_School3
                               GROUP BY School")
Freq_School_Criteria3$School<-as.character(Freq_School_Criteria3$School)
Freq_School_Criteria3<- sqldf ("SELECT * FROM Freq_School_Criteria3 ORDER BY Students")

#SCHOOL- Criteria 1
Freq_School1<- sqldf ("SELECT DISTINCT participant, School_Cat, School
                       FROM Criteria1_data")
Freq_School_Criteria1<- sqldf ("SELECT School, COUNT(School) as 'Students'
                               FROM Freq_School1
                               GROUP BY School")
Freq_School_Criteria1$School<-as.character(Freq_School_Criteria1$School)
Freq_School_Criteria1<- sqldf ("SELECT * FROM Freq_School_Criteria1 ORDER BY Students")

#SCHOOL- Criteria 2
Freq_School2<- sqldf ("SELECT DISTINCT participant, School_Cat, School
                      FROM Criteria2_data")
Freq_School_Criteria2<- sqldf ("SELECT School, COUNT(School) as 'Students'
                               FROM Freq_School2
                               GROUP BY School")
Freq_School_Criteria2$School<-as.character(Freq_School_Criteria2$School)
Freq_School_Criteria2<- sqldf ("SELECT * FROM Freq_School_Criteria2 ORDER BY Students")

#SCHOOL- Criteria 4
Freq_School4<- sqldf ("SELECT DISTINCT participant, School_Cat, School
                      FROM Criteria4_data")
Freq_School_Criteria4<- sqldf ("SELECT School, COUNT(School) as 'Students'
                               FROM Freq_School4
                               GROUP BY School")
Freq_School_Criteria4$School<-as.character(Freq_School_Criteria4$School)
Freq_School_Criteria4<- sqldf ("SELECT * FROM Freq_School_Criteria4 ORDER BY Students")

#GENDER & WEIGHT- Criteria 3
Weight_Gender_Criteria3F<- sqldf ("SELECT DISTINCT participant, Weightkg, Gender
                                  FROM Criteria3_data
                                  WHERE Gender=0")
#Getting Individual Weight
Weight_Gender_Criteria3F<- sqldf ("SELECT Weightkg, Gender
                                  FROM Weight_Gender_Criteria3F
                                  ")

Weight_Gender_Criteria3M<- sqldf ("SELECT DISTINCT participant, Weightkg, Gender
                                  FROM Criteria3_data
                                  WHERE Gender=1")
#Getting Individual Weight
Weight_Gender_Criteria3M<- sqldf ("SELECT Weightkg, Gender
                                  FROM Weight_Gender_Criteria3M
                                  ")

#GENDER & WEIGHT- Criteria 1
Weight_Gender_Criteria1F<- sqldf ("SELECT DISTINCT participant, Weightkg, Gender
                                  FROM Criteria1_data
                                  WHERE Gender=0")
#Getting Individual Weight
Weight_Gender_Criteria1F<- sqldf ("SELECT Weightkg, Gender
                                  FROM Weight_Gender_Criteria1F
                                  ")

Weight_Gender_Criteria1M<- sqldf ("SELECT DISTINCT participant, Weightkg, Gender
                                  FROM Criteria1_data
                                  WHERE Gender=1")
#Getting Individual Weight
Weight_Gender_Criteria1M<- sqldf ("SELECT Weightkg, Gender
                                  FROM Weight_Gender_Criteria1M
                                  ")

#GENDER & WEIGHT- Criteria 2
Weight_Gender_Criteria2F<- sqldf ("SELECT DISTINCT participant, Weightkg, Gender
                                  FROM Criteria2_data
                                  WHERE Gender=0")
#Getting Individual Weight
Weight_Gender_Criteria2F<- sqldf ("SELECT Weightkg, Gender
                                  FROM Weight_Gender_Criteria2F
                                  ")

Weight_Gender_Criteria2M<- sqldf ("SELECT DISTINCT participant, Weightkg, Gender
                                  FROM Criteria2_data
                                  WHERE Gender=1")
#Getting Individual Weight
Weight_Gender_Criteria2M<- sqldf ("SELECT Weightkg, Gender
                                  FROM Weight_Gender_Criteria2M
                                  ")


#GENDER & WEIGHT- Criteria 4
Weight_Gender_Criteria4F<- sqldf ("SELECT DISTINCT participant, Weightkg, Gender
                                  FROM Criteria4_data
                                  WHERE Gender=0")
#Getting Individual Weight
Weight_Gender_Criteria4F<- sqldf ("SELECT Weightkg, Gender
                                  FROM Weight_Gender_Criteria4F
                                  ")

Weight_Gender_Criteria4M<- sqldf ("SELECT DISTINCT participant, Weightkg, Gender
                                  FROM Criteria4_data
                                  WHERE Gender=1")
#Getting Individual Weight
Weight_Gender_Criteria4M<- sqldf ("SELECT Weightkg, Gender
                                  FROM Weight_Gender_Criteria4M
                                  ")

#GENDER & HEIGHT- Criteria 3
Height_Gender_Criteria3F<- sqldf ("SELECT DISTINCT participant, Heightcm, Gender
                                  FROM Criteria3_data
                                  WHERE Gender=0")
#Getting Individual Height
Height_Gender_Criteria3F<- sqldf ("SELECT Heightcm, Gender
                                  FROM Height_Gender_Criteria3F
                                  ")

Height_Gender_Criteria3M<- sqldf ("SELECT DISTINCT participant, Heightcm, Gender
                                  FROM Criteria3_data
                                  WHERE Gender=1")
#Getting Individual Height
Height_Gender_Criteria3M<- sqldf ("SELECT Heightcm, Gender
                                  FROM Height_Gender_Criteria3M
                                  ")

#GENDER & HEIGHT- Criteria 1
Height_Gender_Criteria1F<- sqldf ("SELECT DISTINCT participant, Heightcm, Gender
                                  FROM Criteria1_data
                                  WHERE Gender=0")
#Getting Individual Height
Height_Gender_Criteria1F<- sqldf ("SELECT Heightcm, Gender
                                  FROM Height_Gender_Criteria1F
                                  ")

Height_Gender_Criteria1M<- sqldf ("SELECT DISTINCT participant, Heightcm, Gender
                                  FROM Criteria1_data
                                  WHERE Gender=1")
#Getting Individual Height
Height_Gender_Criteria1M<- sqldf ("SELECT Heightcm, Gender
                                  FROM Height_Gender_Criteria1M
                                  ")

#GENDER & HEIGHT- Criteria 2
Height_Gender_Criteria2F<- sqldf ("SELECT DISTINCT participant, Heightcm, Gender
                                  FROM Criteria2_data
                                  WHERE Gender=0")
#Getting Individual Height
Height_Gender_Criteria2F<- sqldf ("SELECT Heightcm, Gender
                                  FROM Height_Gender_Criteria2F
                                  ")

Height_Gender_Criteria2M<- sqldf ("SELECT DISTINCT participant, Heightcm, Gender
                                  FROM Criteria2_data
                                  WHERE Gender=1")
#Getting Individual Height
Height_Gender_Criteria2M<- sqldf ("SELECT Heightcm, Gender
                                  FROM Height_Gender_Criteria2M
                                  ")

#GENDER & HEIGHT- Criteria 4
Height_Gender_Criteria4F<- sqldf ("SELECT DISTINCT participant, Heightcm, Gender
                                  FROM Criteria4_data
                                  WHERE Gender=0")
#Getting Individual Height
Height_Gender_Criteria4F<- sqldf ("SELECT Heightcm, Gender
                                  FROM Height_Gender_Criteria4F
                                  ")

Height_Gender_Criteria4M<- sqldf ("SELECT DISTINCT participant, Heightcm, Gender
                                  FROM Criteria4_data
                                  WHERE Gender=1")
#Getting Individual Height
Height_Gender_Criteria4M<- sqldf ("SELECT Heightcm, Gender
                                  FROM Height_Gender_Criteria4M
                                  ")
#Subsetdata- BIVARIATE

Subset_Criteria3<- sqldf("SELECT MVPA_STD, MVPA, SED_STD, sedentary_minutes, LPA_STD, lpa_minutes,
                         Age, Grade, Gender, Newcomer, Heightcm, Weightkg, Era, NALP_Cat, TempCat,
                         RainCat, SnowCat, WindCat, DayLightCat
                         FROM Criteria3_data")
Subset_Criteria3$Age<-as.factor(Subset_Criteria3$Age)
Subset_Criteria3$Grade<-as.factor(Subset_Criteria3$Grade)
Subset_Criteria3$Gender<-as.factor(Subset_Criteria3$Gender)
Subset_Criteria3$Newcomer<-as.factor(Subset_Criteria3$Newcomer)
Subset_Criteria3$Era<-as.factor(Subset_Criteria3$Era)
Subset_Criteria3$NALP_Cat<-as.factor(Subset_Criteria3$NALP_Cat)
Subset_Criteria3$TempCat<-as.factor(Subset_Criteria3$TempCat)
Subset_Criteria3$RainCat<-as.factor(Subset_Criteria3$RainCat)
Subset_Criteria3$SnowCat<-as.factor(Subset_Criteria3$SnowCat)
Subset_Criteria3$WindCat<-as.factor(Subset_Criteria3$WindCat)
Subset_Criteria3$DayLightCat<-as.factor(Subset_Criteria3$DayLightCat)

Subset_Criteria1<- sqldf("SELECT MVPA_STD, MVPA, SED_STD, sedentary_minutes, LPA_STD, lpa_minutes,
                         Age, Grade, Gender, Newcomer, Heightcm, Weightkg, Era, NALP_Cat, TempCat,
                         RainCat, SnowCat, WindCat, DayLightCat
                         FROM Criteria1_data")
Subset_Criteria1$Age<-as.factor(Subset_Criteria1$Age)
Subset_Criteria1$Grade<-as.factor(Subset_Criteria1$Grade)
Subset_Criteria1$Gender<-as.factor(Subset_Criteria1$Gender)
Subset_Criteria1$Newcomer<-as.factor(Subset_Criteria1$Newcomer)
Subset_Criteria1$Era<-as.factor(Subset_Criteria1$Era)
Subset_Criteria1$NALP_Cat<-as.factor(Subset_Criteria1$NALP_Cat)
Subset_Criteria1$TempCat<-as.factor(Subset_Criteria1$TempCat)
Subset_Criteria1$RainCat<-as.factor(Subset_Criteria1$RainCat)
Subset_Criteria1$SnowCat<-as.factor(Subset_Criteria1$SnowCat)
Subset_Criteria1$WindCat<-as.factor(Subset_Criteria1$WindCat)
Subset_Criteria1$DayLightCat<-as.factor(Subset_Criteria1$DayLightCat)

Subset_Criteria2<- sqldf("SELECT MVPA_STD, MVPA, SED_STD, sedentary_minutes, LPA_STD, lpa_minutes,
                         Age, Grade, Gender, Newcomer, Heightcm, Weightkg, Era, NALP_Cat, TempCat,
                         RainCat, SnowCat, WindCat, DayLightCat
                         FROM Criteria2_data")
Subset_Criteria2$Age<-as.factor(Subset_Criteria2$Age)
Subset_Criteria2$Grade<-as.factor(Subset_Criteria2$Grade)
Subset_Criteria2$Gender<-as.factor(Subset_Criteria2$Gender)
Subset_Criteria2$Newcomer<-as.factor(Subset_Criteria2$Newcomer)
Subset_Criteria2$Era<-as.factor(Subset_Criteria2$Era)
Subset_Criteria2$NALP_Cat<-as.factor(Subset_Criteria2$NALP_Cat)
Subset_Criteria2$TempCat<-as.factor(Subset_Criteria2$TempCat)
Subset_Criteria2$RainCat<-as.factor(Subset_Criteria2$RainCat)
Subset_Criteria2$SnowCat<-as.factor(Subset_Criteria2$SnowCat)
Subset_Criteria2$WindCat<-as.factor(Subset_Criteria2$WindCat)
Subset_Criteria2$DayLightCat<-as.factor(Subset_Criteria2$DayLightCat)

Subset_Criteria4<- sqldf("SELECT MVPA_STD, MVPA, SED_STD, sedentary_minutes, LPA_STD, lpa_minutes,
                         Age, Grade, Gender, Newcomer, Heightcm, Weightkg, Era, NALP_Cat, TempCat,
                         RainCat, SnowCat, WindCat, DayLightCat
                         FROM Criteria4_data")
Subset_Criteria4$Age<-as.factor(Subset_Criteria4$Age)
Subset_Criteria4$Grade<-as.factor(Subset_Criteria4$Grade)
Subset_Criteria4$Gender<-as.factor(Subset_Criteria4$Gender)
Subset_Criteria4$Newcomer<-as.factor(Subset_Criteria4$Newcomer)
Subset_Criteria4$Era<-as.factor(Subset_Criteria4$Era)
Subset_Criteria4$NALP_Cat<-as.factor(Subset_Criteria4$NALP_Cat)
Subset_Criteria4$TempCat<-as.factor(Subset_Criteria4$TempCat)
Subset_Criteria4$RainCat<-as.factor(Subset_Criteria4$RainCat)
Subset_Criteria4$SnowCat<-as.factor(Subset_Criteria4$SnowCat)
Subset_Criteria4$WindCat<-as.factor(Subset_Criteria4$WindCat)
Subset_Criteria4$DayLightCat<-as.factor(Subset_Criteria4$DayLightCat)

#Subset Data- MULTIPLE REGRESSION
Subset_Criteria3_MultipleRegression<- sqldf("SELECT MVPA_STD, MVPA, SED_STD, sedentary_minutes, LPA_STD, lpa_minutes
                                             FROM Criteria3_data")


# Define server logic 
shinyServer(function(input, output) {

#SELECTING A DATA SET     
  datasetInput <- reactive({
    switch(input$dataset,
           "Criteria 3"= Criteria3_data,
           "Criteria 1"= Criteria1_data,
           "Criteria 2"= Criteria2_data,
           "Criteria 4"= Criteria4_data,
           "Original"= Original_data,
           "Survey Data"= Survey_Data,
           "Neighbourhood Codes"= NBHDCodes,
           "NALP"= NALP_Data,
           "Weather 2014"= SaskatoonWeather2014,
           "Weather 2015"= SaskatoonWeather2015,
           "Tuhin's List"= TuhinList,
           "Tarun"= Tarun_Data,
           "Code Book"= Code)
  })
  #DOWNLOADING A DATA SET (based on what the user selects from above)
  output$downloadData <- downloadHandler(
    filename = function() { 
      paste(input$dataset, '.csv', sep='') 
    },
    content = function(file) {
      write.csv(datasetInput(), file)
    }
  )
  
  #PLOT OF DIFFERENT SAMPLE SIZES
  output$Sample_Size<- renderPlot({
    
    #Graphing the number of students for each criteria
    ggplot(data= ValidSample, aes(x=Criteria, y=sample_size, fill=wear_time))+
      geom_bar (stat="identity", position=position_dodge())+ 
      scale_fill_manual(values=c("red", "blue"))+
      xlab("Criteria") + #title of x-axis
      theme (axis.title.x=element_text (angle=0, size=16, face="bold", color="black"))+  #Formating title of x-axis
      theme (axis.text.x=element_text(angle=0, size=16, vjust=90))+ #Formating the text of the x-axis 
      ylab ("No. of Students")+ #title of y-axis 
      theme (axis.title.y=element_text (angle=90, size=16, face="bold", color="black"))+ #Formating title of y-axis
      theme (axis.text.y=element_text(angle=0, size=16, vjust=1))+ #Formating the text of y-axis
      ggtitle (NULL) + ##Main title of the graph 
      theme (plot.title=element_text(size=24, face="bold", color="black", vjust=1, lineheight=0.6))+ #Formating Main Title 
      geom_text (aes(label=sample_size), position=position_dodge(width=0.9),   
                 vjust=5)+ #Inserting values on top of the bars 
      theme (panel.grid.minor=element_blank(), #Hiding the minor gridlines
             panel.grid.major=element_blank()) + #Hiding the major gridlines
      theme (plot.background=element_rect(fill='white'))+ #changes the plot background (not the panel) colour
      theme (panel.background=element_rect (fill='white'))+ #changes the panel colour 
      theme (axis.line.x=element_line(color="black", size=1))+ #black line on x-axis
      theme (axis.line.y=element_line(color="black", size=1))+ #black line on y-axis
      scale_y_continuous (breaks=seq(0,600, by=50), expand=c(0,0))+ #setting custom y-axis breaks & also expand=c removes space btwn bars and x-axis
      coord_cartesian(ylim=c(0,600))+ #zooms into the y-axis at 0 to 600             
      theme(legend.title=element_blank()) #removes title from legend
    
      })
  
#GENDER GRAPH: Criteria 3
output$Gender_Criteria3<- renderPlot({
  
ggplot (data=Freq_Gender_Criteria3, aes(x=Gender, y=Frequency, fill=Gender))+
  geom_bar(stat="identity", width=0.4)+
  xlab(NULL) + #title of x-axis theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  #Formating title of x-axis
  theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  
  theme (axis.text.x=element_text(angle=0, size=12, face="bold", vjust=90))+ #Formating the text of the x-axis 
  ylab ("No. of Students")+ #title of y-axis 
  theme (axis.title.y=element_text (angle=90, size=16, face="bold", color="black"))+ #Formating title of y-axis
  theme (axis.text.y=element_text(angle=0, size=14, vjust=1))+ #Formating the text of y-axis
  geom_text (aes(label=Frequency), vjust=-0.25)+ #Inserting values on top of the bars
  ggtitle (NULL) + ##Main title of the graph 
  theme (plot.title=element_text(size=20, face="bold", color="black", vjust=1, lineheight=0.6))+
  theme (panel.grid.minor=element_blank(), #Hiding the minor gridlines
         panel.grid.major=element_blank()) + #Hiding the major gridlines
  theme (plot.background=element_rect(fill='white'))+ #changes the plot background (not the panel) colour
  theme (panel.background=element_rect (fill='white'))+ #changes the panel colour 
  theme (axis.line.x=element_line(color="black", size=1))+ #black line on x-axis
  theme (axis.line.y=element_line(color="black", size=1))+ #black line on y-axis
  scale_y_continuous (breaks=seq(0,400, by=40), expand=c(0,0))+ #setting custom y-axis breaks & also expand=c removes space btwn bars and x-axis
  scale_x_discrete (breaks=seq(0,1, by=1))+
  coord_cartesian(ylim=c(0,400))+
  scale_fill_discrete(labels=c("Females", "Males"))+ #Legend Label
  theme(legend.text=element_text(color="black", size=12, face="bold"))+ #Legend Text
  theme(legend.title=element_blank()) #Hiding Title of the Legend  

})

#GENDER GRAPH: Criteria 1
output$Gender_Criteria1<- renderPlot({
  
  ggplot (data=Freq_Gender_Criteria1, aes(x=Gender, y=Frequency, fill=Gender))+
    geom_bar(stat="identity", width=0.4)+
    xlab(NULL) + #title of x-axis theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  #Formating title of x-axis
    theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  
    theme (axis.text.x=element_text(angle=0, size=12, face="bold", vjust=90))+ #Formating the text of the x-axis 
    ylab ("No. of Students")+ #title of y-axis 
    theme (axis.title.y=element_text (angle=90, size=16, face="bold", color="black"))+ #Formating title of y-axis
    theme (axis.text.y=element_text(angle=0, size=14, vjust=1))+ #Formating the text of y-axis
    geom_text (aes(label=Frequency), vjust=-0.25)+ #Inserting values on top of the bars
    ggtitle (NULL) + ##Main title of the graph 
    theme (plot.title=element_text(size=20, face="bold", color="black", vjust=1, lineheight=0.6))+
    theme (panel.grid.minor=element_blank(), #Hiding the minor gridlines
           panel.grid.major=element_blank()) + #Hiding the major gridlines
    theme (plot.background=element_rect(fill='white'))+ #changes the plot background (not the panel) colour
    theme (panel.background=element_rect (fill='white'))+ #changes the panel colour 
    theme (axis.line.x=element_line(color="black", size=1))+ #black line on x-axis
    theme (axis.line.y=element_line(color="black", size=1))+ #black line on y-axis
    scale_y_continuous (breaks=seq(0,400, by=40), expand=c(0,0))+ #setting custom y-axis breaks & also expand=c removes space btwn bars and x-axis
    scale_x_discrete (breaks=seq(0,1, by=1))+
    coord_cartesian(ylim=c(0,400))+
    scale_fill_discrete(labels=c("Females", "Males"))+ #Legend Label
    theme(legend.text=element_text(color="black", size=12, face="bold"))+ #Legend Text
    theme(legend.title=element_blank()) #Hiding Title of the Legend  
})

#GENDER GRAPH: Criteria 2
output$Gender_Criteria2<- renderPlot({
  
  ggplot (data=Freq_Gender_Criteria2, aes(x=Gender, y=Frequency, fill=Gender))+
    geom_bar(stat="identity", width=0.4)+
    xlab(NULL) + #title of x-axis theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  #Formating title of x-axis
    theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  
    theme (axis.text.x=element_text(angle=0, size=12, face="bold", vjust=90))+ #Formating the text of the x-axis 
    ylab ("No. of Students")+ #title of y-axis 
    theme (axis.title.y=element_text (angle=90, size=16, face="bold", color="black"))+ #Formating title of y-axis
    theme (axis.text.y=element_text(angle=0, size=14, vjust=1))+ #Formating the text of y-axis
    geom_text (aes(label=Frequency), vjust=-0.25)+ #Inserting values on top of the bars
    ggtitle (NULL) + ##Main title of the graph 
    theme (plot.title=element_text(size=20, face="bold", color="black", vjust=1, lineheight=0.6))+
    theme (panel.grid.minor=element_blank(), #Hiding the minor gridlines
           panel.grid.major=element_blank()) + #Hiding the major gridlines
    theme (plot.background=element_rect(fill='white'))+ #changes the plot background (not the panel) colour
    theme (panel.background=element_rect (fill='white'))+ #changes the panel colour 
    theme (axis.line.x=element_line(color="black", size=1))+ #black line on x-axis
    theme (axis.line.y=element_line(color="black", size=1))+ #black line on y-axis
    scale_y_continuous (breaks=seq(0,400, by=40), expand=c(0,0))+ #setting custom y-axis breaks & also expand=c removes space btwn bars and x-axis
    scale_x_discrete (breaks=seq(0,1, by=1))+
    coord_cartesian(ylim=c(0,400))+
    scale_fill_discrete(labels=c("Females", "Males"))+ #Legend Label
    theme(legend.text=element_text(color="black", size=12, face="bold"))+ #Legend Text
    theme(legend.title=element_blank()) #Hiding Title of the Legend  
})

#GENDER GRAPH: Criteria 4
output$Gender_Criteria4<- renderPlot({
  
  ggplot (data=Freq_Gender_Criteria4, aes(x=Gender, y=Frequency, fill=Gender))+
    geom_bar(stat="identity", width=0.4)+
    xlab(NULL) + #title of x-axis theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  #Formating title of x-axis
    theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  
    theme (axis.text.x=element_text(angle=0, size=12, face="bold", vjust=90))+ #Formating the text of the x-axis 
    ylab ("No. of Students")+ #title of y-axis 
    theme (axis.title.y=element_text (angle=90, size=16, face="bold", color="black"))+ #Formating title of y-axis
    theme (axis.text.y=element_text(angle=0, size=14, vjust=1))+ #Formating the text of y-axis
    geom_text (aes(label=Frequency), vjust=-0.25)+ #Inserting values on top of the bars
    ggtitle (NULL) + ##Main title of the graph 
    theme (plot.title=element_text(size=20, face="bold", color="black", vjust=1, lineheight=0.6))+
    theme (panel.grid.minor=element_blank(), #Hiding the minor gridlines
           panel.grid.major=element_blank()) + #Hiding the major gridlines
    theme (plot.background=element_rect(fill='white'))+ #changes the plot background (not the panel) colour
    theme (panel.background=element_rect (fill='white'))+ #changes the panel colour 
    theme (axis.line.x=element_line(color="black", size=1))+ #black line on x-axis
    theme (axis.line.y=element_line(color="black", size=1))+ #black line on y-axis
    scale_y_continuous (breaks=seq(0,400, by=40), expand=c(0,0))+ #setting custom y-axis breaks & also expand=c removes space btwn bars and x-axis
    scale_x_discrete (breaks=seq(0,1, by=1))+
    coord_cartesian(ylim=c(0,400))+
    scale_fill_discrete(labels=c("Females", "Males"))+ #Legend Label
    theme(legend.text=element_text(color="black", size=12, face="bold"))+ #Legend Text
    theme(legend.title=element_blank()) #Hiding Title of the Legend  
  
})

#AGE GRAPH- Criteria 3
output$Age_Criteria3<- renderPlot({
  
  ggplot (data=Freq_Age_Criteria3, aes(x=Age, y=Frequency))+
    geom_bar(stat="identity", width=0.8, color='black', fill='red')+
    scale_fill_manual(values=c("red"))+
    xlab("Age") + #title of x-axis theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  #Formating title of x-axis
    theme (axis.title.x=element_text (angle=0, size=16, face="bold", color="black"))+  
    theme (axis.text.x=element_text(angle=0, size=14, face="bold", vjust=90))+ #Formating the text of the x-axis 
    ylab ("No. of Students")+ #title of y-axis 
    theme (axis.title.y=element_text (angle=90, size=16, face="bold", color="black"))+ #Formating title of y-axis
    theme (axis.text.y=element_text(angle=0, size=14, vjust=1))+ #Formating the text of y-axis
    geom_text (aes(label=Frequency), vjust=-0.25)+ #Inserting values on top of the bars
    ggtitle (NULL) + ##Main title of the graph 
    theme (plot.title=element_text(size=15, face="bold", color="black", vjust=1, lineheight=0.6))+
    theme (panel.grid.minor=element_blank(), #Hiding the minor gridlines
           panel.grid.major=element_blank()) + #Hiding the major gridlines
    theme (plot.background=element_rect(fill='white'))+ #changes the plot background (not the panel) colour
    theme (panel.background=element_rect (fill='white'))+ #changes the panel colour 
    theme (axis.line.x=element_line(color="black", size=1))+ #black line on x-axis
    theme (axis.line.y=element_line(color="black", size=1))+ #black line on y-axis
    scale_y_continuous (breaks=seq(0,200, by=10), expand=c(0,0))+ #setting custom y-axis breaks & also expand=c removes space btwn bars and x-axis
    scale_x_discrete (breaks=seq(9,14, by=1))+
    coord_cartesian(ylim=c(0,200))
})

#AGE GRAPH- Criteria 1
output$Age_Criteria1<- renderPlot({
  
  ggplot (data=Freq_Age_Criteria1, aes(x=Age, y=Frequency))+
    geom_bar(stat="identity", width=0.8, color='black', fill='red')+
    scale_fill_manual(values=c("red"))+
    xlab("Age") + #title of x-axis theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  #Formating title of x-axis
    theme (axis.title.x=element_text (angle=0, size=16, face="bold", color="black"))+  
    theme (axis.text.x=element_text(angle=0, size=14, face="bold", vjust=90))+ #Formating the text of the x-axis 
    ylab ("No. of Students")+ #title of y-axis 
    theme (axis.title.y=element_text (angle=90, size=16, face="bold", color="black"))+ #Formating title of y-axis
    theme (axis.text.y=element_text(angle=0, size=14, vjust=1))+ #Formating the text of y-axis
    geom_text (aes(label=Frequency), vjust=-0.25)+ #Inserting values on top of the bars
    ggtitle (NULL) + ##Main title of the graph 
    theme (plot.title=element_text(size=15, face="bold", color="black", vjust=1, lineheight=0.6))+
    theme (panel.grid.minor=element_blank(), #Hiding the minor gridlines
           panel.grid.major=element_blank()) + #Hiding the major gridlines
    theme (plot.background=element_rect(fill='white'))+ #changes the plot background (not the panel) colour
    theme (panel.background=element_rect (fill='white'))+ #changes the panel colour 
    theme (axis.line.x=element_line(color="black", size=1))+ #black line on x-axis
    theme (axis.line.y=element_line(color="black", size=1))+ #black line on y-axis
    scale_y_continuous (breaks=seq(0,200, by=10), expand=c(0,0))+ #setting custom y-axis breaks & also expand=c removes space btwn bars and x-axis
    scale_x_discrete (breaks=seq(9,14, by=1))+
    coord_cartesian(ylim=c(0,200))
})

#AGE GRAPH- Criteria 2
output$Age_Criteria2<- renderPlot({
  
  ggplot (data=Freq_Age_Criteria2, aes(x=Age, y=Frequency))+
    geom_bar(stat="identity", width=0.8, color='black', fill='red')+
    scale_fill_manual(values=c("red"))+
    xlab("Age") + #title of x-axis theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  #Formating title of x-axis
    theme (axis.title.x=element_text (angle=0, size=16, face="bold", color="black"))+  
    theme (axis.text.x=element_text(angle=0, size=14, face="bold", vjust=90))+ #Formating the text of the x-axis 
    ylab ("No. of Students")+ #title of y-axis 
    theme (axis.title.y=element_text (angle=90, size=16, face="bold", color="black"))+ #Formating title of y-axis
    theme (axis.text.y=element_text(angle=0, size=14, vjust=1))+ #Formating the text of y-axis
    geom_text (aes(label=Frequency), vjust=-0.25)+ #Inserting values on top of the bars
    ggtitle (NULL) + ##Main title of the graph 
    theme (plot.title=element_text(size=15, face="bold", color="black", vjust=1, lineheight=0.6))+
    theme (panel.grid.minor=element_blank(), #Hiding the minor gridlines
           panel.grid.major=element_blank()) + #Hiding the major gridlines
    theme (plot.background=element_rect(fill='white'))+ #changes the plot background (not the panel) colour
    theme (panel.background=element_rect (fill='white'))+ #changes the panel colour 
    theme (axis.line.x=element_line(color="black", size=1))+ #black line on x-axis
    theme (axis.line.y=element_line(color="black", size=1))+ #black line on y-axis
    scale_y_continuous (breaks=seq(0,200, by=10), expand=c(0,0))+ #setting custom y-axis breaks & also expand=c removes space btwn bars and x-axis
    scale_x_discrete (breaks=seq(9,14, by=1))+
    coord_cartesian(ylim=c(0,200))
})

#AGE GRAPH- Criteria 4
output$Age_Criteria4<- renderPlot({
  
  ggplot (data=Freq_Age_Criteria4, aes(x=Age, y=Frequency))+
    geom_bar(stat="identity", width=0.8, color='black', fill='red')+
    scale_fill_manual(values=c("red"))+
    xlab("Age") + #title of x-axis theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  #Formating title of x-axis
    theme (axis.title.x=element_text (angle=0, size=16, face="bold", color="black"))+  
    theme (axis.text.x=element_text(angle=0, size=14, face="bold", vjust=90))+ #Formating the text of the x-axis 
    ylab ("No. of Students")+ #title of y-axis 
    theme (axis.title.y=element_text (angle=90, size=16, face="bold", color="black"))+ #Formating title of y-axis
    theme (axis.text.y=element_text(angle=0, size=14, vjust=1))+ #Formating the text of y-axis
    geom_text (aes(label=Frequency), vjust=-0.25)+ #Inserting values on top of the bars
    ggtitle (NULL) + ##Main title of the graph 
    theme (plot.title=element_text(size=15, face="bold", color="black", vjust=1, lineheight=0.6))+
    theme (panel.grid.minor=element_blank(), #Hiding the minor gridlines
           panel.grid.major=element_blank()) + #Hiding the major gridlines
    theme (plot.background=element_rect(fill='white'))+ #changes the plot background (not the panel) colour
    theme (panel.background=element_rect (fill='white'))+ #changes the panel colour 
    theme (axis.line.x=element_line(color="black", size=1))+ #black line on x-axis
    theme (axis.line.y=element_line(color="black", size=1))+ #black line on y-axis
    scale_y_continuous (breaks=seq(0,200, by=10), expand=c(0,0))+ #setting custom y-axis breaks & also expand=c removes space btwn bars and x-axis
    scale_x_discrete (breaks=seq(9,14, by=1))+
    coord_cartesian(ylim=c(0,200))
})

#GRADE GRAPH: Criteria 3
output$Grade_Criteria3<- renderPlot({

  ggplot (Freq_Grade_Criteria3, aes(x=Grade, y=Frequency))+
    geom_bar(stat="identity", width=0.8, color='black', fill='yellow')+
    scale_fill_manual(values=c("yellow"))+
    xlab("Grade") + #title of x-axis theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  #Formating title of x-axis
    theme (axis.title.x=element_text (angle=0, size=16, face="bold", color="black"))+  
    theme (axis.text.x=element_text(angle=0, size=14, face="bold", vjust=90))+ #Formating the text of the x-axis 
    ylab ("No. of Students")+ #title of y-axis 
    theme (axis.title.y=element_text (angle=90, size=16, face="bold", color="black"))+ #Formating title of y-axis
    theme (axis.text.y=element_text(angle=0, size=14, vjust=1))+ #Formating the text of y-axis
    geom_text (aes(label=Frequency), vjust=-0.25)+ #Inserting values on top of the bars
    ggtitle (NULL) + ##Main title of the graph 
    theme (plot.title=element_text(size=15, face="bold", color="black", vjust=1, lineheight=0.6))+
    theme (panel.grid.minor=element_blank(), #Hiding the minor gridlines
           panel.grid.major=element_blank()) + #Hiding the major gridlines
    theme (plot.background=element_rect(fill='white'))+ #changes the plot background (not the panel) colour
    theme (panel.background=element_rect (fill='white'))+ #changes the panel colour 
    theme (axis.line.x=element_line(color="black", size=1))+ #black line on x-axis
    theme (axis.line.y=element_line(color="black", size=1))+ #black line on y-axis
    scale_y_continuous (breaks=seq(0,250, by=40), expand=c(0,0))+ #setting custom y-axis breaks & also expand=c removes space btwn bars and x-axis
    coord_cartesian(ylim=c(0,250))  
  
})  

#GRADE GRAPH: Criteria 1
output$Grade_Criteria1<- renderPlot({
  
  ggplot (Freq_Grade_Criteria1, aes(x=Grade, y=Frequency))+
    geom_bar(stat="identity", width=0.8, color='black', fill='yellow')+
    scale_fill_manual(values=c("yellow"))+
    xlab("Grade") + #title of x-axis theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  #Formating title of x-axis
    theme (axis.title.x=element_text (angle=0, size=16, face="bold", color="black"))+  
    theme (axis.text.x=element_text(angle=0, size=14, face="bold", vjust=90))+ #Formating the text of the x-axis 
    ylab ("No. of Students")+ #title of y-axis 
    theme (axis.title.y=element_text (angle=90, size=16, face="bold", color="black"))+ #Formating title of y-axis
    theme (axis.text.y=element_text(angle=0, size=14, vjust=1))+ #Formating the text of y-axis
    geom_text (aes(label=Frequency), vjust=-0.25)+ #Inserting values on top of the bars
    ggtitle (NULL) + ##Main title of the graph 
    theme (plot.title=element_text(size=15, face="bold", color="black", vjust=1, lineheight=0.6))+
    theme (panel.grid.minor=element_blank(), #Hiding the minor gridlines
           panel.grid.major=element_blank()) + #Hiding the major gridlines
    theme (plot.background=element_rect(fill='white'))+ #changes the plot background (not the panel) colour
    theme (panel.background=element_rect (fill='white'))+ #changes the panel colour 
    theme (axis.line.x=element_line(color="black", size=1))+ #black line on x-axis
    theme (axis.line.y=element_line(color="black", size=1))+ #black line on y-axis
    scale_y_continuous (breaks=seq(0,250, by=40), expand=c(0,0))+ #setting custom y-axis breaks & also expand=c removes space btwn bars and x-axis
    coord_cartesian(ylim=c(0,250))  
  
}) 

#GRADE GRAPH: Criteria 2
output$Grade_Criteria2<- renderPlot({
  
  ggplot (Freq_Grade_Criteria2, aes(x=Grade, y=Frequency))+
    geom_bar(stat="identity", width=0.8, color='black', fill='yellow')+
    scale_fill_manual(values=c("yellow"))+
    xlab("Grade") + #title of x-axis theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  #Formating title of x-axis
    theme (axis.title.x=element_text (angle=0, size=16, face="bold", color="black"))+  
    theme (axis.text.x=element_text(angle=0, size=14, face="bold", vjust=90))+ #Formating the text of the x-axis 
    ylab ("No. of Students")+ #title of y-axis 
    theme (axis.title.y=element_text (angle=90, size=16, face="bold", color="black"))+ #Formating title of y-axis
    theme (axis.text.y=element_text(angle=0, size=14, vjust=1))+ #Formating the text of y-axis
    geom_text (aes(label=Frequency), vjust=-0.25)+ #Inserting values on top of the bars
    ggtitle (NULL) + ##Main title of the graph 
    theme (plot.title=element_text(size=15, face="bold", color="black", vjust=1, lineheight=0.6))+
    theme (panel.grid.minor=element_blank(), #Hiding the minor gridlines
           panel.grid.major=element_blank()) + #Hiding the major gridlines
    theme (plot.background=element_rect(fill='white'))+ #changes the plot background (not the panel) colour
    theme (panel.background=element_rect (fill='white'))+ #changes the panel colour 
    theme (axis.line.x=element_line(color="black", size=1))+ #black line on x-axis
    theme (axis.line.y=element_line(color="black", size=1))+ #black line on y-axis
    scale_y_continuous (breaks=seq(0,250, by=40), expand=c(0,0))+ #setting custom y-axis breaks & also expand=c removes space btwn bars and x-axis
    coord_cartesian(ylim=c(0,250))  
  
})   

#GRADE GRAPH: Criteria 4
output$Grade_Criteria4<- renderPlot({
  
  ggplot (Freq_Grade_Criteria4, aes(x=Grade, y=Frequency))+
    geom_bar(stat="identity", width=0.8, color='black', fill='yellow')+
    scale_fill_manual(values=c("yellow"))+
    xlab("Grade") + #title of x-axis theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  #Formating title of x-axis
    theme (axis.title.x=element_text (angle=0, size=16, face="bold", color="black"))+  
    theme (axis.text.x=element_text(angle=0, size=14, face="bold", vjust=90))+ #Formating the text of the x-axis 
    ylab ("No. of Students")+ #title of y-axis 
    theme (axis.title.y=element_text (angle=90, size=16, face="bold", color="black"))+ #Formating title of y-axis
    theme (axis.text.y=element_text(angle=0, size=14, vjust=1))+ #Formating the text of y-axis
    geom_text (aes(label=Frequency), vjust=-0.25)+ #Inserting values on top of the bars
    ggtitle (NULL) + ##Main title of the graph 
    theme (plot.title=element_text(size=15, face="bold", color="black", vjust=1, lineheight=0.6))+
    theme (panel.grid.minor=element_blank(), #Hiding the minor gridlines
           panel.grid.major=element_blank()) + #Hiding the major gridlines
    theme (plot.background=element_rect(fill='white'))+ #changes the plot background (not the panel) colour
    theme (panel.background=element_rect (fill='white'))+ #changes the panel colour 
    theme (axis.line.x=element_line(color="black", size=1))+ #black line on x-axis
    theme (axis.line.y=element_line(color="black", size=1))+ #black line on y-axis
    scale_y_continuous (breaks=seq(0,250, by=10), expand=c(0,0))+ #setting custom y-axis breaks & also expand=c removes space btwn bars and x-axis
    coord_cartesian(ylim=c(0,250))  
  
})   

#NEWCOMER GRAPH- Criteria 3
output$NC_Criteria3<- renderPlot({
  
  ggplot (Freq_Newcomer_Criteria3, aes(x=Newcomer, y=Frequency))+
    geom_bar(stat="identity", width=0.6, color='black', fill='green')+
    xlab("Newcomer to Canada?") + #title of x-axis theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  #Formating title of x-axis
    theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  
    theme (axis.text.x=element_text(angle=0, size=12, face="bold", vjust=90))+ #Formating the text of the x-axis 
    ylab ("No. of Students")+ #title of y-axis 
    theme (axis.title.y=element_text (angle=90, size=12, face="bold", color="black"))+ #Formating title of y-axis
    theme (axis.text.y=element_text(angle=0, size=12, vjust=1))+ #Formating the text of y-axis
    geom_text (aes(label=Frequency), vjust=-0.25)+ #Inserting values on top of the bars
    ggtitle ("How Manys Students are Newcomers?") + ##Main title of the graph 
    theme (plot.title=element_text(size=15, face="bold", color="black", vjust=1, lineheight=0.6))+
    theme (panel.grid.minor=element_blank(), #Hiding the minor gridlines
           panel.grid.major=element_blank()) + #Hiding the major gridlines
    theme (plot.background=element_rect(fill='white'))+ #changes the plot background (not the panel) colour
    theme (panel.background=element_rect (fill='white'))+ #changes the panel colour 
    theme (axis.line.x=element_line(color="black", size=1))+ #black line on x-axis
    theme (axis.line.y=element_line(color="black", size=1))+ #black line on y-axis
    scale_y_continuous (breaks=seq(0,540, by=40), expand=c(0,0))+ #setting custom y-axis breaks & also expand=c removes space btwn bars and x-axis
    scale_x_discrete (labels=c("No", "Yes"))+
    coord_cartesian(ylim=c(0,540))
})

#NEWCOMER GRAPH- Criteria 1
output$NC_Criteria1<- renderPlot({
  
  ggplot (Freq_Newcomer_Criteria1, aes(x=Newcomer, y=Frequency))+
    geom_bar(stat="identity", width=0.6, color='black', fill='green')+
    xlab("Newcomer to Canada?") + #title of x-axis theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  #Formating title of x-axis
    theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  
    theme (axis.text.x=element_text(angle=0, size=12, face="bold", vjust=90))+ #Formating the text of the x-axis 
    ylab ("No. of Students")+ #title of y-axis 
    theme (axis.title.y=element_text (angle=90, size=12, face="bold", color="black"))+ #Formating title of y-axis
    theme (axis.text.y=element_text(angle=0, size=12, vjust=1))+ #Formating the text of y-axis
    geom_text (aes(label=Frequency), vjust=-0.25)+ #Inserting values on top of the bars
    ggtitle ("How Manys Students are Newcomers?") + ##Main title of the graph 
    theme (plot.title=element_text(size=15, face="bold", color="black", vjust=1, lineheight=0.6))+
    theme (panel.grid.minor=element_blank(), #Hiding the minor gridlines
           panel.grid.major=element_blank()) + #Hiding the major gridlines
    theme (plot.background=element_rect(fill='white'))+ #changes the plot background (not the panel) colour
    theme (panel.background=element_rect (fill='white'))+ #changes the panel colour 
    theme (axis.line.x=element_line(color="black", size=1))+ #black line on x-axis
    theme (axis.line.y=element_line(color="black", size=1))+ #black line on y-axis
    scale_y_continuous (breaks=seq(0,540, by=40), expand=c(0,0))+ #setting custom y-axis breaks & also expand=c removes space btwn bars and x-axis
    scale_x_discrete (labels=c("No", "Yes"))+
    coord_cartesian(ylim=c(0,540))
})

#NEWCOMER GRAPH- Criteria 2
output$NC_Criteria2<- renderPlot({
  
  ggplot (Freq_Newcomer_Criteria2, aes(x=Newcomer, y=Frequency))+
    geom_bar(stat="identity", width=0.6, color='black', fill='green')+
    xlab("Newcomer to Canada?") + #title of x-axis theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  #Formating title of x-axis
    theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  
    theme (axis.text.x=element_text(angle=0, size=12, face="bold", vjust=90))+ #Formating the text of the x-axis 
    ylab ("No. of Students")+ #title of y-axis 
    theme (axis.title.y=element_text (angle=90, size=12, face="bold", color="black"))+ #Formating title of y-axis
    theme (axis.text.y=element_text(angle=0, size=12, vjust=1))+ #Formating the text of y-axis
    geom_text (aes(label=Frequency), vjust=-0.25)+ #Inserting values on top of the bars
    ggtitle ("How Manys Students are Newcomers?") + ##Main title of the graph 
    theme (plot.title=element_text(size=15, face="bold", color="black", vjust=1, lineheight=0.6))+
    theme (panel.grid.minor=element_blank(), #Hiding the minor gridlines
           panel.grid.major=element_blank()) + #Hiding the major gridlines
    theme (plot.background=element_rect(fill='white'))+ #changes the plot background (not the panel) colour
    theme (panel.background=element_rect (fill='white'))+ #changes the panel colour 
    theme (axis.line.x=element_line(color="black", size=1))+ #black line on x-axis
    theme (axis.line.y=element_line(color="black", size=1))+ #black line on y-axis
    scale_y_continuous (breaks=seq(0,540, by=40), expand=c(0,0))+ #setting custom y-axis breaks & also expand=c removes space btwn bars and x-axis
    scale_x_discrete (labels=c("No", "Yes"))+
    coord_cartesian(ylim=c(0,540))
})

#NEWCOMER GRAPH- Criteria 4
output$NC_Criteria4<- renderPlot({
  
  ggplot (Freq_Newcomer_Criteria4, aes(x=Newcomer, y=Frequency))+
    geom_bar(stat="identity", width=0.6, color='black', fill='green')+
    xlab("Newcomer to Canada?") + #title of x-axis theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  #Formating title of x-axis
    theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  
    theme (axis.text.x=element_text(angle=0, size=12, face="bold", vjust=90))+ #Formating the text of the x-axis 
    ylab ("No. of Students")+ #title of y-axis 
    theme (axis.title.y=element_text (angle=90, size=12, face="bold", color="black"))+ #Formating title of y-axis
    theme (axis.text.y=element_text(angle=0, size=12, vjust=1))+ #Formating the text of y-axis
    geom_text (aes(label=Frequency), vjust=-0.25)+ #Inserting values on top of the bars
    ggtitle ("How Manys Students are Newcomers?") + ##Main title of the graph 
    theme (plot.title=element_text(size=15, face="bold", color="black", vjust=1, lineheight=0.6))+
    theme (panel.grid.minor=element_blank(), #Hiding the minor gridlines
           panel.grid.major=element_blank()) + #Hiding the major gridlines
    theme (plot.background=element_rect(fill='white'))+ #changes the plot background (not the panel) colour
    theme (panel.background=element_rect (fill='white'))+ #changes the panel colour 
    theme (axis.line.x=element_line(color="black", size=1))+ #black line on x-axis
    theme (axis.line.y=element_line(color="black", size=1))+ #black line on y-axis
    scale_y_continuous (breaks=seq(0,540, by=40), expand=c(0,0))+ #setting custom y-axis breaks & also expand=c removes space btwn bars and x-axis
    scale_x_discrete (labels=c("No", "Yes"))+
    coord_cartesian(ylim=c(0,540))
})

#ERA GRAPH- Criteria 3
output$ERA_Criteria3<- renderPlot({
  
  ggplot (Freq_ERA_Criteria3, aes(x=Era, y=Frequency))+
    geom_bar(stat="identity", width=0.8, color='black', fill='purple')+
    xlab("ERA") + #title of x-axis theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  #Formating title of x-axis
    theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  
    theme (axis.text.x=element_text(angle=0, size=12, face="bold", vjust=90))+ #Formating the text of the x-axis 
    ylab ("No. of Students")+ #title of y-axis 
    theme (axis.title.y=element_text (angle=90, size=12, face="bold", color="black"))+ #Formating title of y-axis
    theme (axis.text.y=element_text(angle=0, size=12, vjust=1))+ #Formating the text of y-axis
    geom_text (aes(label=Frequency), vjust=-0.25)+ #Inserting values on top of the bars
    ggtitle ("Where Do Students Live?") + ##Main title of the graph 
    theme (plot.title=element_text(size=15, face="bold", color="black", vjust=1, lineheight=0.6))+
    theme (panel.grid.minor=element_blank(), #Hiding the minor gridlines
           panel.grid.major=element_blank()) + #Hiding the major gridlines
    theme (plot.background=element_rect(fill='white'))+ #changes the plot background (not the panel) colour
    theme (panel.background=element_rect (fill='white'))+ #changes the panel colour 
    theme (axis.line.x=element_line(color="black", size=1))+ #black line on x-axis
    theme (axis.line.y=element_line(color="black", size=1))+ #black line on y-axis
    scale_y_continuous (breaks=seq(0,320, by=40), expand=c(0,0))+ #setting custom y-axis breaks & also expand=c removes space btwn bars and x-axis
    #scale_x_discrete (labels=c("No", "Yes", "Unsure"))+
    coord_cartesian(ylim=c(0,320))
  
})

#ERA GRAPH- Criteria 1
output$ERA_Criteria1<- renderPlot({
  
  ggplot (Freq_ERA_Criteria1, aes(x=Era, y=Frequency))+
    geom_bar(stat="identity", width=0.8, color='black', fill='purple')+
    xlab("ERA") + #title of x-axis theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  #Formating title of x-axis
    theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  
    theme (axis.text.x=element_text(angle=0, size=12, face="bold", vjust=90))+ #Formating the text of the x-axis 
    ylab ("No. of Students")+ #title of y-axis 
    theme (axis.title.y=element_text (angle=90, size=12, face="bold", color="black"))+ #Formating title of y-axis
    theme (axis.text.y=element_text(angle=0, size=12, vjust=1))+ #Formating the text of y-axis
    geom_text (aes(label=Frequency), vjust=-0.25)+ #Inserting values on top of the bars
    ggtitle ("Where Do Students Live?") + ##Main title of the graph 
    theme (plot.title=element_text(size=15, face="bold", color="black", vjust=1, lineheight=0.6))+
    theme (panel.grid.minor=element_blank(), #Hiding the minor gridlines
           panel.grid.major=element_blank()) + #Hiding the major gridlines
    theme (plot.background=element_rect(fill='white'))+ #changes the plot background (not the panel) colour
    theme (panel.background=element_rect (fill='white'))+ #changes the panel colour 
    theme (axis.line.x=element_line(color="black", size=1))+ #black line on x-axis
    theme (axis.line.y=element_line(color="black", size=1))+ #black line on y-axis
    scale_y_continuous (breaks=seq(0,320, by=40), expand=c(0,0))+ #setting custom y-axis breaks & also expand=c removes space btwn bars and x-axis
    #scale_x_discrete (labels=c("No", "Yes", "Unsure"))+
    coord_cartesian(ylim=c(0,320))
  
})

#ERA GRAPH- Criteria 2
output$ERA_Criteria2<- renderPlot({
  
  ggplot (Freq_ERA_Criteria2, aes(x=Era, y=Frequency))+
    geom_bar(stat="identity", width=0.8, color='black', fill='purple')+
    xlab("ERA") + #title of x-axis theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  #Formating title of x-axis
    theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  
    theme (axis.text.x=element_text(angle=0, size=12, face="bold", vjust=90))+ #Formating the text of the x-axis 
    ylab ("No. of Students")+ #title of y-axis 
    theme (axis.title.y=element_text (angle=90, size=12, face="bold", color="black"))+ #Formating title of y-axis
    theme (axis.text.y=element_text(angle=0, size=12, vjust=1))+ #Formating the text of y-axis
    geom_text (aes(label=Frequency), vjust=-0.25)+ #Inserting values on top of the bars
    ggtitle ("Where Do Students Live?") + ##Main title of the graph 
    theme (plot.title=element_text(size=15, face="bold", color="black", vjust=1, lineheight=0.6))+
    theme (panel.grid.minor=element_blank(), #Hiding the minor gridlines
           panel.grid.major=element_blank()) + #Hiding the major gridlines
    theme (plot.background=element_rect(fill='white'))+ #changes the plot background (not the panel) colour
    theme (panel.background=element_rect (fill='white'))+ #changes the panel colour 
    theme (axis.line.x=element_line(color="black", size=1))+ #black line on x-axis
    theme (axis.line.y=element_line(color="black", size=1))+ #black line on y-axis
    scale_y_continuous (breaks=seq(0,320, by=40), expand=c(0,0))+ #setting custom y-axis breaks & also expand=c removes space btwn bars and x-axis
    #scale_x_discrete (labels=c("No", "Yes", "Unsure"))+
    coord_cartesian(ylim=c(0,320))
  
})

#ERA GRAPH- Criteria 4
output$ERA_Criteria4<- renderPlot({
  
  ggplot (Freq_ERA_Criteria4, aes(x=Era, y=Frequency))+
    geom_bar(stat="identity", width=0.8, color='black', fill='purple')+
    xlab("ERA") + #title of x-axis theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  #Formating title of x-axis
    theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  
    theme (axis.text.x=element_text(angle=0, size=12, face="bold", vjust=90))+ #Formating the text of the x-axis 
    ylab ("No. of Students")+ #title of y-axis 
    theme (axis.title.y=element_text (angle=90, size=12, face="bold", color="black"))+ #Formating title of y-axis
    theme (axis.text.y=element_text(angle=0, size=12, vjust=1))+ #Formating the text of y-axis
    geom_text (aes(label=Frequency), vjust=-0.25)+ #Inserting values on top of the bars
    ggtitle ("Where Do Students Live?") + ##Main title of the graph 
    theme (plot.title=element_text(size=15, face="bold", color="black", vjust=1, lineheight=0.6))+
    theme (panel.grid.minor=element_blank(), #Hiding the minor gridlines
           panel.grid.major=element_blank()) + #Hiding the major gridlines
    theme (plot.background=element_rect(fill='white'))+ #changes the plot background (not the panel) colour
    theme (panel.background=element_rect (fill='white'))+ #changes the panel colour 
    theme (axis.line.x=element_line(color="black", size=1))+ #black line on x-axis
    theme (axis.line.y=element_line(color="black", size=1))+ #black line on y-axis
    scale_y_continuous (breaks=seq(0,320, by=40), expand=c(0,0))+ #setting custom y-axis breaks & also expand=c removes space btwn bars and x-axis
    #scale_x_discrete (labels=c("No", "Yes", "Unsure"))+
    coord_cartesian(ylim=c(0,320))
  
})

#NALP GRAPH- CRITERIA 3
output$NALP_Criteria3<- renderPlot({
  
  ggplot (Freq_NALP_Criteria3, aes(x=NALP_Cat, y=Frequency))+
    geom_bar(stat="identity", width=0.6, color='black', fill='orange')+
    xlab("NALP Categories") + #title of x-axis theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  #Formating title of x-axis
    theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  
    theme (axis.text.x=element_text(angle=0, size=12, face="bold", vjust=90))+ #Formating the text of the x-axis 
    ylab ("No. of Students")+ #title of y-axis 
    theme (axis.title.y=element_text (angle=90, size=12, face="bold", color="black"))+ #Formating title of y-axis
    theme (axis.text.y=element_text(angle=0, size=12, vjust=1))+ #Formating the text of y-axis
    geom_text (aes(label=Frequency), vjust=-0.25)+ #Inserting values on top of the bars
    ggtitle ("Where Do Students Live?") + ##Main title of the graph 
    theme (plot.title=element_text(size=15, face="bold", color="black", vjust=1, lineheight=0.6))+
    theme (panel.grid.minor=element_blank(), #Hiding the minor gridlines
           panel.grid.major=element_blank()) + #Hiding the major gridlines
    theme (plot.background=element_rect(fill='white'))+ #changes the plot background (not the panel) colour
    theme (panel.background=element_rect (fill='white'))+ #changes the panel colour 
    theme (axis.line.x=element_line(color="black", size=1))+ #black line on x-axis
    theme (axis.line.y=element_line(color="black", size=1))+ #black line on y-axis
    scale_y_continuous (breaks=seq(0,120, by=20), expand=c(0,0))+ #setting custom y-axis breaks & also expand=c removes space btwn bars and x-axis
    #scale_x_discrete (labels=c("No", "Yes", "Unsure"))+
    coord_cartesian(ylim=c(0,120))
  
})

#NALP GRAPH- CRITERIA 1
output$NALP_Criteria1<- renderPlot({
  
  ggplot (Freq_NALP_Criteria1, aes(x=NALP_Cat, y=Frequency))+
    geom_bar(stat="identity", width=0.6, color='black', fill='orange')+
    xlab("NALP Categories") + #title of x-axis theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  #Formating title of x-axis
    theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  
    theme (axis.text.x=element_text(angle=0, size=12, face="bold", vjust=90))+ #Formating the text of the x-axis 
    ylab ("No. of Students")+ #title of y-axis 
    theme (axis.title.y=element_text (angle=90, size=12, face="bold", color="black"))+ #Formating title of y-axis
    theme (axis.text.y=element_text(angle=0, size=12, vjust=1))+ #Formating the text of y-axis
    geom_text (aes(label=Frequency), vjust=-0.25)+ #Inserting values on top of the bars
    ggtitle ("Where Do Students Live?") + ##Main title of the graph 
    theme (plot.title=element_text(size=15, face="bold", color="black", vjust=1, lineheight=0.6))+
    theme (panel.grid.minor=element_blank(), #Hiding the minor gridlines
           panel.grid.major=element_blank()) + #Hiding the major gridlines
    theme (plot.background=element_rect(fill='white'))+ #changes the plot background (not the panel) colour
    theme (panel.background=element_rect (fill='white'))+ #changes the panel colour 
    theme (axis.line.x=element_line(color="black", size=1))+ #black line on x-axis
    theme (axis.line.y=element_line(color="black", size=1))+ #black line on y-axis
    scale_y_continuous (breaks=seq(0,120, by=20), expand=c(0,0))+ #setting custom y-axis breaks & also expand=c removes space btwn bars and x-axis
    #scale_x_discrete (labels=c("No", "Yes", "Unsure"))+
    coord_cartesian(ylim=c(0,120))
  
})

#NALP GRAPH- CRITERIA 2
output$NALP_Criteria2<- renderPlot({
  
  ggplot (Freq_NALP_Criteria2, aes(x=NALP_Cat, y=Frequency))+
    geom_bar(stat="identity", width=0.6, color='black', fill='orange')+
    xlab("NALP Categories") + #title of x-axis theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  #Formating title of x-axis
    theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  
    theme (axis.text.x=element_text(angle=0, size=12, face="bold", vjust=90))+ #Formating the text of the x-axis 
    ylab ("No. of Students")+ #title of y-axis 
    theme (axis.title.y=element_text (angle=90, size=12, face="bold", color="black"))+ #Formating title of y-axis
    theme (axis.text.y=element_text(angle=0, size=12, vjust=1))+ #Formating the text of y-axis
    geom_text (aes(label=Frequency), vjust=-0.25)+ #Inserting values on top of the bars
    ggtitle ("Where Do Students Live?") + ##Main title of the graph 
    theme (plot.title=element_text(size=15, face="bold", color="black", vjust=1, lineheight=0.6))+
    theme (panel.grid.minor=element_blank(), #Hiding the minor gridlines
           panel.grid.major=element_blank()) + #Hiding the major gridlines
    theme (plot.background=element_rect(fill='white'))+ #changes the plot background (not the panel) colour
    theme (panel.background=element_rect (fill='white'))+ #changes the panel colour 
    theme (axis.line.x=element_line(color="black", size=1))+ #black line on x-axis
    theme (axis.line.y=element_line(color="black", size=1))+ #black line on y-axis
    scale_y_continuous (breaks=seq(0,120, by=20), expand=c(0,0))+ #setting custom y-axis breaks & also expand=c removes space btwn bars and x-axis
    #scale_x_discrete (labels=c("No", "Yes", "Unsure"))+
    coord_cartesian(ylim=c(0,120))
  
})

#NALP GRAPH- CRITERIA 4
output$NALP_Criteria4<- renderPlot({
  
  ggplot (Freq_NALP_Criteria4, aes(x=NALP_Cat, y=Frequency))+
    geom_bar(stat="identity", width=0.6, color='black', fill='orange')+
    xlab("NALP Categories") + #title of x-axis theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  #Formating title of x-axis
    theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  
    theme (axis.text.x=element_text(angle=0, size=12, face="bold", vjust=90))+ #Formating the text of the x-axis 
    ylab ("No. of Students")+ #title of y-axis 
    theme (axis.title.y=element_text (angle=90, size=12, face="bold", color="black"))+ #Formating title of y-axis
    theme (axis.text.y=element_text(angle=0, size=12, vjust=1))+ #Formating the text of y-axis
    geom_text (aes(label=Frequency), vjust=-0.25)+ #Inserting values on top of the bars
    ggtitle ("Where Do Students Live?") + ##Main title of the graph 
    theme (plot.title=element_text(size=15, face="bold", color="black", vjust=1, lineheight=0.6))+
    theme (panel.grid.minor=element_blank(), #Hiding the minor gridlines
           panel.grid.major=element_blank()) + #Hiding the major gridlines
    theme (plot.background=element_rect(fill='white'))+ #changes the plot background (not the panel) colour
    theme (panel.background=element_rect (fill='white'))+ #changes the panel colour 
    theme (axis.line.x=element_line(color="black", size=1))+ #black line on x-axis
    theme (axis.line.y=element_line(color="black", size=1))+ #black line on y-axis
    scale_y_continuous (breaks=seq(0,120, by=20), expand=c(0,0))+ #setting custom y-axis breaks & also expand=c removes space btwn bars and x-axis
    #scale_x_discrete (labels=c("No", "Yes", "Unsure"))+
    coord_cartesian(ylim=c(0,120))
  
})

#NEIGHBOURHOOD TABLES- Criteria 3
output$Neighbourhood_Criteria3<- DT::renderDataTable({
  DT::datatable(
    Freq_NGH_Criteria3, options= list (lengthMenu= c(5,30,40,59), pageLenght=5))
  })

#NEIGHBOURHOOD TABLES- Criteria 1
output$Neighbourhood_Criteria1<- DT::renderDataTable({
  DT::datatable(
    Freq_NGH_Criteria1, options= list (lengthMenu= c(5,30,40,59), pageLenght=5))
})

#NEIGHBOURHOOD TABLES- Criteria 2
output$Neighbourhood_Criteria2<- DT::renderDataTable({
  DT::datatable(
    Freq_NGH_Criteria2, options= list (lengthMenu= c(5,30,40,59), pageLenght=5))
})

#NEIGHBOURHOOD TABLES- Criteria 4
output$Neighbourhood_Criteria4<- DT::renderDataTable({
  DT::datatable(
    Freq_NGH_Criteria4, options= list (lengthMenu= c(5,30,40,59), pageLenght=5))
})

#SCHOOL TABLE- Criteria 3
output$School_Criteria3<- DT::renderDataTable({
  DT::datatable(
    Freq_School_Criteria3, options= list (lengthMenu= c(5,15,20,30), pageLenght=5))
})

#SCHOOL TABLE- Criteria 1
output$School_Criteria1<- DT::renderDataTable({
  DT::datatable(
    Freq_School_Criteria1, options= list (lengthMenu= c(5,15,20,30), pageLenght=5))
})

#SCHOOL TABLE- Criteria 2
output$School_Criteria2<- DT::renderDataTable({
  DT::datatable(
    Freq_School_Criteria2, options= list (lengthMenu= c(5,15,20,30), pageLenght=5))
})

#SCHOOL TABLE- Criteria 4
output$School_Criteria4<- DT::renderDataTable({
  DT::datatable(
    Freq_School_Criteria4, options= list (lengthMenu= c(5,15,20,30), pageLenght=5))
})


#WEIGHT: SELECTING A GENDER- Criteria 3
GenderInput3 <- reactive({
  switch(input$genderselect3,
         "Female"= Weight_Gender_Criteria3F,
         "Male"= Weight_Gender_Criteria3M)
})


#WEIGHT GRAPH- Criteria 3
output$Weight_Criteria3<- renderPlot({
  
    ggplot(GenderInput3(), aes (x=Weightkg))+
    geom_histogram(colour="white", fill="firebrick3")+
    xlab("Weight (kg)")+
    theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  #Formating title of x-axis
    theme (axis.text.x=element_text(angle=0, size=14, face="bold", vjust=90))+ #Formating the text of the x-axis 
    ylab ("Number of Students")+ #title of y-axis 
    theme (axis.title.y=element_text (angle=90, size=10, face="bold", color="black"))+ #Formating title of y-axis
    theme (axis.text.y=element_text(angle=0, size=14, vjust=1))+ #Formating the text of y-axis
    ggtitle (NULL) + ##Main title of the graph 
    theme (plot.title=element_text(size=15, face="bold", color="pink4", vjust=1, lineheight=0.6))+ #Formating Main Title
    theme (panel.grid.minor=element_blank(), #Hiding the minor gridlines
           panel.grid.major=element_blank()) + #Hiding the major gridlines
    theme (plot.background=element_rect(fill='white'))+ #changes the plot background (not the panel) colour
    theme (panel.background=element_rect (fill='white'))+ #changes the panel colour 
    theme (axis.line.x=element_line(color="black", size=1))+ #black line on x-axis
    theme (axis.line.y=element_line(color="black", size=1))+ #black line on y-axis
    scale_y_continuous (breaks=seq(0,70, by=5), expand=c(0,0))+ #setting custom y-axis breaks & also expand=c removes space btwn bars and x-axis
    scale_x_continuous (breaks=seq(0,130, by=10))+      
    coord_cartesian(ylim=c(0,70))+ #zooms into the y-axis at 0 to 1000
    coord_cartesian(xlim=c(0,130))
  
})

#WEIGHT- SUMMARY STATS: Criteria 3
output$summary_wg3<- renderPrint({
  summary(GenderInput3())
})


#WEIGHT: SELECTING A GENDER- Criteria 1
GenderInput1 <- reactive({
  switch(input$genderselect1,
         "Female"= Weight_Gender_Criteria1F,
         "Male"= Weight_Gender_Criteria1M)
})

#WEIGHT GRAPH- Criteria 1
output$Weight_Criteria1<- renderPlot({
  
  ggplot(GenderInput1(), aes (x=Weightkg))+
    geom_histogram(colour="white", fill="firebrick3")+
    xlab("Weight (kg)")+
    theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  #Formating title of x-axis
    theme (axis.text.x=element_text(angle=0, size=14, face="bold", vjust=90))+ #Formating the text of the x-axis 
    ylab ("Number of Students")+ #title of y-axis 
    theme (axis.title.y=element_text (angle=90, size=10, face="bold", color="black"))+ #Formating title of y-axis
    theme (axis.text.y=element_text(angle=0, size=14, vjust=1))+ #Formating the text of y-axis
    ggtitle (NULL) + ##Main title of the graph 
    theme (plot.title=element_text(size=15, face="bold", color="pink4", vjust=1, lineheight=0.6))+ #Formating Main Title
    theme (panel.grid.minor=element_blank(), #Hiding the minor gridlines
           panel.grid.major=element_blank()) + #Hiding the major gridlines
    theme (plot.background=element_rect(fill='white'))+ #changes the plot background (not the panel) colour
    theme (panel.background=element_rect (fill='white'))+ #changes the panel colour 
    theme (axis.line.x=element_line(color="black", size=1))+ #black line on x-axis
    theme (axis.line.y=element_line(color="black", size=1))+ #black line on y-axis
    scale_y_continuous (breaks=seq(0,70, by=5), expand=c(0,0))+ #setting custom y-axis breaks & also expand=c removes space btwn bars and x-axis
    scale_x_continuous (breaks=seq(0,130, by=10))+      
    coord_cartesian(ylim=c(0,70))+ #zooms into the y-axis at 0 to 1000
    coord_cartesian(xlim=c(0,130))
  
})

#WEIGHT: SUMMARY STATS- Criteria 1
output$summary_wg1<- renderPrint({
  summary(GenderInput1())
})

#WEIGHT- SELECT A GENDER- CRITERIA 2
GenderInput2 <- reactive({
  switch(input$genderselect2,
         "Female"= Weight_Gender_Criteria2F,
         "Male"= Weight_Gender_Criteria2M)
})

#WEIGHT: GRAPH- CRITERIA 2
output$Weight_Criteria2<- renderPlot({
  
  ggplot(GenderInput2(), aes (x=Weightkg))+
    geom_histogram(colour="white", fill="firebrick3")+
    xlab("Weight (kg)")+
    theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  #Formating title of x-axis
    theme (axis.text.x=element_text(angle=0, size=14, face="bold", vjust=90))+ #Formating the text of the x-axis 
    ylab ("Number of Students")+ #title of y-axis 
    theme (axis.title.y=element_text (angle=90, size=10, face="bold", color="black"))+ #Formating title of y-axis
    theme (axis.text.y=element_text(angle=0, size=14, vjust=1))+ #Formating the text of y-axis
    ggtitle (NULL) + ##Main title of the graph 
    theme (plot.title=element_text(size=15, face="bold", color="pink4", vjust=1, lineheight=0.6))+ #Formating Main Title
    theme (panel.grid.minor=element_blank(), #Hiding the minor gridlines
           panel.grid.major=element_blank()) + #Hiding the major gridlines
    theme (plot.background=element_rect(fill='white'))+ #changes the plot background (not the panel) colour
    theme (panel.background=element_rect (fill='white'))+ #changes the panel colour 
    theme (axis.line.x=element_line(color="black", size=1))+ #black line on x-axis
    theme (axis.line.y=element_line(color="black", size=1))+ #black line on y-axis
    scale_y_continuous (breaks=seq(0,70, by=5), expand=c(0,0))+ #setting custom y-axis breaks & also expand=c removes space btwn bars and x-axis
    scale_x_continuous (breaks=seq(0,130, by=10))+      
    coord_cartesian(ylim=c(0,70))+ #zooms into the y-axis at 0 to 1000
    coord_cartesian(xlim=c(0,130))
  
})

#WEIGHT: SUMMARY STATS- CRITERIA 2
output$summary_wg2<- renderPrint({
  summary(GenderInput2())
})


#WEIGHT: SELECT GENDER- CRITERIA 4
GenderInput4 <- reactive({
  switch(input$genderselect4,
         "Female"= Weight_Gender_Criteria4F,
         "Male"= Weight_Gender_Criteria4aM)
})

#WEIGHT: GRAPH- CRITERIA 4
output$Weight_Criteria4<- renderPlot({
  
  ggplot(GenderInput4(), aes (x=Weightkg))+
    geom_histogram(colour="white", fill="firebrick3")+
    xlab("Weight (kg)")+
    theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  #Formating title of x-axis
    theme (axis.text.x=element_text(angle=0, size=14, face="bold", vjust=90))+ #Formating the text of the x-axis 
    ylab ("Number of Students")+ #title of y-axis 
    theme (axis.title.y=element_text (angle=90, size=10, face="bold", color="black"))+ #Formating title of y-axis
    theme (axis.text.y=element_text(angle=0, size=14, vjust=1))+ #Formating the text of y-axis
    ggtitle (NULL) + ##Main title of the graph 
    theme (plot.title=element_text(size=15, face="bold", color="pink4", vjust=1, lineheight=0.6))+ #Formating Main Title
    theme (panel.grid.minor=element_blank(), #Hiding the minor gridlines
           panel.grid.major=element_blank()) + #Hiding the major gridlines
    theme (plot.background=element_rect(fill='white'))+ #changes the plot background (not the panel) colour
    theme (panel.background=element_rect (fill='white'))+ #changes the panel colour 
    theme (axis.line.x=element_line(color="black", size=1))+ #black line on x-axis
    theme (axis.line.y=element_line(color="black", size=1))+ #black line on y-axis
    scale_y_continuous (breaks=seq(0,70, by=5), expand=c(0,0))+ #setting custom y-axis breaks & also expand=c removes space btwn bars and x-axis
    scale_x_continuous (breaks=seq(0,130, by=10))+      
    coord_cartesian(ylim=c(0,70))+ #zooms into the y-axis at 0 to 1000
    coord_cartesian(xlim=c(0,130))
  
})

#WEIGHT: SMMARY STATS- CRITERIA 4
output$summary_wg4<- renderPrint({
  summary(GenderInput4())
})

#HEIGHT: SELECTING A GENDER- Criteria 3
H_GenderInput3 <- reactive({
  switch(input$H_genderselect3,
         "Female"= Height_Gender_Criteria3F,
         "Male"= Height_Gender_Criteria3M)
})


#HEIGHT GRAPH- Criteria 3
output$Height_Criteria3<- renderPlot({
  
  ggplot(H_GenderInput3(), aes (x=Heightcm))+
    geom_histogram(colour="white", fill="black")+
    xlab("Height (cm)")+
    theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  #Formating title of x-axis
    theme (axis.text.x=element_text(angle=0, size=14, face="bold", vjust=90))+ #Formating the text of the x-axis 
    ylab ("Number of Students")+ #title of y-axis 
    theme (axis.title.y=element_text (angle=90, size=10, face="bold", color="black"))+ #Formating title of y-axis
    theme (axis.text.y=element_text(angle=0, size=14, vjust=1))+ #Formating the text of y-axis
    ggtitle (NULL) + ##Main title of the graph 
    theme (plot.title=element_text(size=15, face="bold", color="pink4", vjust=1, lineheight=0.6))+ #Formating Main Title
    theme (panel.grid.minor=element_blank(), #Hiding the minor gridlines
           panel.grid.major=element_blank()) + #Hiding the major gridlines
    theme (plot.background=element_rect(fill='white'))+ #changes the plot background (not the panel) colour
    theme (panel.background=element_rect (fill='white'))+ #changes the panel colour 
    theme (axis.line.x=element_line(color="black", size=1))+ #black line on x-axis
    theme (axis.line.y=element_line(color="black", size=1))+ #black line on y-axis
    scale_y_continuous (breaks=seq(0,70, by=5), expand=c(0,0))+ #setting custom y-axis breaks & also expand=c removes space btwn bars and x-axis
    scale_x_continuous (breaks=seq(60,230, by=10))+      
    coord_cartesian(ylim=c(0,70))+ #zooms into the y-axis at 0 to 1000
    coord_cartesian(xlim=c(100,230))
  
})

#HEIGHT- SUMMARY STATS: Criteria 3
output$summary_hg3<- renderPrint({
  summary(H_GenderInput3())
})

#HEIGHT: SELECTING A GENDER- Criteria 1
H_GenderInput1 <- reactive({
  switch(input$H_genderselect1,
         "Female"= Height_Gender_Criteria1F,
         "Male"= Height_Gender_Criteria1M)
})


#HEIGHT GRAPH- Criteria 1
output$Height_Criteria1<- renderPlot({
  
  ggplot(H_GenderInput1(), aes (x=Heightcm))+
    geom_histogram(colour="white", fill="black")+
    xlab("Height (cm)")+
    theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  #Formating title of x-axis
    theme (axis.text.x=element_text(angle=0, size=14, face="bold", vjust=90))+ #Formating the text of the x-axis 
    ylab ("Number of Students")+ #title of y-axis 
    theme (axis.title.y=element_text (angle=90, size=10, face="bold", color="black"))+ #Formating title of y-axis
    theme (axis.text.y=element_text(angle=0, size=14, vjust=1))+ #Formating the text of y-axis
    ggtitle (NULL) + ##Main title of the graph 
    theme (plot.title=element_text(size=15, face="bold", color="pink4", vjust=1, lineheight=0.6))+ #Formating Main Title
    theme (panel.grid.minor=element_blank(), #Hiding the minor gridlines
           panel.grid.major=element_blank()) + #Hiding the major gridlines
    theme (plot.background=element_rect(fill='white'))+ #changes the plot background (not the panel) colour
    theme (panel.background=element_rect (fill='white'))+ #changes the panel colour 
    theme (axis.line.x=element_line(color="black", size=1))+ #black line on x-axis
    theme (axis.line.y=element_line(color="black", size=1))+ #black line on y-axis
    scale_y_continuous (breaks=seq(0,70, by=5), expand=c(0,0))+ #setting custom y-axis breaks & also expand=c removes space btwn bars and x-axis
    scale_x_continuous (breaks=seq(60,230, by=10))+      
    coord_cartesian(ylim=c(0,70))+ #zooms into the y-axis at 0 to 1000
    coord_cartesian(xlim=c(100,230))
  
})

#HEIGHT- SUMMARY STATS: Criteria 1
output$summary_hg1<- renderPrint({
  summary(H_GenderInput1())
})

#HEIGHT: SELECTING A GENDER- Criteria 2
H_GenderInput2 <- reactive({
  switch(input$H_genderselect2,
         "Female"= Height_Gender_Criteria2F,
         "Male"= Height_Gender_Criteria2M)
})


#HEIGHT GRAPH- Criteria 2
output$Height_Criteria2<- renderPlot({
  
  ggplot(H_GenderInput2(), aes (x=Heightcm))+
    geom_histogram(colour="white", fill="black")+
    xlab("Height (cm)")+
    theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  #Formating title of x-axis
    theme (axis.text.x=element_text(angle=0, size=14, face="bold", vjust=90))+ #Formating the text of the x-axis 
    ylab ("Number of Students")+ #title of y-axis 
    theme (axis.title.y=element_text (angle=90, size=10, face="bold", color="black"))+ #Formating title of y-axis
    theme (axis.text.y=element_text(angle=0, size=14, vjust=1))+ #Formating the text of y-axis
    ggtitle (NULL) + ##Main title of the graph 
    theme (plot.title=element_text(size=15, face="bold", color="pink4", vjust=1, lineheight=0.6))+ #Formating Main Title
    theme (panel.grid.minor=element_blank(), #Hiding the minor gridlines
           panel.grid.major=element_blank()) + #Hiding the major gridlines
    theme (plot.background=element_rect(fill='white'))+ #changes the plot background (not the panel) colour
    theme (panel.background=element_rect (fill='white'))+ #changes the panel colour 
    theme (axis.line.x=element_line(color="black", size=1))+ #black line on x-axis
    theme (axis.line.y=element_line(color="black", size=1))+ #black line on y-axis
    scale_y_continuous (breaks=seq(0,70, by=5), expand=c(0,0))+ #setting custom y-axis breaks & also expand=c removes space btwn bars and x-axis
    scale_x_continuous (breaks=seq(60,230, by=10))+      
    coord_cartesian(ylim=c(0,70))+ #zooms into the y-axis at 0 to 1000
    coord_cartesian(xlim=c(100,230))
  
})

#HEIGHT- SUMMARY STATS: Criteria 2
output$summary_hg2<- renderPrint({
  summary(H_GenderInput2())
})

#HEIGHT: SELECTING A GENDER- Criteria 4
H_GenderInput4 <- reactive({
  switch(input$H_genderselect4,
         "Female"= Height_Gender_Criteria4F,
         "Male"= Height_Gender_Criteria4M)
})


#HEIGHT GRAPH- Criteria 4
output$Height_Criteria4<- renderPlot({
  
  ggplot(H_GenderInput4(), aes (x=Heightcm))+
    geom_histogram(colour="white", fill="black")+
    xlab("Height (cm)")+
    theme (axis.title.x=element_text (angle=0, size=12, face="bold", color="black"))+  #Formating title of x-axis
    theme (axis.text.x=element_text(angle=0, size=14, face="bold", vjust=90))+ #Formating the text of the x-axis 
    ylab ("Number of Students")+ #title of y-axis 
    theme (axis.title.y=element_text (angle=90, size=10, face="bold", color="black"))+ #Formating title of y-axis
    theme (axis.text.y=element_text(angle=0, size=14, vjust=1))+ #Formating the text of y-axis
    ggtitle (NULL) + ##Main title of the graph 
    theme (plot.title=element_text(size=15, face="bold", color="pink4", vjust=1, lineheight=0.6))+ #Formating Main Title
    theme (panel.grid.minor=element_blank(), #Hiding the minor gridlines
           panel.grid.major=element_blank()) + #Hiding the major gridlines
    theme (plot.background=element_rect(fill='white'))+ #changes the plot background (not the panel) colour
    theme (panel.background=element_rect (fill='white'))+ #changes the panel colour 
    theme (axis.line.x=element_line(color="black", size=1))+ #black line on x-axis
    theme (axis.line.y=element_line(color="black", size=1))+ #black line on y-axis
    scale_y_continuous (breaks=seq(0,70, by=5), expand=c(0,0))+ #setting custom y-axis breaks & also expand=c removes space btwn bars and x-axis
    scale_x_continuous (breaks=seq(60,230, by=10))+      
    coord_cartesian(ylim=c(0,70))+ #zooms into the y-axis at 0 to 1000
    coord_cartesian(xlim=c(100,230))
  
})

#HEIGHT- SUMMARY STATS: Criteria 4
output$summary_hg4<- renderPrint({
  summary(H_GenderInput4())
})


#BIVARIATE REGRESSION


#Select a Criteria
CriteriaInput <- reactive({
  switch(input$criteria_uni,
         "Criteria 3"= Subset_Criteria3,
         "Criteria 1"= Subset_Criteria1,
         "Criteria 2"= Subset_Criteria2,
         "Criteria 4"= Subset_Criteria4
         )
})

#Dependent Variables 
output$dv= renderUI({
    selectInput('dv', h5('Dependent Variable'), choices= names(CriteriaInput()))
})


#Indepndent Variables
output$iv= renderUI({
  selectInput('iv', h5('Independent Variable'), choices= names(CriteriaInput()))
})

#Regression  

  #regression formula
    regFormula<- reactive({
      as.formula(paste(input$dv,'~',input$iv))
    })
  #bivariate model
    linear_model<- reactive({
      lm(regFormula(), data= CriteriaInput())
    })
    

  #bivariate model output
    output$BivariateModel <- renderPrint({
      summary(linear_model())
    })

# summary statistics
    output$summary <- renderPrint({
      summary(cbind(CriteriaInput()[input$dv], CriteriaInput()[input$iv]))
    })

# correlation matrix
    output$corr <- renderGvis({
      d <- CriteriaInput()[,sapply(CriteriaInput(),is.integer)|sapply(CriteriaInput(),is.numeric)] 
      cor <- as.data.frame(round(cor(d), 2))
      cor <- cbind(Variables = rownames(cor), cor)
      gvisTable(cor) 
    })  
    
#Multiple Regression Model
    #Select a Criteria
    CriteriaInput1 <- reactive({
      switch(input$criteria_select,
             "Criteria 3"= Criteria3_data,
             "Criteria 1"= Criteria1_data,
             "Criteria 2"= Criteria2_data,
             "Criteria 4"= Criteria4_data
      )
    })
    #Dependent Variables 
    output$dv_1= renderUI({
      selectInput('dv_1', h5('Dependent Variable'), choices=c("MVPA_STD", "MVPA", "SED_STD", "sedentary_minutes", "LPA_STD", "lpa_minutes"))
    })
    #multiple regression formula
    MultipleregFormula<- reactive({
      as.formula(paste(input$dv_1,'~', 'Gender + Grade + Newcomer + Era + TempCat + RainCat + SnowCat + WindCat + DayLightCat + VDaySequence'))
    })
        
#Multiple Regression model
    multiplelinear_model<- reactive({
      lm(MultipleregFormula(), data= CriteriaInput1())
    })
    
    
    #multiple regression model output
    output$MultipleRegressionModel <- renderPrint({
      summary(multiplelinear_model())
    })
    
})      
