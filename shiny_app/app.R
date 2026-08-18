library(shiny)

library(ggplot2)

employees <- read.csv("WA_Fn-UseC_-HR-Employee-Attrition.csv")

ui <- fluidPage(
  titlePanel("Employee Attrition Dashboard"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("groupvar", "Group by:",
                  choices = c("Department", "OverTime", "JobRole", "MaritalStatus"))
    ),
    
    mainPanel(
      plotOutput("attritionPlot")
    )
  )
)

server <- function(input, output) {
  output$attritionPlot <- renderPlot({
    ggplot(employees, aes_string(x = input$groupvar, fill = "Attrition")) +
      geom_bar(position = "fill") +
      labs(y = "Proportion", title = paste("Attrition by", input$groupvar)) +
      theme_minimal() +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
  })
}

shinyApp(ui = ui, server = server)
