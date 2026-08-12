library(shiny)
library(mclust)

# -------------------- UI --------------------
ui <- fluidPage(
  
  titlePanel("Project Horizon: Drone Swarm Dataset Generation using GMM"),
  
  sidebarLayout(
    
    sidebarPanel(
      
      h4("Dataset Settings"),
      
      numericInput(
        "rows",
        "Number of Records",
        value = 1000,
        min = 100,
        max = 100000
      ),
      
      actionButton(
        "generate",
        "Generate Dataset"
      ),
      
      br(), br(),
      
      downloadButton(
        "download",
        "Download CSV"
      )
      
    ),
    
    mainPanel(
      
      tabsetPanel(
        
        # ---------------- DATA TAB ----------------
        tabPanel(
          "Data",
          br(),
          h4("Dataset Preview"),
          tableOutput("preview"),
          br(),
          verbatimTextOutput("status")
        ),
        
        # ---------------- STATISTICS TAB ----------------
        tabPanel(
          "Statistics",
          br(),
          
          h4("Summary Statistics"),
          verbatimTextOutput("summary"),
          
          h4("Mean Values"),
          verbatimTextOutput("mean"),
          
          h4("Standard Deviation"),
          verbatimTextOutput("sd"),
          
          h4("Variance"),
          verbatimTextOutput("variance"),
          
          h4("Missing Values"),
          verbatimTextOutput("missing"),
          
          h4("Correlation Matrix"),
          verbatimTextOutput("correlation")
        ),
        
        # ---------------- GRAPHS TAB ----------------
        tabPanel(
          "Graphs",
          br(),
          
          fluidRow(
            column(6, plotOutput("dronePlot")),
            column(6, plotOutput("victimPlot"))
          ),
          
          fluidRow(
            column(6, plotOutput("batteryPlot")),
            column(6, plotOutput("rewardPlot"))
          ),
          
          fluidRow(
            column(6, plotOutput("weatherPlot")),
            column(6, plotOutput("terrainPlot"))
          ),
          
          fluidRow(
            column(12, plotOutput("scatterPlot"))
          )
        )
      )
    )
  )
)

# -------------------- SERVER --------------------
server <- function(input, output) {
  
  # -------- Dataset Generation using GMM --------
  dataset <- eventReactive(input$generate, {
    
    n <- input$rows
    
    set.seed(123)
    
    # Drone information
    Drone_X <- runif(n, 0, 100)
    Drone_Y <- runif(n, 0, 100)
    
    Battery <- runif(n, 20, 100)
    Speed <- runif(n, 5, 20)
    
    # Weather and Terrain
    Weather <- sample(c("Clear", "Rain", "Windy", "Fog"),
                      n, replace = TRUE)
    
    Terrain <- sample(c("Plain", "Forest", "Hill", "Urban"),
                      n, replace = TRUE)
    
    # ---------------- GMM Victim Generation ----------------
    means <- matrix(c(
      20,20,
      80,25,
      40,70,
      75,80
    ), byrow = TRUE, ncol = 2)
    
    cluster <- sample(1:4, n, replace = TRUE)
    
    Victim_X <- rnorm(n, means[cluster,1], 5)
    Victim_Y <- rnorm(n, means[cluster,2], 5)
    
    # Fit GMM model
    victim_data <- data.frame(Victim_X, Victim_Y)
    gmm <- Mclust(victim_data)
    
    # Distance and Reward
    Distance <- sqrt((Drone_X - Victim_X)^2 +
                       (Drone_Y - Victim_Y)^2)
    
    Reward <- ifelse(Distance < 5, 100, -Distance)
    
    Done <- ifelse(Distance < 2, 1, 0)
    
    # Final dataset
    data.frame(
      Drone_X = round(Drone_X,2),
      Drone_Y = round(Drone_Y,2),
      Victim_X = round(Victim_X,2),
      Victim_Y = round(Victim_Y,2),
      Battery = round(Battery,2),
      Speed = round(Speed,2),
      Distance = round(Distance,2),
      Weather = Weather,
      Terrain = Terrain,
      Reward = round(Reward,2),
      Done = Done
    )
  })
  
  # ---------------- DATA OUTPUTS ----------------
  output$preview <- renderTable({
    head(dataset(), 10)
  })
  
  output$status <- renderPrint({
    cat("Rows    :", nrow(dataset()), "\\n")
    cat("Columns :", ncol(dataset()), "\\n")
    cat("Algorithm: Gaussian Mixture Model (GMM)")
  })
  
  # ---------------- STATISTICAL ANALYSIS ----------------
  output$summary <- renderPrint({
    summary(dataset())
  })
  
  output$mean <- renderPrint({
    num_data <- dataset()[, sapply(dataset(), is.numeric)]
    sapply(num_data, mean)
  })
  
  output$sd <- renderPrint({
    num_data <- dataset()[, sapply(dataset(), is.numeric)]
    sapply(num_data, sd)
  })
  
  output$variance <- renderPrint({
    num_data <- dataset()[, sapply(dataset(), is.numeric)]
    sapply(num_data, var)
  })
  
  output$missing <- renderPrint({
    colSums(is.na(dataset()))
  })
  
  output$correlation <- renderPrint({
    num_data <- dataset()[, sapply(dataset(), is.numeric)]
    round(cor(num_data), 2)
  })
  
  # ---------------- GRAPHS ----------------
  
  # Drone Positions
  output$dronePlot <- renderPlot({
    plot(dataset()$Drone_X,
         dataset()$Drone_Y,
         col = "blue",
         pch = 19,
         xlab = "Drone X",
         ylab = "Drone Y",
         main = "Drone Positions")
  })
  
  # Victim Clusters
  output$victimPlot <- renderPlot({
    plot(dataset()$Victim_X,
         dataset()$Victim_Y,
         col = "red",
         pch = 19,
         xlab = "Victim X",
         ylab = "Victim Y",
         main = "Victim Clusters (GMM)")
  })
  
  # Battery Distribution
  output$batteryPlot <- renderPlot({
    hist(dataset()$Battery,
         col = "lightgreen",
         main = "Battery Distribution",
         xlab = "Battery Level")
  })
  
  # Reward Distribution
  output$rewardPlot <- renderPlot({
    hist(dataset()$Reward,
         col = "orange",
         main = "Reward Distribution",
         xlab = "Reward")
  })
  
  # Weather Distribution
  output$weatherPlot <- renderPlot({
    barplot(table(dataset()$Weather),
            col = "skyblue",
            main = "Weather Distribution")
  })
  
  # Terrain Distribution
  output$terrainPlot <- renderPlot({
    pie(table(dataset()$Terrain),
        main = "Terrain Distribution")
  })
  
  # Battery vs Speed
  output$scatterPlot <- renderPlot({
    plot(dataset()$Speed,
         dataset()$Battery,
         pch = 19,
         col = "purple",
         xlab = "Speed",
         ylab = "Battery",
         main = "Battery vs Speed")
  })
  
  # ---------------- DOWNLOAD CSV ----------------
  output$download <- downloadHandler(
    
    filename = function() {
      "Drone_Swarm_Dataset_1000.csv"
    },
    
    content = function(file) {
      write.csv(dataset(), file, row.names = FALSE)
    }
  )
}

# ---------------- RUN APP ----------------
shinyApp(ui, server)