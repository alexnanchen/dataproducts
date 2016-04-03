library(shiny)
library(ggplot2)
library(GGally)

data(swiss)

shinyServer(function(input, output) {
  
    #Monitor new button press and get values
    newSelection <- eventReactive(input$submitButton, { c(as.numeric(input$task), 
                                                          as.numeric(input$variable))})
    map <- reactive({c("Agriculture","Examination","Education","Catholic","Infant.Mortality")})
    col <- reactive({map()[newSelection()[2]-1]})
    
    
    output$help <- renderText({
        if(input$submitButton==0) {
            header <- reactive("<h3>Instructions</h3>")
            content <- reactive("<p>When exploring the <b>swiss dataset</b> you can either view linear relationships or
                                variables content. You can select that with the radio buttons on the top
                                left of the sidebar.</p><p>The second option is to select the scope of your exploration:
                                all variables or a specific variable. You can choose a variable with the radio buttons
                                on the bottom left of the sidebar.</p><p>For example, if you want to observe the relationship
                                between <font color='blue'>Agriculture</font> and <font color='blue'>Fertility</font> 
                                you select the 'linear fit' and 'Agriculture' options.</p><p>Note that nothing happen until
                                you have clicked the submit button.</p>")
            paste("<div style='max-width:620px'>",header(),content(),"</div>") 
        }
    })
    
    #Render variable(s) summaries
    output$summary <- renderText({
         if(input$submitButton>0 && newSelection()[1] == 1) {
             if(newSelection()[2] == 1) {
                 sumOutput <- reactive({capture.output(str(swiss))})
                 sum <- paste(sumOutput(),collapse="<br>")
                 sum <- paste("<h2>Summary for all variables</h2><br>",sum)
             }
             else {
                 sumOutput <- reactive({summary(swiss[col()])})
                 sum <- paste(sumOutput(),collapse="<br>")
                 sum <- paste("<h2>Summary for ", col(),"</h2><br>",sum)
             }
         }
    })
    
    #Render plots
    output$ggpairs <- renderPlot({
        if(input$submitButton > 0 && newSelection()[1] == 2) {
            if(newSelection()[2] == 1) {
                p <- reactive(ggpairs(swiss,lower=list(continuous="smooth"), 
                                        title=paste("Fertility explained by each variable")))
                print(p())
            }
            else {
                p <- reactive(ggplot(swiss,aes_string(col(),"Fertility")) + geom_point() + geom_smooth() +
                                ggtitle(paste("Fertility explained by", col())))
                print(p())
            }
        }
     })
})
