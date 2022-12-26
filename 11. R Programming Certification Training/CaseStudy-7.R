library(ggplot2)
library(dplyr)
library(shiny)
library(DT)


setwd(choose.dir())
getwd()

app2 = read.csv("app2data.csv")

ui <- fluidPage(
  titlePanel("Basic DataTable"),
  
  
  fluidRow(
    column(4,
           selectInput("man",
                       "Manufacturer:",
                       c("All",
                         unique(as.character(app2$manufacturer))))
    ),
    column(4,
           selectInput("trans",
                       "Transmission:",
                       c("All",
                         unique(as.character(app2$trans))))
    ),
    column(4,
           selectInput("cyl",
                       "Cylinders:",
                       c("All",
                         unique(as.character(app2$cyl))))
    )
  ),
  # Create a new row for the table.
  fluidRow(
    DT::dataTableOutput("table")
  )
) 

server <- function(input, output) {
  
  output$table <- DT::renderDataTable(DT::datatable({
    data <- app2
    if (input$man != "All") {
      data <- data[data$manufacturer == input$man,]
    }
    if (input$cyl != "All") {
      data <- data[data$cyl == input$cyl,]
    }
    if (input$trans != "All") {
      data <- data[data$trans == input$trans,]
    }
    data
  }))
  
} 

shinyApp(ui=ui,server = server)

