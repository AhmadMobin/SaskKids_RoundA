library(shiny)
library(shinydashboard)
library(rCharts)
library(lubridate)
library(sqldf)
library(ggplot2)
library(plotly)
library(DT)

dashboardPage(   
  dashboardHeader(
    #Insert the Main Title
    title= "Round A Summary"
  ),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Goal", tabName= "first", icon= icon("dashboard")),
      menuItem("File Download", tabName= "second", icon= icon("download-alt", lib="glyphicon")),
      menuItem("Sample Size", tabName= "third"),
      menuItem("Gender", tabName= "fourth"),
      menuItem("Age", tabName= "fifth"),
      menuItem("Grade", tabName= "sixth"),
      menuItem("Weight", tabName="twelve"),
      menuItem("Height", tabName="thirteen"),
      menuItem("New Comer Status", tabName= "seventh"),
      menuItem("ERA", tabName="eight"),
      menuItem("NALP", tabName="nine"),
      menuItem("Neighbourhood", tabName="ten"),
      menuItem("School", tabName="eleven"),
      menuItem("Bivariate Regression", tabName="fourteen"),
      menuItem("Multiple Regression", tabName="fifteen")
    )
  ),
  dashboardBody(  
    tabItems(
    tabItem(tabName= "first",
           h2("The pupose of this dashboard is to help collaborators working on The Smart Cities, Healthy Kids Project explore and better understand the data from The Round A Cycle")
    ),
    tabItem(tabName= "second",
            box(
              selectInput("dataset", "Choose a dataset:",
                          choices= c("Criteria 3", "Criteria 1", "Criteria 2", "Criteria 4", "Original", "Survey Data","Neighbourhood Codes", "NALP", "2014 Weather", "2015 Weather", "Tuhin's List", "Tarun", "Code Book")),
              downloadButton('downloadData', 'Download')
              ),
            fluidRow(
           column(width=6,
           h4("Criteria 3: Wear Time= 10 hrs/day; Number of Valid Days= 4"),
           h4("Criteria 1: Wear Time= 8 hrs/day; Number of Valid Days= 4"),
           h4("Criteria 2: Wear Time= 8 hrs/day; Number of Valid Days= 3"),
           h4("Criteria 4: Wear Time= 10 hrs/day; Number of Valid Days= 3"),
           h4("Original: Original Flat File"),
           h4("Survey Data: Administered Prior to the Experiment"),
           h4("Neighbourhood Codes: The Codes for the Saskatoon Neighbourhoods"),
           h4("NALP: The NALP Scores for Saskatoon"),
           h4("2014 Weather: Saskatoon"),
           h4("2015 Weather: Saskatoon"),
           h4("Tuhin's List: This List Should Have The Same Number of Students as in The Criteria 3 Table"),
           h4("Tarun: This file contains variables to conduct Tarun's Method"),
           h4 ("Code Book: Explainations of The Variables")
             ) 
          )
        ),
          
    tabItem(tabName= "third",
            plotOutput("Sample_Size")
            ),
    
    tabItem(tabName="fourth", 
           tabsetPanel(
             tabPanel("Criteria 3",
                      plotOutput("Gender_Criteria3")
                      ),
             tabPanel("Criteria 1",
                      plotOutput("Gender_Criteria1")
                      ),
             tabPanel("Criteria 2",
                      plotOutput("Gender_Criteria2")
                      ),
             tabPanel("Criteria 4",
                      plotOutput("Gender_Criteria4")
                      )
           )
           ),
           
    tabItem(tabName="fifth",
       tabsetPanel(
      tabPanel("Criteria 3",
               plotOutput("Age_Criteria3")
      ),
      tabPanel("Criteria 1",
               plotOutput("Age_Criteria1")
      ),
      tabPanel("Criteria 2",
               plotOutput("Age_Criteria2")
      ),
      tabPanel("Criteria 4",
               plotOutput("Age_Criteria4")
        )
       )
      ),
      
    tabItem(tabName="sixth",  
    tabsetPanel(
      tabPanel("Criteria 3",
               plotOutput("Grade_Criteria3")
      ),
      tabPanel("Criteria 1",
               plotOutput("Grade_Criteria1")
      ),
      tabPanel("Criteria 2",
               plotOutput("Grade_Criteria2")
      ),
      tabPanel("Criteria 4",
               plotOutput("Grade_Criteria4")
      )
    )        
   ),
   
  tabItem(tabName="seventh",
    tabsetPanel(
      tabPanel("Criteria 3",
               plotOutput("NC_Criteria3")
      ),
      tabPanel("Criteria 1",
               plotOutput("NC_Criteria1")
      ),
      tabPanel("Criteria 2",
               plotOutput("NC_Criteria2")
      ),
      tabPanel("Criteria 4",
               plotOutput("NC_Criteria4")
    )      
  )  
 ),
 
 tabItem(tabName="eight",
         tabsetPanel(
           tabPanel("Criteria 3",
                    plotOutput("ERA_Criteria3")
           ),
           tabPanel("Criteria 1",
                    plotOutput("ERA_Criteria1")
           ),
           tabPanel("Criteria 2",
                    plotOutput("ERA_Criteria2")
           ),
           tabPanel("Criteria 4",
                    plotOutput("ERA_Criteria4")
     )      
   )  
 ),
 
 tabItem(tabName="nine",
         tabsetPanel(
           tabPanel("Criteria 3",
                    plotOutput("NALP_Criteria3")
           ),
           tabPanel("Criteria 1",
                    plotOutput("NALP_Criteria1")
           ),
           tabPanel("Criteria 2",
                    plotOutput("NALP_Criteria2")
           ),
           tabPanel("Criteria 4",
                    plotOutput("NALP_Criteria4") 
           )      
         )  
 ),

 tabItem(tabName="ten",
         tabsetPanel(
           tabPanel("Criteria 3",
                   DT::dataTableOutput("Neighbourhood_Criteria3")
           ),
           tabPanel("Criteria 1",
                    DT::dataTableOutput("Neighbourhood_Criteria1")
           ),
           tabPanel("Criteria 2",
                    DT::dataTableOutput("Neighbourhood_Criteria2")
           ),
           tabPanel("Criteria 4",
                    DT::dataTableOutput("Neighbourhood_Criteria4") 
           )      
         )  
 ), 
 
 tabItem(tabName="eleven",
         tabsetPanel(
           tabPanel("Criteria 3",
                    DT::dataTableOutput("School_Criteria3")
           ),
           tabPanel("Criteria 1",
                    DT::dataTableOutput("School_Criteria1")
           ),
           tabPanel("Criteria 2",
                    DT::dataTableOutput("School_Criteria2")
           ),
           tabPanel("Criteria 4",
                    DT::dataTableOutput("School_Criteria4") 
           )      
         )  
 ),
 
 tabItem(tabName="twelve",
         tabsetPanel(
           tabPanel("Criteria 3",
                    selectInput("genderselect3", "Select Gender:",
                    choices= c("Female", "Male")),
                    plotOutput("Weight_Criteria3"),
                    verbatimTextOutput("summary_wg3")
             
           ),
           tabPanel("Criteria 1",
                    selectInput("genderselect1", "Select Gender:",
                                choices= c("Female", "Male")),
                    plotOutput("Weight_Criteria1"),
                    verbatimTextOutput("summary_wg1")                     
                    
           ),
           tabPanel("Criteria 2",
                    selectInput("genderselect2", "Select Gender:",
                                choices= c("Female", "Male")),
                    plotOutput("Weight_Criteria2"),
                    verbatimTextOutput("summary_wg2")                    
           ),
           tabPanel("Criteria 4",
                    selectInput("genderselect4", "Select Gender:",
                                choices= c("Female", "Male")),
                    plotOutput("Weight_Criteria4"),
                    verbatimTextOutput("summary_wg4") 
           )      
         )  
 ), 
 
 tabItem(tabName="thirteen",
         tabsetPanel(
           tabPanel("Criteria 3",
                    selectInput("H_genderselect3", "Select Gender:",
                                choices= c("Female", "Male")),
                    plotOutput("Height_Criteria3"),
                    verbatimTextOutput("summary_hg3")
                    
           ),
           tabPanel("Criteria 1",
                    selectInput("H_genderselect1", "Select Gender:",
                                choices= c("Female", "Male")),
                    plotOutput("Height_Criteria1"),
                    verbatimTextOutput("summary_hg1")                     
                    
           ),
           tabPanel("Criteria 2",
                    selectInput("H_genderselect2", "Select Gender:",
                                choices= c("Female", "Male")),
                    plotOutput("Height_Criteria2"),
                    verbatimTextOutput("summary_hg2")                    
           ),
           tabPanel("Criteria 4",
                    selectInput("H_genderselect4", "Select Gender:",
                                choices= c("Female", "Male")),
                    plotOutput("Height_Criteria4"),
                    verbatimTextOutput("summary_hg4") 
           )      
         )  
 ),
 
 tabItem(tabName="fourteen",
          tabsetPanel(
           tabPanel("Variables",
                    h1("Dependent Variables"),
                    h4("MVPA_STD: Standardized MVPA (min)"),
                    h4("MVPA: Raw MVPA (min)"),
                    h4("SED_STD: Standardized SED (min)"),
                    h4("sedentary_minutes: Raw SED (min)"),
                    h4("LPA_STD: Standardized LPA (min)"),
                    h4("lpa_minutes: Raw LPA (min)"),
                    HTML ('</br>'), 
                    h1("Independent Variables"), 
                    h4("Age: 9 to 14 years"), 
                    h4("Grade: 5 to 8"), 
                    h4("Gender: 0=Females; 1=Males"), 
                    h4("Newcomer: 0=No; 1=Yes"), 
                    h4("Height: measured in cm"), 
                    h4("Weight: measured in kg"), 
                    h4("Era: 1=Traditional Grid Pattern; 2= Fractured; 3= Curvilinear; 4=Era4"),
                    h4("NALP: 1=Low Walk; 4=High Walk"),
                    h4("Temperature: 1= Very Low; 6= Very High"),
                    h4("Rain: 0=No Rain; 1=Rain"),
                    h4("Snow: 0=No Snow; 1= Snow"),
                    h4("Wind Speed: 0=Calm, 1=Windy"),
                    h4("Day Light: 0= Short Day; 1= Long Day")
                    ),
           tabPanel("Model",
                    selectInput("criteria_uni", h5("Choose a criteria:"), choices=c("Criteria 3", "Criteria 1", "Criteria 2", "Criteria 4")),
                    HTML ('</br>'),
                    uiOutput('dv'),
                    HTML ('</br>'),
                    uiOutput('iv'),
                    HTML ('</br>'),
                    verbatimTextOutput("BivariateModel")
                    
           ),
           tabPanel("Summary Statistics",
                    verbatimTextOutput("summary")
                    ),
         
         tabPanel("Correlations",
                  htmlOutput("corr"))
 )
  ), 
tabItem(tabName="fifteen",
         tabsetPanel(
           tabPanel("Variables",
                    h1("Dependent Variables"),
                    h4("MVPA_STD: Standardized MVPA (min)"),
                    h4("MVPA: Raw MVPA (min)"),
                    h4("SED_STD: Standardized SED (min)"),
                    h4("sedentary_minutes: Raw SED (min)"),
                    h4("LPA_STD: Standardized LPA (min)"),
                    h4("lpa_minutes: Raw LPA (min)"),
                    HTML ('</br>'),
                    h1("Reference Groups"),
                    h4("Gender: 0= Female"),
                    h4("Grade: 5"),
                    h4("Newcomer: 0= No"),
                    h4("Era: 1=Traditional Grid Pattern"),
                    h4("Temperature: 1= Very Low"),
                    h4("Rain: 0= No Rain"),
                    h4("Snow: 0= No Snow"),
                    h4("Wind: 0= Calm"),
                    h4("Day Light: 0= Short Day"),
                    h5("*Note: VDaySequence is used as a control for the repeated nature of the dataset")),
           tabPanel("Model",
                    selectInput("criteria_select", h5("Choose a criteria:"), choices=c("Criteria 3", "Criteria 1", "Criteria 2", "Criteria 4")),
                    HTML ('</br>'),
                    uiOutput('dv_1'),
                    verbatimTextOutput("MultipleRegressionModel")
                    
   )       
  )
 )
)))
