dashboardPage(
    
    dashboardHeader(title = 'MLS Salary Data 2007-2019',
                    titleWidth = 280),
    
    dashboardSidebar(
        width = 280,
        sidebarUserPanel('By: Jay Cohen'),
        sidebarMenu(
            menuItem("Data", tabName = "data", icon = icon("database")),
            menuItem("By Season", tabName = "byseason", icon = icon("calendar"),
                     menuSubItem("2007-2019 Boxplots", tabName = "seasonboxplottab"),
                     menuSubItem("Season vs Season Histograms", tabName = "seasonhistogramstab")),
            menuItem("By Position", tabName = "byposition", icon = icon("search-location")),
            menuItem("By Club", tabName = "byclub", icon = icon("users")),
            menuItem("Points By Club Spend", tabName = "pointsbyspend", icon = icon("list"))
            )),
    
    dashboardBody(
        tabItems(
            
            tabItem(tabName = "data",
                    fluidRow(box(width = 4,
                            selectizeInput(inputId = "tableclub",
                                           label = "Club",
                                           choices = sort(unique(salaries$club_name)),
                                           selected = c('Atlanta United', 'LA Galaxy', 'New York Red Bulls'),
                                           multiple = TRUE)),
                            box(width = 4,  
                                sliderInput(inputId = "tableseason",
                                        label = "Season",
                                        min = 2007, 
                                        max = 2019, 
                                        value = c(2007,2019),
                                        step = 1,
                                        sep = "")),
                            box(width = 4,
                                checkboxGroupInput(inputId = "tableposition",
                                               label = "Position", 
                                               choices = c('GK','D','M','F','None Listed'), 
                                               selected = c('GK','D','M','F','None Listed'),
                                               inline = TRUE))),
                    fluidRow(box(width = 12,
                                DT::DTOutput("salarytable"))),
                    fluidRow(h4("Notes"),
                             div("Salary Data from the MLS Players Association."),
                             div("Annualized Average Guaranteed Compensation includes a player's base salary and all signing and guaranteed bonuses and agent's fees annualized over the term of the player's contract, including option years."))),
            
            tabItem(tabName = "seasonboxplottab",
                    fluidRow(box(
                                plotOutput("seasonboxplot1", width = '1400px', height='800px'))),
                    fluidRow(box(
                                plotOutput("seasonboxplot2", width = '1400px', height='600px')))),
            
            tabItem(tabName = "seasonhistogramstab",
                    fluidRow(
                        box(width = 6,
                            selectizeInput(inputId = "chooseseason1",
                                           label = "Season 1",
                                           choices = sort(unique(seasontable$season)),
                                           selected = '2014')),
                        box(width = 6, 
                            selectizeInput(inputId = "chooseseason2",
                                           label = "Season 2",
                                           choices = sort(unique(seasontable$season)),
                                           selected = '2019'))),
                    fluidRow(
                        box(width = 6,
                            plotOutput("season1histogram", width ='100%', height = '600px')),
                        box(width = 6,
                            plotOutput("season2histogram", width ='100%', height = '600px')))),
        
            tabItem(tabName = "byposition",
                    fluidRow(box(width = 8,
                                 selectizeInput(inputId = "byposclub",
                                                label = "Club",
                                                choices = sort(unique(salaries$club_name)),
                                                selected = sort(unique(salaries$club_name)),
                                                multiple = TRUE)),
                             box(width = 4,  
                                 sliderInput(inputId = "byposseason",
                                             label = "Season",
                                             min = 2007, 
                                             max = 2019, 
                                             value = c(2007,2019),
                                             step = 1,
                                             sep = ""))),
                    fluidRow(box(
                                plotOutput("positionbarplot", width = '1040px', height = '650px'))),
                    fluidRow(h4("Notes"),
                             div("Mean Annualized Average Guaranteed Compensation equals the mean of the annualized average guaranteed compensation figures for each player playing each position on the selected clubs during the selected season(s)."))),
        
            tabItem(tabName = "byclub",
                    fluidRow(
                            box(width = 6,
                                selectizeInput(inputId = "chooseclub1",
                                                label = "Club 1",
                                                choices = sort(unique(clubtable$club)),
                                                selected = 'New York Red Bulls 2014')),
                            box(width = 6,
                                selectizeInput(inputId = "chooseclub2",
                                                label = "Club 2",
                                                choices = sort(unique(clubtable$club)),
                                                selected = 'LA Galaxy 2019'))),
                    fluidRow(
                            box(
                                plotOutput("club1boxplot1")),
                            box(
                                plotOutput("club2boxplot1"))),
                    
                    fluidRow(
                            box(
                                plotOutput("club1boxplot2")),
                            box(
                                plotOutput("club2boxplot2")))),
            
            tabItem(tabName = "pointsbyspend",
                    fluidRow(box(
                                plotlyOutput("pointsscatterplot", width = '1000px', height='500px'))),
                    fluidRow(h4("Notes"),
                             div("Club Season Salary Total equals the sum of the annualized average guaranteed compensation figures for each player on the club that season.")))
                    
            )
            
        )
    
)