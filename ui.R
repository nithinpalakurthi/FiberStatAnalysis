library(shinydashboard)
library(shiny)
library(xlsx)
library(xlsxjars)

ui <-  dashboardPage( skin = "yellow",
                      
                      dashboardHeader(title = "PVD MultiOption ",
                                      
                                      tags$li(class = "dropdown",
                                              tags$a(href="http://pgone.pg.com", target="_blank", 
                                                     tags$img(height = "30px", alt="SNAP Logo", src="http://cdn.pgcom.pgsitecore.com/en-us/-/media/PGCOMUS/Images/Common/Header/logo%20png.png?h=75&la=en-US&w=75&v=1-201512100923")
                                              )
                                      ),
                                      
                                      tags$li(class = "dropdown",
                                              tags$caption(‘Developed by Nithin Palakurthi')),
                                      
                                      
                                      
                                      titleWidth = 330),
                      
                      
                      
                      dashboardSidebar(
                        
                        sidebarMenu(
                          
                          menuItem("PVD Material Selection", tabName ="PVD-Material-Selection",
                                   
                                   badgeLabel = "Load files", badgeColor = "yellow", icon = icon("fa fa-pie-chart")),
                          
                          menuItem("Original Material Summary",  tabName ="Original-Material-Summary",  
                                   
                                   badgeLabel = "Summary",badgeColor = "green", icon = icon("fa fa-check") ),
                          
                          
                          
                          menuItem("Capillary Pressure and Pore Volume Distribution Plots", tabName ="Capillary-Pressure-and-Pore-Volume-Distribution-Plots", 
                                   
                                   badgeLabel = "Plots",badgeColor = "red", icon = icon("fa fa-eye")),
                          
                          menuItem("Partition Tendency and Spreading Curves", tabName ="Partition-Tendency-and-Spreading-Curves", 
                                   
                                   badgeLabel = "Plots",badgeColor = "red", icon = icon("fa fa-eye")),
                          
                          menuItem("Van Genuchten Fitter", tabName ="Van-Genuchten-Fitter",
                                   
                                   badgeLabel = "Summary",badgeColor = "blue", icon = icon("fa fa-line-chart")),
                          
                          menuItem("Virtual Material Summary", tabName ="Virtual-Material-Summary", 
                                   
                                   badgeLabel = "Plots",badgeColor = "blue", icon = icon("fa fa-eye"))
                          
                          
                        ), width = 430),
                      
                      
                      ## Body content
                      
                      dashboardBody(tags$head(tags$style(HTML('
                                                              .main-header .logo {
                                                              font-family: "cursive", Times, "Times New Roman", serif;
                                                              font-weight: bold;
                                                              font-size: 24px;
                                                              }
                                                              '))),
                                    
                                    
                                    
                                    tabItems(tabItem(tabName = "PVD-Material-Selection",   h3("PVD Data Selection"),
                                                     
                                                     
                                                     fluidRow(
                                                       
                                                       box(
                                                         title = "Layer 1", width = 4, collapsible = TRUE, collapsed=FALSE, solidHeader = TRUE, status = "warning",
                                                         
                                                         fileInput("file1", label = h5("load material"))
                                                       ),
                                                       
                                                       box(
                                                         title = "Layer 2", width = 4, collapsible = TRUE, collapsed=FALSE, solidHeader = TRUE, status = "warning",
                                                         
                                                         fileInput("file2", label = h5("load material"))
                                                       ),
                                                       
                                                       box(
                                                         title = "Layer 3", width = 4, collapsible = TRUE, collapsed=FALSE, solidHeader = TRUE, status = "warning",
                                                         
                                                         fileInput("file3", label = h5("load material"))
                                                       )
                                                     )
                                                     
                                    )),
                                    
                                    
                                    tabItems(tabItem(tabName = "Original-Material-Summary", h3("Original Material Summary"),
                                                     
                                                     fluidRow(
                                                       
                                                       box( title = "Top Sheet Layer",  collapsible = TRUE, collapsed=FALSE, solidHeader = TRUE, width = 4, status = "success",
                                                            
                                                            selectInput("Curves4",label = "Choose the process",choices=list("1st Acquisition",
                                                                                                                            "Drainage",
                                                                                                                            "2nd Acquisition") ,
                                                                        selected = "1st Acquisition"),
                                                            
                                                            actionButton("Compute1", "Compute"),
                                                            h5("CWP(mJ/m^2[web]"),
                                                            verbatimTextOutput("CWP1"),
                                                            h5("eCWP (uJ/g[fluid]"),
                                                            verbatimTextOutput("CWP2"),
                                                            numericInput("Weight1", label = h6("Wdry value"), value = 180),
                                                            numericInput("Num15", label = h6("Max Uptake (g[fluid]/g[web])"),value = 0),
                                                            numericInput("Num16", label = h6("Basis Weight, BWT (gsm)"),value = 20.1),
                                                            numericInput("Num17", label = h6("Porosity"),value = 0.80),
                                                            numericInput("Num18", label = h6("Sample Size (cm^2)"),value = 30.25)
                                                            
                                                       ),
                                                       
                                                       box( title = "Acquisition Layer", collapsible = TRUE, collapsed=FALSE, solidHeader = TRUE, width = 4, status = "success",
                                                            
                                                            selectInput("Curves5",label = "Choose the process",choices=list("1st Acquisition",
                                                                                                                            "Drainage",
                                                                                                                            "2nd Acquisition"), selected = "1st Acquisition" ),
                                                            
                                                            
                                                            actionButton("Compute2", "Compute"),
                                                            h5("CWP(mJ/m^2[web]"),
                                                            verbatimTextOutput("CWP3"),
                                                            h5("eCWP (uJ/g[fluid]"),
                                                            verbatimTextOutput("CWP4"),
                                                            numericInput("Weight2", label = h6("Wdry value"), value = 180),
                                                            numericInput("Num21", label = h6("Max Uptake (g[fluid]/g[web])"),value = 0),
                                                            numericInput("Num22", label = h6("Basis Weight, BWT (gsm)"),value = 27.6),
                                                            numericInput("Num23", label = h6("Porosity"),value = 0.75),
                                                            numericInput("Num24", label = h6("Sample Size (cm^2)"),value = 30.25)
                                                            
                                                       ),
                                                       
                                                       
                                                       box( title = "Storage Layer",  collapsible = TRUE, collapsed=FALSE, solidHeader = TRUE, width = 4, status = "success",
                                                            
                                                            selectInput("Curves6",label = "Choose the process",choices=list("1st Acquisition",
                                                                                                                            "Drainage",
                                                                                                                            "2nd Acquisition"),
                                                                        selected = "1st Acquisition"),
                                                            
                                                            
                                                            actionButton("Compute3", "Compute"),
                                                            h5("CWP(mJ/m^2[web]"),
                                                            verbatimTextOutput("CWP5"),
                                                            h5("eCWP (uJ/g[fluid]"),
                                                            verbatimTextOutput("CWP6"),
                                                            numericInput("Weight3", label = h6("Wdry value"), value = 180),
                                                            numericInput("Num39", label = h6("Max Uptake (g[fluid]/g[web])"),value = 0),
                                                            numericInput("Num40", label = h6("Basis Weight, BWT (gsm)"),value = 180),
                                                            numericInput("Num41", label = h6("Porosity"),value = 0.7),
                                                            numericInput("Num42", label = h6("Sample Size (cm^2)"),value = 30.25)
                                                            
                                                       ))
                                                     
                                    )),
                                    
                                    
                                    
                                    tabItems(tabItem(tabName = "Capillary-Pressure-and-Pore-Volume-Distribution-Plots", h3("Capillary Pressure and Pore Volume Distribution Plots"),
                                                     
                                                     
                                                     fluidRow(
                                                       
                                                       box(
                                                         title = "Capillary Pressure", collapsible = TRUE, collapsed = FALSE, solidHeader = TRUE, status = "danger", 
                                                         checkboxGroupInput("checkGroup1", label = h3("Checkbox group"), 
                                                                            choices = list("Layer 1" = 1, "Layer 2" = 2, "Layer 3" = 3, "Layer 1 & 2" = 4, "Layer 1, 2 & 3" = 5),
                                                                            selected = 5),
                                                         plotOutput("plot4", height = 350)
                                                       ),
                                                       
                                                       box(
                                                         title = "Pore Volume Distribution", collapsible = TRUE, collapsed = FALSE, solidHeader = TRUE, status = "danger", 
                                                         checkboxGroupInput("checkGroup2", label = h3("Checkbox group"), 
                                                                            choices = list("Layer 1" = 1, "Layer 2" = 2, "Layer 3" = 3, "Layer 1 & 2" = 4, "Layer 1, 2 & 3" = 5), 
                                                                            selected = 5),
                                                         plotOutput("plot5", height = 350)
                                                       )
                                                     )
                                                     
                                    )),
                                    
                                    
                                    tabItems(tabItem(tabName = "Partition-Tendency-and-Spreading-Curves", h3("Partition Tendency and Spreading Curves"),
                                                     
                                                     fluidRow(
                                                       
                                                       box(
                                                         title = "Partition Tendency", collapsible = TRUE, collapsed = FALSE, solidHeader = TRUE, status = "danger", 
                                                         checkboxGroupInput("checkGroup3", label = h3("Checkbox group"), 
                                                                            choices = list("set 1 " = 2, "set 2 " = 2, "set 1 & 2 " = 3),
                                                                            selected = 5),
                                                         plotOutput("plot6", height = 350)
                                                       ),
                                                       
                                                       box(
                                                         title = "Spreading Curves", collapsible = TRUE, collapsed = FALSE, solidHeader = TRUE, status = "danger", 
                                                         checkboxGroupInput("checkGroup4", label = h3("Checkbox group"), 
                                                                            choices = list("Layer 1" = 1, "Layer 2" = 2, "Layer 3" = 3, "Layer 1 & 2" = 4, "Layer 1, 2 & 3" = 5),
                                                                            selected = 5),
                                                         plotOutput("plot7", height = 350)
                                                       )
                                                       
                                                     )
                                                     
                                                     
                                    )),     
                                    
                                    
                                    tabItems(tabItem(tabName = "Virtual-Material-Summary", h3("Virtual Material Summary"),
                                                     
                                                     
                                                     fluidRow(
                                                       
                                                       box( title = "Top Sheet Layer",  collapsible = TRUE, collapsed=FALSE, solidHeader = TRUE, width = 4, status = "success",
                                                            
                                                            selectInput("Curves7",label = "Choose the process",choices=list("1st Acquisition",
                                                                                                                            "Drainage",
                                                                                                                            "2nd Acquisition") ,
                                                                        selected = "1st Acquisition"),
                                                            
                                                            actionButton("Load1", "Load"),
                                                            h5("Po"),
                                                            verbatimTextOutput("Num59"),
                                                            h5("m"),
                                                            verbatimTextOutput("Num60"),
                                                            h5("n"),
                                                            verbatimTextOutput("Num61"),
                                                            h5("CWP(mJ/m^2[web])"),
                                                            verbatimTextOutput("Num69"),
                                                            h5("Pc Avg [Pa]"),
                                                            verbatimTextOutput("Num70"),
                                                            h5("Pc 50 [Pa]"),verbatimTextOutput("Num71"),
                                                            numericInput("Num64", label = h6("Max Uptake (g [fluid]/g[web])"),value = 0),
                                                            numericInput("Num65", label = h6("Basis Weight, BWT (gsm)"),value = 20.1),
                                                            numericInput("Num66", label = h6("Caliper (mm)"),value = 0.50),
                                                            numericInput("Num67", label = h6("Porosity"),value = 0.960),
                                                            numericInput("Num68", label = h6("Fiber Density (g/cm3)"),value = 1)
                                                            
                                                       ),
                                                       
                                                       box( title = "Acquisition Layer", collapsible = TRUE, collapsed=FALSE, solidHeader = TRUE, width = 4, status = "success",
                                                            
                                                            selectInput("Curves8",label = "Choose the process",choices=list("1st Acquisition",
                                                                                                                            "Drainage",
                                                                                                                            "2nd Acquisition") ,
                                                                        selected = "1st Acquisition"),
                                                            
                                                            actionButton("Load2", "Load"),
                                                            h5("Po"),verbatimTextOutput("Num98"),
                                                            h5("m"),verbatimTextOutput("Num99"),
                                                            h5("n"),verbatimTextOutput("Num100"),
                                                            h5("CWP(mJ/m^2[web])"),verbatimTextOutput("Num108"),
                                                            h5("Pc Avg [Pa]"),verbatimTextOutput("Num109"),
                                                            h5("Pc 50 [Pa]"),verbatimTextOutput("Num110"),
                                                            numericInput("Num103", label = h6("Max Uptake (g [fluid]/g[web])"),value = 0),
                                                            numericInput("Num104", label = h6("Basis Weight, BWT (gsm)"),value = 27.6),
                                                            numericInput("Num105", label = h6("Caliper (mm)"),value = 0.70),
                                                            numericInput("Num106", label = h6("Porosity"),value = 0.961),
                                                            numericInput("Num107", label = h6("Fiber Density (g/cm3)"),value = 1)
                                                            
                                                       ),
                                                       
                                                       box( title = "Storage Layer",  collapsible = TRUE, collapsed=FALSE, solidHeader = TRUE, width = 4, status = "success",
                                                            
                                                            selectInput("Curves9",label = "Choose the process",choices=list("1st Acquisition",
                                                                                                                            "Drainage",
                                                                                                                            "2nd Acquisition") ,
                                                                        selected = "1st Acquisition"),
                                                            
                                                            actionButton("Load3", "Load"),
                                                            h5("Po"),verbatimTextOutput("Num137"),
                                                            h5("m"),verbatimTextOutput("Num138"),
                                                            h5("n"),verbatimTextOutput("Num139"),
                                                            h5("CWP(mJ/m^2[web])"),verbatimTextOutput("Num146"),
                                                            h5("Pc Avg [Pa]"),verbatimTextOutput("Num147"),
                                                            h5("Pc 50 [Pa]"),verbatimTextOutput("Num148"),
                                                            numericInput("Num142", label = h6("Max Uptake (g [fluid]/g[web])"),value = 0),
                                                            numericInput("Num143", label = h6("Basis Weight, BWT (gsm)"),value = 180),
                                                            numericInput("Num144", label = h6("Caliper (mm)"),value = 1.20),
                                                            numericInput("Num145", label = h6("Porosity"),value = 0.50),
                                                            numericInput("Num146", label = h6("Fiber Density (g/cm3)"),value = 1)
                                                            
                                                       ))
                                    )),
                                    
                                    
                                    tabItems(tabItem(tabName = "Van-Genuchten-Fitter", h3("Van Genuchten Fitter"),
                                                     
                                                     fluidRow(
                                                       
                                                       box( title = "Layer 1", collapsible = TRUE, status = "primary",  collapsed=FALSE, solidHeader = TRUE, width = 4, 
                                                            
                                                            selectInput("Curves1",label = "Choose the process",choices=list("1st Acquisition",
                                                                                                                            "Drainage",
                                                                                                                            "2nd Acquisition")),
                                                            sliderInput(inputId = "Sl1",label="Po",value=55, min=1,max=500,step = 1 ),
                                                            sliderInput(inputId = "Sl2",label="m",value=0.35, min=0.001,max=10,step = 0.001),
                                                            sliderInput(inputId = "Sl3",label="n",value=16, min=1,max=100,step = 1),
                                                            fluidRow(
                                                              column(3, actionButton("Plot1", "Plot")),
                                                              column(3, actionButton(inputId = "Fit1", label = "FIT")),
                                                              column(4, actionButton(inputId = "PVDArea1", label = "CWP - Area"))
                                                            ),
                                                            numericInput("num176", label = h6("Remove points ~ 0.02"), value = 0.01),
                                                            numericInput("num177", label = h6("Remove points ~ 0.95"), value = 0.95),
                                                            h5("Summary of Non Linear Curve Fit"),
                                                            div(class="span7", verbatimTextOutput("summary1")),
                                                            plotOutput("plot8", height = 350),
                                                            plotOutput("plot9", height = 350) 
                                                       ),
                                                       
                                                       box( title = "layer 2", collapsible = TRUE, status = "primary", collapsed=FALSE, solidHeader = TRUE, width = 4, 
                                                            
                                                            selectInput("Curves2",label = "Choose the process",choices=list("1st Acquisition",
                                                                                                                            "Drainage",
                                                                                                                            "2nd Acquisition")),
                                                            sliderInput(inputId = "Sl6",label="Po",value=55, min=1,max=500,step = 0.001),
                                                            sliderInput(inputId = "Sl7",label="m",value=0.35, min=0.001,max=10,step = 0.001),
                                                            sliderInput(inputId = "Sl8",label="n",value=16, min=1,max=100,step = 1),
                                                            fluidRow(
                                                              column(3, actionButton("Plot2", "Plot")),
                                                              column(3, actionButton(inputId = "Fit2", label = "FIT")),
                                                              column(4, actionButton(inputId = "PVDArea2", label = "CWP - Area"))
                                                            ),
                                                            numericInput("num178", label = h6("Remove points ~ 0.02"), value = 0.01),
                                                            numericInput("num179", label = h6("Remove points ~ 0.95"), value = 0.95),
                                                            h5("Summary of Non Linear Curve Fit"),
                                                            div(class="span7", verbatimTextOutput("summary2")),
                                                            plotOutput("plot10", height = 350),
                                                            plotOutput("plot11", height = 350) 
                                                            
                                                       ),
                                                       
                                                       
                                                       box( title = "Layer 3", collapsible = TRUE, status = "primary", collapsed=FALSE, solidHeader = TRUE, width = 4, 
                                                            
                                                            
                                                            selectInput("Curves3",label = "Choose the process",choices=list("1st Acquisition",
                                                                                                                            "Drainage",
                                                                                                                            "2nd Acquisition")),
                                                            sliderInput(inputId = "Sl11",label="Po",value=55, min=0.001,max=500,step = 0.001),
                                                            sliderInput(inputId = "Sl12",label="m",value=0.35, min=0.001,max=10,step = 0.001),
                                                            sliderInput(inputId = "Sl13",label="n",value=16, min=0.001,max=100,step = 0.001),
                                                            fluidRow(
                                                              column(3, actionButton("Plot3", "Plot")),
                                                              column(3, actionButton(inputId = "Fit3", label = "FIT")),
                                                              column(4, actionButton(inputId = "PVDArea3", label = "CWP - Area"))
                                                            ),
                                                            numericInput("num180", label = h6("Remove points ~ 0.02"), value = 0.01),
                                                            numericInput("num181", label = h6("Remove points ~ 0.95"), value = 0.95),
                                                            h5("Summary of Non Linear Curve Fit"),
                                                            div(class="span7", verbatimTextOutput("summary3")),
                                                            plotOutput("plot12", height = 350),
                                                            plotOutput("plot13", height = 350) 
                                                            
                                                       )
                                                       
                                                       
                                                     )
                                                     
                                    ))
                                    
                                    
                      ))
