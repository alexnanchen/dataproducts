library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Swiss dataset"),
  sidebarPanel(
      tags$head(tags$style(type="text/css", "
             body { overflow-y: scroll; }
             #loadmessage {
               width: 50%;
               margin: 50px 10px;
               padding: 5px 0px 5px 0px;
               text-align: center;
               font-weight: bold;
               font-size: 100%;
               color: #000000;
               background-color: #ADD8E6;
               z-index: 105;
             }
          ")),
      
    radioButtons("task", label = h3("Information"),
                 choices = list("Summary" = 1, "Linear fit" = 2), 
                 selected = 1),

    radioButtons("variable", label = h3("Variables"),
                 choices = list("All" = 1, "Agriculture" = 2, "Examination" = 3, 
                                "Education" = 4, "Catholic" = 5, "Infant.Mortality" = 6), 
                 selected = 1),
    
    actionButton("submitButton", label="submit"),
    
    conditionalPanel(condition="$('html').hasClass('shiny-busy')",
                     tags$div("Loading...",id="loadmessage"))
  ),
  
  mainPanel(
     tags$br(),
     htmlOutput("help"),
     htmlOutput("summary"),
     plotOutput("ggpairs"),
     textOutput("debug")
  )
))
