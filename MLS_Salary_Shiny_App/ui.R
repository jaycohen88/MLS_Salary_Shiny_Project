dashboardPage(
    
    dashboardHeader(title = 'MLS Salary Data 2007-2019',
                    titleWidth = 300),
    
    dashboardSidebar(
        width = 300,
        sidebarUserPanel('By: Jay Cohen'),
        sidebarMenu(
            menuItem("Data", tabName = "data", icon = icon("database")),
            menuItem("By Season", tabName = "byseason", icon = icon("calendar")),
            menuItem("By Position", tabName = "byposition", icon = icon("search-location")),
            menuItem("By Club in 2019", tabName = "byclub", icon = icon("users")),
            menuItem("Points By Club Spend", tabName = "pointsbyspend", icon = icon("list"))
            )),
    
    dashboardBody(
        tabItems(
            
            tabItem(tabName = "data",
                    fluidRow(box(width = 4,
                            selectizeInput(inputId = "tableclub",
                                           label = "Club",
                                           choices = unique(salaries$club_name),
                                           selected = 'Atlanta United',
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
                             div("Annual Average Guaranteed Compensation includes a player's base salary and all signing and guaranteed bonuses and agent's fees annualized over the term of the player's contract, including option years."))),
            
            tabItem(tabName = "byseason",
                    fluidRow(box(width = 12, height = 500,
                                plotOutput("seasonboxplot"))),
                    fluidRow(h4("Notes"),
                            div("Mean Annual Average Guaranteed Compensation equals the mean of the annual average guaranteed compensation figures for each player in the League that season."))),
                          
            tabItem(tabName = "byposition",
                    fluidRow(box(width = 6,
                                 selectizeInput(inputId = "byposclub",
                                                label = "Club",
                                                choices = unique(salaries$club_name),
                                                selected = unique(salaries$club_name),
                                                multiple = TRUE)),
                             box(width = 6,  
                                 sliderInput(inputId = "byposseason",
                                             label = "Season",
                                             min = 2007, 
                                             max = 2019, 
                                             value = c(2007,2019),
                                             step = 1,
                                             sep = ""))),
                    fluidRow(box(width = 8, height = 500,
                                plotOutput("positionbarplot"))),
                    fluidRow(h4("Notes"),
                             div("Mean Annual Average Guaranteed Compensation equals the mean of the annual average guaranteed compensation figures for each player playing each position on the selected clubs during the selected season(s)."))),
        
            tabItem(tabName = "byclub",
                    fluidRow(box(width = 12,
                                 selectizeInput(inputId = "chooseclub1",
                                                label = "Club 1",
                                                choices = unique(salaries$club_name),
                                                selected = 'Atlanta United'),
                                 selectizeInput(inputId = "chooseclub2",
                                                label = "Club 2",
                                                choices = unique(salaries$club_name),
                                                selected = 'New York Red Bulls'),
                                 selectizeInput(inputId = "chooseclub3",
                                                label = "Club 3",
                                                choices = unique(salaries$club_name),
                                                selected = 'Toronto FC'))),
                    fluidRow(box(width = 12, height = 500,
                                plotOutput("clubboxplot"))),
                    fluidRow(h4("Notes"),
                             div("Mean Annual Average Guaranteed Compensation equals the mean of the annual average guaranteed compensation figures for each player on the selected clubs during the 2019 season."))),
            
            tabItem(tabName = "pointsbyspend",
                    fluidRow(box(
                                plotlyOutput("pointsscatterplot", width = '1000px', height='500px'))),
                    fluidRow(h4("Notes"),
                             div("Annual Salary Total equals the sum of the annualized average guaranteed compensation figures for each player on the club that season.")))
                    
            )
            
        )
    
)