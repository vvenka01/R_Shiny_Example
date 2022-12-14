library(shiny)
library(ggplot2)

dataset <- c("iris")

ui <- fluidPage(
    
  # App Title
  titlePanel(
    
    h1("Visualizing the Iris Dataset",
    h5("Select a dependent variable below to see the distribution of values for each Iris species")),
    
  ),
  
    
  # Sidebar layout with inputs and outputs
  sidebarLayout(
    sidebarPanel(
      
      selectInput("y", "dependent variable:",
                   choices = list("Sepal.Length",
                                 "Sepal.Width", 
                                 "Petal.Length", 
                                 "Petal.Width")),
    ),
  
    mainPanel(
        plotOutput("scatterplot")
    )
  )
)
  
server <- function(input, output) {
    
    output$scatterplot <- renderPlot({
      
    ir <- iris[,c("Species", input$y)]
    ggplot(data=ir, aes(x=ir[,1],y=ir[,2])) + 
      geom_point() +
      labs(x = colnames(ir)[1], y = colnames(ir)[2], 
      title = paste("Scatter Plot of Species vs", input$y))
      
  })
}


shinyApp(ui, server)

