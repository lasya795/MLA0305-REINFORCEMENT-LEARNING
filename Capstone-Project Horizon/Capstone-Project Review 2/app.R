# ============================================================
# PROJECT HORIZON
# Cooperative Drone Swarm Search and Rescue
# using Multi-Agent Reinforcement Learning
# and Swarm-Based Agent Simulation
#
# COMPLETE SHINY APPLICATION
# MODULE 1 + MODULE 2 + MODULE 3 + MODULE 4 + MODULE 5
# ============================================================

library(shiny)
library(shinydashboard)
library(DT)
library(ggplot2)

# ============================================================
# USER INTERFACE
# ============================================================

ui <- dashboardPage(
  
  dashboardHeader(
    title = "PROJECT HORIZON"
  ),
  
  dashboardSidebar(
    
    sidebarMenu(
      
      menuItem(
        "Home",
        tabName = "home",
        icon = icon("home")
      ),
      
      menuItem(
        "Module 1 - Data Generation",
        tabName = "module1",
        icon = icon("database")
      ),
      
      menuItem(
        "Module 2 - Data Preprocessing",
        tabName = "module2",
        icon = icon("cogs")
      ),
      
      menuItem(
        "Module 3 - Drone Swarm Simulation",
        tabName = "module3",
        icon = icon("plane")
      ),
      
      menuItem(
        "Module 4 - Multi-Agent Reinforcement Learning",
        tabName = "module4",
        icon = icon("brain")
      ),
      
      menuItem(
        "Module 5 - Performance Evaluation",
        tabName = "module5",
        icon = icon("chart-line")
      )
      
    )
  ),
  
  dashboardBody(
    
    tabItems(
      
      # ======================================================
      # HOME
      # ======================================================
      
      tabItem(
        
        tabName = "home",
        
        h2("PROJECT HORIZON"),
        
        h3(
          "Cooperative Drone Swarm Search and Rescue"
        ),
        
        h4(
          "Multi-Agent Reinforcement Learning and Swarm-Based Agent Simulation"
        ),
        
        br(),
        
        h3("Project Modules"),
        
        tags$ol(
          
          tags$li(
            "Module 1 - Data Generation, Statistical Analysis and Visualization"
          ),
          
          tags$li(
            "Module 2 - Data Preprocessing"
          ),
          
          tags$li(
            "Module 3 - Multi-Agent Drone Swarm Simulation"
          ),
          
          tags$li(
            "Module 4 - Multi-Agent Reinforcement Learning"
          ),
          
          tags$li(
            "Module 5 - Performance Evaluation"
          )
          
        ),
        
        br(),
        
        h3("System Workflow"),
        
        p(
          "Dataset Generation → Preprocessing → Drone Swarm Simulation → MARL Training → Performance Evaluation"
        )
        
      ),
      
      # ======================================================
      # MODULE 1
      # ======================================================
      
      tabItem(
        
        tabName = "module1",
        
        h2(
          "Module 1 - Data Generation, Statistical Analysis and Visualization"
        ),
        
        tabsetPanel(
          
          # --------------------------------------------------
          # DATA
          # --------------------------------------------------
          
          tabPanel(
            
            "Dataset",
            
            br(),
            
            selectInput(
              
              "method",
              
              "Dataset Generation Method:",
              
              choices = c(
                "GMM",
                "GAN"
              ),
              
              selected = "GMM"
              
            ),
            
            sliderInput(
              
              "records",
              
              "Number of Records:",
              
              min = 500,
              
              max = 1000,
              
              value = 1000,
              
              step = 100
              
            ),
            
            actionButton(
              
              "generate",
              
              "GENERATE DATASET",
              
              class = "btn-primary"
              
            ),
            
            br(),
            br(),
            
            downloadButton(
              
              "download",
              
              "Download CSV"
              
            ),
            
            br(),
            br(),
            
            DTOutput(
              "data"
            )
            
          ),
          
          # --------------------------------------------------
          # STATISTICS
          # --------------------------------------------------
          
          tabPanel(
            
            "Statistical Analysis",
            
            br(),
            
            h3(
              "Descriptive Statistics"
            ),
            
            tableOutput(
              "stats"
            ),
            
            br(),
            
            h3(
              "Missing Value Analysis"
            ),
            
            tableOutput(
              "missing"
            ),
            
            br(),
            
            h3(
              "Correlation Matrix"
            ),
            
            tableOutput(
              "correlation"
            )
            
          ),
          
          # --------------------------------------------------
          # VISUALIZATION
          # --------------------------------------------------
          
          tabPanel(
            
            "Visualization",
            
            br(),
            
            h3(
              "1. Battery Level Distribution"
            ),
            
            plotOutput(
              "battery",
              height = "350px"
            ),
            
            h3(
              "2. Drone Speed Distribution"
            ),
            
            plotOutput(
              "speed",
              height = "350px"
            ),
            
            h3(
              "3. Altitude Distribution"
            ),
            
            plotOutput(
              "altitude",
              height = "350px"
            ),
            
            h3(
              "4. Target Distance Distribution"
            ),
            
            plotOutput(
              "distance",
              height = "350px"
            ),
            
            h3(
              "5. Battery vs Speed"
            ),
            
            plotOutput(
              "scatter",
              height = "350px"
            ),
            
            h3(
              "6. Drone Status"
            ),
            
            plotOutput(
              "status",
              height = "350px"
            ),
            
            h3(
              "7. Drone Status Pie Chart"
            ),
            
            plotOutput(
              "pie",
              height = "400px"
            )
            
          )
          
        )
        
      ),
      
      # ======================================================
      # MODULE 2
      # ======================================================
      
      tabItem(
        
        tabName = "module2",
        
        h2(
          "Module 2 - Data Preprocessing"
        ),
        
        tabsetPanel(
          
          # --------------------------------------------------
          # RAW DATA
          # --------------------------------------------------
          
          tabPanel(
            
            "Raw Data",
            
            br(),
            
            p(
              "The dataset generated in Module 1 is used as input for preprocessing."
            ),
            
            DTOutput(
              "raw_data"
            )
            
          ),
          
          # --------------------------------------------------
          # MISSING VALUES
          # --------------------------------------------------
          
          tabPanel(
            
            "Missing Values",
            
            br(),
            
            tableOutput(
              "module2_missing"
            )
            
          ),
          
          # --------------------------------------------------
          # PROCESSING
          # --------------------------------------------------
          
          tabPanel(
            
            "Process Data",
            
            br(),
            
            selectInput(
              
              "preprocess_method",
              
              "Select Preprocessing Technique:",
              
              choices = c(
                "Min-Max Normalization",
                "Z-Score Standardization"
              )
              
            ),
            
            actionButton(
              
              "process",
              
              "PROCESS DATA",
              
              class = "btn-success"
              
            ),
            
            br(),
            br(),
            
            DTOutput(
              "processed_data"
            ),
            
            br(),
            
            downloadButton(
              
              "download_processed",
              
              "Download Processed CSV"
              
            )
            
          ),
          
          # --------------------------------------------------
          # BEFORE AFTER
          # --------------------------------------------------
          
          tabPanel(
            
            "Before vs After",
            
            br(),
            
            fluidRow(
              
              box(
                
                width = 6,
                
                title = "Before Preprocessing",
                
                status = "primary",
                
                solidHeader = TRUE,
                
                plotOutput(
                  "before_plot",
                  height = "350px"
                )
                
              ),
              
              box(
                
                width = 6,
                
                title = "After Preprocessing",
                
                status = "success",
                
                solidHeader = TRUE,
                
                plotOutput(
                  "after_plot",
                  height = "350px"
                )
                
              )
              
            )
            
          )
          
        )
        
      ),
      
      # ======================================================
      # MODULE 3
      # ======================================================
      
      tabItem(
        
        tabName = "module3",
        
        h2(
          "Module 3 - Multi-Agent Drone Swarm Simulation"
        ),
        
        fluidRow(
          
          box(
            
            width = 4,
            
            title = "Simulation Controls",
            
            status = "primary",
            
            solidHeader = TRUE,
            
            numericInput(
              
              "num_drones",
              
              "Number of Drones:",
              
              value = 5,
              
              min = 2,
              
              max = 20
              
            ),
            
            numericInput(
              
              "simulation_steps",
              
              "Simulation Steps:",
              
              value = 50,
              
              min = 10,
              
              max = 200
              
            ),
            
            numericInput(
              
              "target_x",
              
              "Target X Position:",
              
              value = 90,
              
              min = 0,
              
              max = 100
              
            ),
            
            numericInput(
              
              "target_y",
              
              "Target Y Position:",
              
              value = 90,
              
              min = 0,
              
              max = 100
              
            ),
            
            br(),
            
            actionButton(
              
              "start_simulation",
              
              "START SIMULATION",
              
              class = "btn-success",
              
              style = "width:100%"
              
            )
            
          ),
          
          box(
            
            width = 8,
            
            title = "Drone Swarm Movement",
            
            status = "success",
            
            solidHeader = TRUE,
            
            plotOutput(
              
              "swarm_plot",
              
              height = "600px"
              
            )
            
          )
          
        ),
        
        fluidRow(
          
          box(
            
            width = 6,
            
            title = "Simulation Results",
            
            status = "info",
            
            solidHeader = TRUE,
            
            tableOutput(
              "simulation_results"
            )
            
          ),
          
          box(
            
            width = 6,
            
            title = "Reward Analysis",
            
            status = "warning",
            
            solidHeader = TRUE,
            
            plotOutput(
              
              "reward_plot",
              
              height = "350px"
              
            )
            
          )
          
        )
        
      ),
      
      # ======================================================
      # MODULE 4
      # ======================================================
      
      tabItem(
        
        tabName = "module4",
        
        h2(
          "Module 4 - Multi-Agent Reinforcement Learning"
        ),
        
        fluidRow(
          
          box(
            
            width = 4,
            
            title = "MARL Training Controls",
            
            status = "primary",
            
            solidHeader = TRUE,
            
            numericInput(
              
              "marl_drones",
              
              "Number of Drones:",
              
              value = 3,
              
              min = 1,
              
              max = 10
              
            ),
            
            numericInput(
              
              "marl_episodes",
              
              "Training Episodes:",
              
              value = 100,
              
              min = 10,
              
              max = 500
              
            ),
            
            numericInput(
              
              "marl_grid",
              
              "Grid Size:",
              
              value = 10,
              
              min = 5,
              
              max = 20
              
            ),
            
            sliderInput(
              
              "learning_rate",
              
              "Learning Rate:",
              
              min = 0.01,
              
              max = 1,
              
              value = 0.5,
              
              step = 0.01
              
            ),
            
            sliderInput(
              
              "discount_factor",
              
              "Discount Factor:",
              
              min = 0,
              
              max = 1,
              
              value = 0.9,
              
              step = 0.01
              
            ),
            
            sliderInput(
              
              "epsilon",
              
              "Exploration Rate:",
              
              min = 0,
              
              max = 1,
              
              value = 0.2,
              
              step = 0.01
              
            ),
            
            actionButton(
              
              "train_marl",
              
              "START MARL TRAINING",
              
              class = "btn-success",
              
              style = "width:100%"
              
            )
            
          ),
          
          box(
            
            width = 8,
            
            title = "Learned Drone Paths",
            
            status = "success",
            
            solidHeader = TRUE,
            
            plotOutput(
              
              "marl_path",
              
              height = "550px"
              
            )
            
          )
          
        ),
        
        fluidRow(
          
          box(
            
            width = 6,
            
            title = "Training Reward",
            
            status = "warning",
            
            solidHeader = TRUE,
            
            plotOutput(
              
              "marl_reward",
              
              height = "350px"
              
            )
            
          ),
          
          box(
            
            width = 6,
            
            title = "MARL Results",
            
            status = "info",
            
            solidHeader = TRUE,
            
            tableOutput(
              "marl_results"
            )
            
          )
          
        )
        
      ),
      
      # ======================================================
      # MODULE 5
      # ======================================================
      
      tabItem(
        
        tabName = "module5",
        
        h2(
          "Module 5 - Performance Evaluation"
        ),
        
        fluidRow(
          
          box(
            
            width = 4,
            
            title = "Evaluation",
            
            status = "primary",
            
            solidHeader = TRUE,
            
            actionButton(
              
              "evaluate",
              
              "EVALUATE PERFORMANCE",
              
              class = "btn-primary",
              
              style = "width:100%"
              
            )
            
          ),
          
          box(
            
            width = 8,
            
            title = "Performance Metrics",
            
            status = "success",
            
            solidHeader = TRUE,
            
            tableOutput(
              "performance_table"
            )
            
          )
          
        ),
        
        fluidRow(
          
          box(
            
            width = 6,
            
            title = "Reward Performance",
            
            status = "warning",
            
            solidHeader = TRUE,
            
            plotOutput(
              
              "performance_reward",
              
              height = "350px"
              
            )
            
          ),
          
          box(
            
            width = 6,
            
            title = "Performance Comparison",
            
            status = "info",
            
            solidHeader = TRUE,
            
            plotOutput(
              
              "performance_comparison",
              
              height = "350px"
              
            )
            
          )
          
        )
        
      )
      
    )
    
  )
  
)


# ============================================================
# SERVER
# ============================================================

server <- function(input, output, session) {
  
  # ==========================================================
  # MODULE 1 - DATA GENERATION
  # ==========================================================
  
  dataset <- eventReactive(
    
    input$generate,
    
    {
      
      set.seed(123)
      
      n <- input$records
      
      # ------------------------------------------------------
      # GMM STYLE DATA
      # ------------------------------------------------------
      
      if (input$method == "GMM") {
        
        group <- sample(
          
          1:3,
          
          n,
          
          replace = TRUE,
          
          prob = c(
            0.40,
            0.35,
            0.25
          )
          
        )
        
        battery <- numeric(n)
        
        speed <- numeric(n)
        
        altitude <- numeric(n)
        
        for (i in 1:n) {
          
          if (group[i] == 1) {
            
            battery[i] <-
              rnorm(
                1,
                80,
                8
              )
            
            speed[i] <-
              rnorm(
                1,
                35,
                5
              )
            
            altitude[i] <-
              rnorm(
                1,
                200,
                30
              )
            
          }
          
          else if (group[i] == 2) {
            
            battery[i] <-
              rnorm(
                1,
                60,
                10
              )
            
            speed[i] <-
              rnorm(
                1,
                55,
                7
              )
            
            altitude[i] <-
              rnorm(
                1,
                300,
                40
              )
            
          }
          
          else {
            
            battery[i] <-
              rnorm(
                1,
                40,
                7
              )
            
            speed[i] <-
              rnorm(
                1,
                70,
                6
              )
            
            altitude[i] <-
              rnorm(
                1,
                450,
                35
              )
            
          }
          
        }
        
      }
      
      # ------------------------------------------------------
      # GAN STYLE DATA
      # ------------------------------------------------------
      
      else {
        
        noise <- rnorm(n)
        
        battery <-
          
          65 +
          
          18 *
          tanh(noise) +
          
          rnorm(
            n,
            0,
            5
          )
        
        speed <-
          
          50 +
          
          15 *
          sin(noise) +
          
          rnorm(
            n,
            0,
            4
          )
        
        altitude <-
          
          300 +
          
          100 *
          cos(noise) +
          
          rnorm(
            n,
            0,
            20
          )
        
      }
      
      # ------------------------------------------------------
      # LIMIT VALUES
      # ------------------------------------------------------
      
      battery <-
        pmin(
          pmax(
            battery,
            10
          ),
          100
        )
      
      speed <-
        pmin(
          pmax(
            speed,
            10
          ),
          100
        )
      
      altitude <-
        pmin(
          pmax(
            altitude,
            50
          ),
          600
        )
      
      # ------------------------------------------------------
      # FINAL DATASET
      # ------------------------------------------------------
      
      data.frame(
        
        Drone_ID = 1:n,
        
        Battery =
          round(
            battery,
            2
          ),
        
        Speed =
          round(
            speed,
            2
          ),
        
        Altitude =
          round(
            altitude,
            2
          ),
        
        Latitude =
          round(
            runif(
              n,
              12,
              18
            ),
            4
          ),
        
        Longitude =
          round(
            runif(
              n,
              76,
              82
            ),
            4
          ),
        
        Signal =
          round(
            runif(
              n,
              40,
              100
            ),
            2
          ),
        
        Target_Distance =
          round(
            runif(
              n,
              0,
              100
            ),
            2
          ),
        
        Obstacle_Distance =
          round(
            runif(
              n,
              5,
              50
            ),
            2
          ),
        
        Reward =
          round(
            runif(
              n,
              -1,
              10
            ),
            2
          ),
        
        Status =
          sample(
            
            c(
              "Searching",
              "Target Detected",
              "Returning",
              "Idle"
            ),
            
            n,
            
            replace = TRUE
            
          )
        
      )
      
    }
    
  )
  
  
  # ==========================================================
  # MODULE 1 - DATA TABLE
  # ==========================================================
  
  output$data <- renderDT({
    
    req(dataset())
    
    datatable(
      
      dataset(),
      
      options = list(
        pageLength = 10,
        scrollX = TRUE
      ),
      
      filter = "top",
      
      rownames = FALSE
      
    )
    
  })
  
  
  # ==========================================================
  # MODULE 1 - STATISTICS
  # ==========================================================
  
  output$stats <- renderTable({
    
    req(dataset())
    
    d <- dataset()
    
    numeric_data <-
      d[
        sapply(
          d,
          is.numeric
        )
      ]
    
    data.frame(
      
      Variable =
        names(
          numeric_data
        ),
      
      Mean =
        round(
          sapply(
            numeric_data,
            mean
          ),
          2
        ),
      
      Median =
        round(
          sapply(
            numeric_data,
            median
          ),
          2
        ),
      
      SD =
        round(
          sapply(
            numeric_data,
            sd
          ),
          2
        ),
      
      Variance =
        round(
          sapply(
            numeric_data,
            var
          ),
          2
        )
      
    )
    
  })
  
  
  # ==========================================================
  # MODULE 1 - MISSING VALUES
  # ==========================================================
  
  output$missing <- renderTable({
    
    req(dataset())
    
    d <- dataset()
    
    data.frame(
      
      Variable =
        names(d),
      
      Missing =
        sapply(
          d,
          function(x)
            sum(
              is.na(x)
            )
        ),
      
      Percentage =
        round(
          
          sapply(
            
            d,
            
            function(x)
              mean(
                is.na(x)
              ) * 100
            
          ),
          
          2
          
        )
      
    )
    
  })
  
  
  # ==========================================================
  # MODULE 1 - CORRELATION
  # ==========================================================
  
  output$correlation <- renderTable({
    
    req(dataset())
    
    d <- dataset()
    
    numeric_data <-
      d[
        sapply(
          d,
          is.numeric
        )
      ]
    
    round(
      cor(
        numeric_data
      ),
      2
    )
    
  })
  
  
  # ==========================================================
  # MODULE 1 - GRAPH 1
  # ==========================================================
  
  output$battery <- renderPlot({
    
    req(dataset())
    
    ggplot(
      
      dataset(),
      
      aes(
        x = Battery
      )
      
    ) +
      
      geom_histogram(
        
        bins = 20,
        
        fill = "skyblue",
        
        color = "blue"
        
      ) +
      
      theme_minimal() +
      
      labs(
        
        title =
          "Battery Level Distribution",
        
        x =
          "Battery",
        
        y =
          "Frequency"
        
      )
    
  })
  
  
  # ==========================================================
  # MODULE 1 - GRAPH 2
  # ==========================================================
  
  output$speed <- renderPlot({
    
    req(dataset())
    
    ggplot(
      
      dataset(),
      
      aes(
        x = Speed
      )
      
    ) +
      
      geom_histogram(
        
        bins = 20,
        
        fill = "lightgreen",
        
        color = "darkgreen"
        
      ) +
      
      theme_minimal() +
      
      labs(
        
        title =
          "Drone Speed Distribution",
        
        x =
          "Speed",
        
        y =
          "Frequency"
        
      )
    
  })
  
  
  # ==========================================================
  # MODULE 1 - GRAPH 3
  # ==========================================================
  
  output$altitude <- renderPlot({
    
    req(dataset())
    
    ggplot(
      
      dataset(),
      
      aes(
        x = Altitude
      )
      
    ) +
      
      geom_histogram(
        
        bins = 20,
        
        fill = "orange",
        
        color = "darkorange"
        
      ) +
      
      theme_minimal() +
      
      labs(
        
        title =
          "Altitude Distribution",
        
        x =
          "Altitude",
        
        y =
          "Frequency"
        
      )
    
  })
  
  
  # ==========================================================
  # MODULE 1 - GRAPH 4
  # ==========================================================
  
  output$distance <- renderPlot({
    
    req(dataset())
    
    ggplot(
      
      dataset(),
      
      aes(
        x = Target_Distance
      )
      
    ) +
      
      geom_histogram(
        
        bins = 20,
        
        fill = "plum",
        
        color = "purple"
        
      ) +
      
      theme_minimal() +
      
      labs(
        
        title =
          "Target Distance Distribution",
        
        x =
          "Target Distance",
        
        y =
          "Frequency"
        
      )
    
  })
  
  
  # ==========================================================
  # MODULE 1 - GRAPH 5
  # ==========================================================
  
  output$scatter <- renderPlot({
    
    req(dataset())
    
    ggplot(
      
      dataset(),
      
      aes(
        
        x = Battery,
        
        y = Speed
        
      )
      
    ) +
      
      geom_point(
        
        color = "red",
        
        size = 3,
        
        alpha = 0.6
        
      ) +
      
      theme_minimal() +
      
      labs(
        
        title =
          "Battery vs Speed",
        
        x =
          "Battery",
        
        y =
          "Speed"
        
      )
    
  })
  
  
  # ==========================================================
  # MODULE 1 - GRAPH 6
  # ==========================================================
  
  output$status <- renderPlot({
    
    req(dataset())
    
    ggplot(
      
      dataset(),
      
      aes(
        x = Status,
        fill = Status
      )
      
    ) +
      
      geom_bar(
        color = "black"
      ) +
      
      theme_minimal() +
      
      labs(
        
        title =
          "Drone Status",
        
        x =
          "Status",
        
        y =
          "Count"
        
      )
    
  })
  
  
  # ==========================================================
  # MODULE 1 - GRAPH 7
  # ==========================================================
  
  output$pie <- renderPlot({
    
    req(dataset())
    
    d <-
      as.data.frame(
        table(
          dataset()$Status
        )
      )
    
    names(d) <-
      c(
        "Status",
        "Count"
      )
    
    ggplot(
      
      d,
      
      aes(
        
        x = "",
        
        y = Count,
        
        fill = Status
        
      )
      
    ) +
      
      geom_bar(
        
        stat = "identity",
        
        width = 1
        
      ) +
      
      coord_polar(
        "y"
      ) +
      
      theme_void() +
      
      labs(
        
        title =
          "Drone Status Pie Chart"
        
      )
    
  })
  
  
  # ==========================================================
  # MODULE 1 - DOWNLOAD
  # ==========================================================
  
  output$download <-
    downloadHandler(
      
      filename = function() {
        
        "Project_Horizon_Dataset.csv"
        
      },
      
      content = function(file) {
        
        write.csv(
          
          dataset(),
          
          file,
          
          row.names = FALSE
          
        )
        
      }
      
    )
  
  
  # ==========================================================
  # MODULE 2 - RAW DATA
  # ==========================================================
  
  output$raw_data <- renderDT({
    
    req(dataset())
    
    datatable(
      
      dataset(),
      
      options = list(
        pageLength = 10,
        scrollX = TRUE
      ),
      
      filter = "top",
      
      rownames = FALSE
      
    )
    
  })
  
  
  # ==========================================================
  # MODULE 2 - MISSING VALUES
  # ==========================================================
  
  output$module2_missing <- renderTable({
    
    req(dataset())
    
    d <- dataset()
    
    data.frame(
      
      Variable =
        names(d),
      
      Missing_Values =
        sapply(
          
          d,
          
          function(x)
            sum(
              is.na(x)
            )
          
        ),
      
      Percentage =
        round(
          
          sapply(
            
            d,
            
            function(x)
              mean(
                is.na(x)
              ) * 100
            
          ),
          
          2
          
        )
      
    )
    
  })
  
  
  # ==========================================================
  # MODULE 2 - PREPROCESSING
  # ==========================================================
  
  processed_dataset <-
    eventReactive(
      
      input$process,
      
      {
        
        req(
          dataset()
        )
        
        d <-
          dataset()
        
        numeric_columns <-
          names(
            
            d[
              sapply(
                d,
                is.numeric
              )
            ]
            
          )
        
        
        # ----------------------------------------------------
        # REPLACE MISSING VALUES
        # ----------------------------------------------------
        
        for (
          col in numeric_columns
        ) {
          
          if (
            any(
              is.na(
                d[[col]]
              )
            )
          ) {
            
            d[[col]][
              is.na(
                d[[col]]
              )
            ] <-
              
              median(
                
                d[[col]],
                
                na.rm = TRUE
                
              )
            
          }
          
        }
        
        
        # ----------------------------------------------------
        # MIN MAX
        # ----------------------------------------------------
        
        if (
          
          input$preprocess_method ==
          
          "Min-Max Normalization"
          
        ) {
          
          for (
            col in numeric_columns
          ) {
            
            minimum <-
              min(
                d[[col]],
                na.rm = TRUE
              )
            
            maximum <-
              max(
                d[[col]],
                na.rm = TRUE
              )
            
            if (
              maximum != minimum
            ) {
              
              d[[col]] <-
                
                (
                  
                  d[[col]] -
                    minimum
                  
                ) /
                
                (
                  
                  maximum -
                    minimum
                  
                )
              
            }
            
          }
          
        }
        
        
        # ----------------------------------------------------
        # Z SCORE
        # ----------------------------------------------------
        
        if (
          
          input$preprocess_method ==
          
          "Z-Score Standardization"
          
        ) {
          
          for (
            col in numeric_columns
          ) {
            
            average <-
              mean(
                d[[col]],
                na.rm = TRUE
              )
            
            standard_deviation <-
              sd(
                d[[col]],
                na.rm = TRUE
              )
            
            if (
              standard_deviation != 0
            ) {
              
              d[[col]] <-
                
                (
                  
                  d[[col]] -
                    average
                  
                ) /
                
                standard_deviation
              
            }
            
          }
          
        }
        
        d
        
      }
      
    )
  
  
  # ==========================================================
  # MODULE 2 - PROCESSED DATA
  # ==========================================================
  
  output$processed_data <-
    renderDT({
      
      req(
        processed_dataset()
      )
      
      datatable(
        
        processed_dataset(),
        
        options = list(
          pageLength = 10,
          scrollX = TRUE
        ),
        
        filter = "top",
        
        rownames = FALSE
        
      )
      
    })
  
  
  # ==========================================================
  # MODULE 2 - BEFORE GRAPH
  # ==========================================================
  
  output$before_plot <- renderPlot({
    
    req(
      dataset()
    )
    
    ggplot(
      
      dataset(),
      
      aes(
        x = Battery
      )
      
    ) +
      
      geom_histogram(
        
        bins = 20,
        
        fill = "skyblue",
        
        color = "blue"
        
      ) +
      
      theme_minimal() +
      
      labs(
        
        title =
          "Battery Before Preprocessing",
        
        x =
          "Battery",
        
        y =
          "Frequency"
        
      )
    
  })
  
  
  # ==========================================================
  # MODULE 2 - AFTER GRAPH
  # ==========================================================
  
  output$after_plot <- renderPlot({
    
    req(
      processed_dataset()
    )
    
    ggplot(
      
      processed_dataset(),
      
      aes(
        x = Battery
      )
      
    ) +
      
      geom_histogram(
        
        bins = 20,
        
        fill = "lightgreen",
        
        color = "darkgreen"
        
      ) +
      
      theme_minimal() +
      
      labs(
        
        title =
          "Battery After Preprocessing",
        
        x =
          "Processed Battery",
        
        y =
          "Frequency"
        
      )
    
  })
  
  
  # ==========================================================
  # MODULE 2 - DOWNLOAD
  # ==========================================================
  
  output$download_processed <-
    downloadHandler(
      
      filename = function() {
        
        "Project_Horizon_Preprocessed_Dataset.csv"
        
      },
      
      content = function(file) {
        
        write.csv(
          
          processed_dataset(),
          
          file,
          
          row.names = FALSE
          
        )
        
      }
      
    )
  
  
  # ==========================================================
  # MODULE 3 - SIMULATION
  # ==========================================================
  
  simulation_data <-
    eventReactive(
      
      input$start_simulation,
      
      {
        
        set.seed(123)
        
        n <-
          input$num_drones
        
        steps <-
          input$simulation_steps
        
        target_x <-
          input$target_x
        
        target_y <-
          input$target_y
        
        current_x <-
          runif(
            n,
            5,
            25
          )
        
        current_y <-
          runif(
            n,
            5,
            25
          )
        
        result <-
          data.frame()
        
        
        for (
          step in 1:steps
        ) {
          
          for (
            drone in 1:n
          ) {
            
            old_distance <-
              
              sqrt(
                
                (
                  current_x[drone] -
                    target_x
                )^2 +
                  
                  (
                    current_y[drone] -
                      target_y
                  )^2
                
              )
            
            
            dx <-
              target_x -
              current_x[drone]
            
            dy <-
              target_y -
              current_y[drone]
            
            
            distance <-
              sqrt(
                dx^2 +
                  dy^2
              )
            
            
            if (
              distance > 0
            ) {
              
              move_x <-
                
                dx /
                distance *
                2
              
              move_y <-
                
                dy /
                distance *
                2
              
            }
            
            else {
              
              move_x <- 0
              
              move_y <- 0
              
            }
            
            
            move_x <-
              move_x +
              rnorm(
                1,
                0,
                0.5
              )
            
            move_y <-
              move_y +
              rnorm(
                1,
                0,
                0.5
              )
            
            
            current_x[drone] <-
              
              current_x[drone] +
              move_x
            
            current_y[drone] <-
              
              current_y[drone] +
              move_y
            
            
            current_x[drone] <-
              
              max(
                
                0,
                
                min(
                  100,
                  current_x[drone]
                )
                
              )
            
            
            current_y[drone] <-
              
              max(
                
                0,
                
                min(
                  100,
                  current_y[drone]
                )
                
              )
            
            
            new_distance <-
              
              sqrt(
                
                (
                  current_x[drone] -
                    target_x
                )^2 +
                  
                  (
                    current_y[drone] -
                      target_y
                  )^2
                
              )
            
            
            reward <-
              
              old_distance -
              new_distance
            
            
            if (
              new_distance < 5
            ) {
              
              reward <-
                reward +
                10
              
            }
            
            
            result <-
              
              rbind(
                
                result,
                
                data.frame(
                  
                  Step =
                    step,
                  
                  Drone =
                    drone,
                  
                  X =
                    current_x[drone],
                  
                  Y =
                    current_y[drone],
                  
                  Distance =
                    new_distance,
                  
                  Reward =
                    reward
                  
                )
                
              )
            
          }
          
        }
        
        result
        
      }
      
    )
  
  
  # ==========================================================
  # MODULE 3 - SWARM GRAPH
  # ==========================================================
  
  output$swarm_plot <-
    renderPlot({
      
      req(
        simulation_data()
      )
      
      d <-
        simulation_data()
      
      ggplot(
        
        d,
        
        aes(
          
          x = X,
          
          y = Y,
          
          group = Drone,
          
          color = factor(
            Drone
          )
          
        )
        
      ) +
        
        geom_path(
          
          linewidth = 1,
          
          alpha = 0.6
          
        ) +
        
        geom_point(
          
          size = 2
          
        ) +
        
        geom_point(
          
          data =
            data.frame(
              
              X =
                input$target_x,
              
              Y =
                input$target_y
              
            ),
          
          aes(
            x = X,
            y = Y
          ),
          
          inherit.aes =
            FALSE,
          
          color =
            "red",
          
          size =
            6,
          
          shape =
            8
          
        ) +
        
        annotate(
          
          "text",
          
          x =
            input$target_x,
          
          y =
            input$target_y + 5,
          
          label =
            "TARGET",
          
          color =
            "red",
          
          fontface =
            "bold"
          
        ) +
        
        scale_x_continuous(
          
          limits =
            c(
              0,
              100
            )
          
        ) +
        
        scale_y_continuous(
          
          limits =
            c(
              0,
              100
            )
          
        ) +
        
        theme_minimal() +
        
        labs(
          
          title =
            "Cooperative Drone Swarm Movement",
          
          x =
            "X Position",
          
          y =
            "Y Position",
          
          color =
            "Drone"
          
        )
      
    })
  
  
  # ==========================================================
  # MODULE 3 - RESULTS
  # ==========================================================
  
  output$simulation_results <-
    renderTable({
      
      req(
        simulation_data()
      )
      
      d <-
        simulation_data()
      
      final_step <-
        max(
          d$Step
        )
      
      final_data <-
        d[
          d$Step ==
            final_step,
        ]
      
      
      data.frame(
        
        Number_of_Drones =
          input$num_drones,
        
        Simulation_Steps =
          input$simulation_steps,
        
        Average_Final_Distance =
          round(
            
            mean(
              final_data$Distance
            ),
            
            2
            
          ),
        
        Total_Reward =
          round(
            
            sum(
              d$Reward
            ),
            
            2
            
          ),
        
        Average_Reward =
          round(
            
            mean(
              d$Reward
            ),
            
            2
            
          )
        
      )
      
    })
  
  
  # ==========================================================
  # MODULE 3 - REWARD GRAPH
  # ==========================================================
  
  output$reward_plot <-
    renderPlot({
      
      req(
        simulation_data()
      )
      
      d <-
        simulation_data()
      
      reward_data <-
        
        aggregate(
          
          Reward ~ Step,
          
          data = d,
          
          FUN = sum
          
        )
      
      
      ggplot(
        
        reward_data,
        
        aes(
          
          x = Step,
          
          y = Reward
          
        )
        
      ) +
        
        geom_line(
          
          linewidth =
            1.2,
          
          color =
            "blue"
          
        ) +
        
        geom_point(
          
          color =
            "red"
          
        ) +
        
        theme_minimal() +
        
        labs(
          
          title =
            "Total Reward per Simulation Step",
          
          x =
            "Simulation Step",
          
          y =
            "Total Reward"
          
        )
      
    })
  
  
  # ==========================================================
  # MODULE 4 - MARL
  # ==========================================================
  
  marl_data <-
    eventReactive(
      
      input$train_marl,
      
      {
        
        set.seed(100)
        
        n_drones <-
          input$marl_drones
        
        episodes <-
          input$marl_episodes
        
        grid <-
          input$marl_grid
        
        alpha <-
          input$learning_rate
        
        gamma <-
          input$discount_factor
        
        epsilon <-
          input$epsilon
        
        
        # Four actions:
        # 1 = UP
        # 2 = DOWN
        # 3 = LEFT
        # 4 = RIGHT
        
        q_tables <-
          vector(
            "list",
            n_drones
          )
        
        
        for (
          d in 1:n_drones
        ) {
          
          q_tables[[d]] <-
            
            matrix(
              
              0,
              
              nrow =
                grid * grid,
              
              ncol =
                4
              
            )
          
        }
        
        
        episode_rewards <-
          numeric(
            episodes
          )
        
        
        # ----------------------------------------------------
        # TRAINING
        # ----------------------------------------------------
        
        for (
          ep in 1:episodes
        ) {
          
          total_reward <-
            0
          
          
          for (
            d in 1:n_drones
          ) {
            
            x <- 1
            
            y <- 1
            
            target_x <-
              grid
            
            target_y <-
              grid
            
            
            for (
              step in 1:(grid * 3)
            ) {
              
              state <-
                
                (
                  y - 1
                ) *
                grid +
                x
              
              
              # ------------------------------------------------
              # EPSILON GREEDY
              # ------------------------------------------------
              
              if (
                runif(1) <
                epsilon
              ) {
                
                action <-
                  sample(
                    1:4,
                    1
                  )
                
              }
              
              else {
                
                action <-
                  
                  which.max(
                    
                    q_tables[[d]][
                      state,
                    ]
                    
                  )
                
              }
              
              
              old_x <- x
              
              old_y <- y
              
              
              # ------------------------------------------------
              # MOVE DRONE
              # ------------------------------------------------
              
              if (
                
                action == 1 &&
                y < grid
                
              ) {
                
                y <-
                  y + 1
                
              }
              
              
              if (
                
                action == 2 &&
                y > 1
                
              ) {
                
                y <-
                  y - 1
                
              }
              
              
              if (
                
                action == 3 &&
                x > 1
                
              ) {
                
                x <-
                  x - 1
                
              }
              
              
              if (
                
                action == 4 &&
                x < grid
                
              ) {
                
                x <-
                  x + 1
                
              }
              
              
              new_state <-
                
                (
                  y - 1
                ) *
                grid +
                x
              
              
              # ------------------------------------------------
              # DISTANCE
              # ------------------------------------------------
              
              old_distance <-
                
                sqrt(
                  
                  (
                    old_x -
                      target_x
                  )^2 +
                    
                    (
                      old_y -
                        target_y
                    )^2
                  
                )
              
              
              new_distance <-
                
                sqrt(
                  
                  (
                    x -
                      target_x
                  )^2 +
                    
                    (
                      y -
                        target_y
                    )^2
                  
                )
              
              
              # ------------------------------------------------
              # REWARD
              # ------------------------------------------------
              
              reward <-
                
                old_distance -
                new_distance
              
              
              if (
                
                x ==
                target_x &&
                
                y ==
                target_y
                
              ) {
                
                reward <-
                  reward +
                  10
                
              }
              
              
              # ------------------------------------------------
              # Q LEARNING UPDATE
              # ------------------------------------------------
              
              old_q <-
                
                q_tables[[d]][
                  state,
                  action
                ]
              
              
              max_next_q <-
                
                max(
                  
                  q_tables[[d]][
                    new_state,
                  ]
                  
                )
              
              
              q_tables[[d]][
                state,
                action
              ] <-
                
                old_q +
                
                alpha *
                
                (
                  
                  reward +
                    
                    gamma *
                    max_next_q -
                    
                    old_q
                  
                )
              
              
              total_reward <-
                
                total_reward +
                reward
              
            }
            
          }
          
          
          episode_rewards[ep] <-
            total_reward
          
        }
        
        
        # ----------------------------------------------------
        # LEARNED PATH
        # ----------------------------------------------------
        
        path_data <-
          data.frame()
        
        
        for (
          d in 1:n_drones
        ) {
          
          x <- 1
          
          y <- 1
          
          
          for (
            step in 1:(grid * 3)
          ) {
            
            path_data <-
              
              rbind(
                
                path_data,
                
                data.frame(
                  
                  Drone =
                    d,
                  
                  Step =
                    step,
                  
                  X =
                    x,
                  
                  Y =
                    y
                  
                )
                
              )
            
            
            state <-
              
              (
                y - 1
              ) *
              grid +
              x
            
            
            action <-
              
              which.max(
                
                q_tables[[d]][
                  state,
                ]
                
              )
            
            
            if (
              
              action == 1 &&
              y < grid
              
            ) {
              
              y <-
                y + 1
              
            }
            
            
            if (
              
              action == 2 &&
              y > 1
              
            ) {
              
              y <-
                y - 1
              
            }
            
            
            if (
              
              action == 3 &&
              x > 1
              
            ) {
              
              x <-
                x - 1
              
            }
            
            
            if (
              
              action == 4 &&
              x < grid
              
            ) {
              
              x <-
                x + 1
              
            }
            
          }
          
        }
        
        
        list(
          
          rewards =
            episode_rewards,
          
          paths =
            path_data
          
        )
        
      }
      
    )
  
  
  # ==========================================================
  # MODULE 4 - PATH GRAPH
  # ==========================================================
  
  output$marl_path <-
    renderPlot({
      
      req(
        marl_data()
      )
      
      d <-
        marl_data()$paths
      
      grid <-
        input$marl_grid
      
      
      ggplot(
        
        d,
        
        aes(
          
          x = X,
          
          y = Y,
          
          group = Drone,
          
          color = factor(
            Drone
          )
          
        )
        
      ) +
        
        geom_path(
          
          linewidth =
            1.2
          
        ) +
        
        geom_point(
          
          size =
            2
          
        ) +
        
        geom_point(
          
          data =
            data.frame(
              
              X =
                grid,
              
              Y =
                grid
              
            ),
          
          aes(
            
            x = X,
            
            y = Y
            
          ),
          
          inherit.aes =
            FALSE,
          
          color =
            "red",
          
          size =
            6,
          
          shape =
            8
          
        ) +
        
        theme_minimal() +
        
        labs(
          
          title =
            "Learned Multi-Agent Drone Paths",
          
          x =
            "X Position",
          
          y =
            "Y Position",
          
          color =
            "Drone"
          
        )
      
    })
  
  
  # ==========================================================
  # MODULE 4 - TRAINING REWARD
  # ==========================================================
  
  output$marl_reward <-
    renderPlot({
      
      req(
        marl_data()
      )
      
      d <-
        
        data.frame(
          
          Episode =
            seq_along(
              marl_data()$rewards
            ),
          
          Reward =
            marl_data()$rewards
          
        )
      
      
      ggplot(
        
        d,
        
        aes(
          
          x = Episode,
          
          y = Reward
          
        )
        
      ) +
        
        geom_line(
          
          color =
            "blue",
          
          linewidth =
            1
          
        ) +
        
        geom_point(
          
          color =
            "red"
          
        ) +
        
        theme_minimal() +
        
        labs(
          
          title =
            "MARL Training Reward",
          
          x =
            "Episode",
          
          y =
            "Cumulative Reward"
          
        )
      
    })
  
  
  # ==========================================================
  # MODULE 4 - RESULTS
  # ==========================================================
  
  output$marl_results <-
    renderTable({
      
      req(
        marl_data()
      )
      
      rewards <-
        marl_data()$rewards
      
      
      data.frame(
        
        Number_of_Drones =
          input$marl_drones,
        
        Training_Episodes =
          input$marl_episodes,
        
        Average_Reward =
          round(
            mean(rewards),
            2
          ),
        
        Maximum_Reward =
          round(
            max(rewards),
            2
          ),
        
        Final_Reward =
          round(
            tail(
              rewards,
              1
            ),
            2
          )
        
      )
      
    })
  
  
  # ==========================================================
  # MODULE 5 - PERFORMANCE
  # ==========================================================
  
  evaluation_data <-
    eventReactive(
      
      input$evaluate,
      
      {
        
        req(
          marl_data()
        )
        
        rewards <-
          marl_data()$rewards
        
        paths <-
          marl_data()$paths
        
        
        final_positions <-
          
          paths[
            paths$Step ==
              max(
                paths$Step
              ),
          ]
        
        
        target <-
          input$marl_grid
        
        
        successful_drones <-
          
          sum(
            
            final_positions$X ==
              target &
              
              final_positions$Y ==
              target
            
          )
        
        
        success_rate <-
          
          (
            
            successful_drones /
              input$marl_drones
            
          ) *
          
          100
        
        
        average_reward <-
          mean(
            rewards
          )
        
        
        maximum_reward <-
          max(
            rewards
          )
        
        
        average_steps <-
          mean(
            paths$Step
          )
        
        
        final_distance <-
          
          mean(
            
            sqrt(
              
              (
                
                final_positions$X -
                  target
                
              )^2 +
                
                (
                  
                  final_positions$Y -
                    target
                  
                )^2
              
            )
            
          )
        
        
        data.frame(
          
          Metric = c(
            
            "Average Reward",
            
            "Maximum Reward",
            
            "Average Steps",
            
            "Final Distance",
            
            "Success Rate (%)"
            
          ),
          
          Value = round(
            
            c(
              
              average_reward,
              
              maximum_reward,
              
              average_steps,
              
              final_distance,
              
              success_rate
              
            ),
            
            2
            
          )
          
        )
        
      }
      
    )
  
  
  # ==========================================================
  # MODULE 5 - PERFORMANCE TABLE
  # ==========================================================
  
  output$performance_table <-
    renderTable({
      
      req(
        evaluation_data()
      )
      
      evaluation_data()
      
    })
  
  
  # ==========================================================
  # MODULE 5 - REWARD GRAPH
  # ==========================================================
  
  output$performance_reward <-
    renderPlot({
      
      req(
        marl_data()
      )
      
      rewards <-
        marl_data()$rewards
      
      
      d <-
        
        data.frame(
          
          Episode =
            seq_along(
              rewards
            ),
          
          Reward =
            rewards
          
        )
      
      
      ggplot(
        
        d,
        
        aes(
          
          x = Episode,
          
          y = Reward
          
        )
        
      ) +
        
        geom_line(
          
          color =
            "blue",
          
          linewidth =
            1.2
          
        ) +
        
        theme_minimal() +
        
        labs(
          
          title =
            "Training Performance",
          
          x =
            "Episode",
          
          y =
            "Reward"
          
        )
      
    })
  
  
  # ==========================================================
  # MODULE 5 - COMPARISON GRAPH
  # ==========================================================
  
  output$performance_comparison <-
    renderPlot({
      
      req(
        evaluation_data()
      )
      
      d <-
        evaluation_data()
      
      
      ggplot(
        
        d,
        
        aes(
          
          x = Metric,
          
          y = Value,
          
          fill = Metric
          
        )
        
      ) +
        
        geom_col(
          
          color =
            "black"
          
        ) +
        
        theme_minimal() +
        
        theme(
          
          axis.text.x =
            
            element_text(
              
              angle =
                45,
              
              hjust =
                1
              
            ),
          
          legend.position =
            "none"
          
        ) +
        
        labs(
          
          title =
            "Performance Metrics",
          
          x =
            "Metric",
          
          y =
            "Value"
          
        )
      
    })
  
}


# ============================================================
# RUN APPLICATION
# ============================================================

shinyApp(
  
  ui =
    ui,
  
  server =
    server
  
)