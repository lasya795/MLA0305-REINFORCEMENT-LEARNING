install.packages("mclust")
install.packages("MASS")

library(mclust)
library(MASS)
set.seed(123)

initial_data <- data.frame(
  
  Open_Price = runif(1000,100,500),
  
  High_Price = runif(1000,105,550),
  
  Low_Price = runif(1000,80,490),
  
  Close_Price = runif(1000,90,520),
  
  Trading_Volume = sample(seq(1000,100000,1000),1000,replace=TRUE),
  
  Portfolio_Value = runif(1000,50000,500000),
  
  Cash_Balance = runif(1000,10000,100000),
  
  Daily_Return = runif(1000,-5,5)
  
)

head(initial_data)
gmm_model <- Mclust(initial_data)

summary(gmm_model)
install.packages("mclust")
library(mclust)
search()
gmm_model <- Mclust(initial_data)

summary(gmm_model)
# Number of records
n <- 1000

# Select GMM component
component <- sample(
  1:gmm_model$G,
  n,
  replace = TRUE,
  prob = gmm_model$parameters$pro
)

# Empty matrix
synthetic_data <- matrix(
  NA,
  nrow = n,
  ncol = ncol(initial_data)
)

# Generate synthetic data
for(i in 1:n){
  
  k <- component[i]
  
  mu <- gmm_model$parameters$mean[,k]
  
  sigma <- gmm_model$parameters$variance$sigma[,,k]
  
  synthetic_data[i,] <- MASS::mvrnorm(
    1,
    mu = mu,
    Sigma = sigma
  )
  
}

# Convert to data frame
synthetic_data <- as.data.frame(synthetic_data)

# Column names
colnames(synthetic_data) <- names(initial_data)
synthetic_data$Open_Price <- round(pmax(synthetic_data$Open_Price,100),2)

synthetic_data$High_Price <- round(pmax(synthetic_data$High_Price,
                                        synthetic_data$Open_Price),2)

synthetic_data$Low_Price <- round(pmin(synthetic_data$Low_Price,
                                       synthetic_data$Open_Price),2)

synthetic_data$Close_Price <- round(pmax(synthetic_data$Close_Price,90),2)

synthetic_data$Trading_Volume <- round(abs(synthetic_data$Trading_Volume))

synthetic_data$Portfolio_Value <- round(abs(synthetic_data$Portfolio_Value),2)

synthetic_data$Cash_Balance <- round(abs(synthetic_data$Cash_Balance),2)

synthetic_data$Daily_Return <- round(synthetic_data$Daily_Return,2)
synthetic_data$Trading_Signal <- ifelse(
  synthetic_data$Daily_Return > 1,
  "BUY",
  ifelse(
    synthetic_data$Daily_Return < -1,
    "SELL",
    "HOLD"
  )
)
write.csv(
  synthetic_data,
  "stock_dataset.csv",
  row.names = FALSE
)

cat("Dataset generated successfully!\n")

head(synthetic_data)
dataset <- read.csv("stock_dataset.csv")

head(dataset)

str(dataset)

summary(dataset)
colSums(is.na(dataset))
sum(duplicated(dataset))
dataset$Trading_Signal <- ifelse(dataset$Trading_Signal=="BUY",1,
                                 ifelse(dataset$Trading_Signal=="SELL",-1,0))
normalize <- function(x){
  (x-min(x))/(max(x)-min(x))
}

dataset[,1:8] <- lapply(dataset[,1:8], normalize)
head(dataset)

summary(dataset)
colMeans(dataset[,1:8])
apply(dataset[,1:8],2,median)
apply(dataset[,1:8],2,sd)
cor(dataset[,1:8])
summary(dataset)
hist(dataset$Close_Price,
     main="Distribution of Closing Price",
     xlab="Closing Price",
     col="lightblue",
     border="black")
boxplot(dataset$Daily_Return,
        main="Daily Return",
        col="orange",
        horizontal=TRUE)
plot(dataset$Open_Price,
     dataset$Close_Price,
     main="Open Price vs Close Price",
     xlab="Open Price",
     ylab="Close Price",
     pch=19,
     col="blue")
plot(dataset$Close_Price,
     type="l",
     col="red",
     lwd=2,
     main="Closing Price Trend",
     xlab="Trading Day",
     ylab="Close Price")
install.packages("corrplot")
library(corrplot)
corrplot(
  cor(dataset[,1:8]),
  method="color",
  tl.col="black",
  tl.srt=45
)
actions <- c(
  "BUY",
  "SELL",
  "HOLD"
)

actions
states <- dataset[, c(
  "Open_Price",
  "Close_Price",
  "Portfolio_Value",
  "Cash_Balance",
  "Daily_Return"
)]

head(states)
cash <- 100000

shares <- 0

portfolio_value <- cash
reward_function <- function(action, daily_return){
  
  if(action=="BUY"){
    
    return(daily_return*10)
    
  }
  
  if(action=="SELL"){
    
    return(-daily_return*5)
    
  }
  
  return(0)
  
}
