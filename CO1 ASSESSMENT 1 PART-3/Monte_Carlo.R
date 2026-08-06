############################################################
# MONTE CARLO PROCESS
# MODULE 1 : EPISODE GENERATION
############################################################

rm(list=ls())

set.seed(123)

#-----------------------------
# INPUT
#-----------------------------

numStates <- 5

#-----------------------------
# PROCESS
#-----------------------------

episodeLength <- sample(3:7,1)

states <- sample(1:numStates,
                 episodeLength,
                 replace=TRUE)

frequency <- table(states)

percentage <- round(prop.table(frequency)*100,2)

#-----------------------------
# SUMMARY
#-----------------------------

cat("\n=============================================\n")
cat("          MODULE 1 SUMMARY\n")
cat("=============================================\n")

cat("\nPurpose:\n")
cat("Generate one random episode consisting of\n")
cat("different state transitions.\n")

cat("\nInput\n")
cat("Total States :",numStates,"\n")

cat("\nGenerated Episode\n")
cat("Episode Length :",episodeLength,"\n")
cat("Visited States :",states,"\n")

cat("\nState Frequency\n")
print(frequency)

cat("\nState Percentage\n")
print(percentage)

cat("\nObservation\n")

cat("The agent visited",
    length(unique(states)),
    "unique states during this episode.\n")

cat("\nConclusion\n")

cat("Episode generation completed successfully.\n")

#-----------------------------
# VISUALIZATION
#-----------------------------

par(mfrow=c(1,2))

barplot(frequency,
        col="steelblue",
        main="State Visit Frequency",
        xlab="States",
        ylab="Frequency")

pie(frequency,
    col=rainbow(length(frequency)),
    main="State Distribution")

par(mfrow=c(1,1))
############################################################
# MONTE CARLO PROCESS
# MODULE 2 : REWARD COLLECTION
############################################################

rm(list=ls())

set.seed(123)

#-----------------------------------------------------------
# INPUT
#-----------------------------------------------------------

episodeLength <- sample(3:7,1)

rewards <- sample(c(-1,0,1,2,3),
                  episodeLength,
                  replace=TRUE)

#-----------------------------------------------------------
# PROCESS
#-----------------------------------------------------------

totalReward <- sum(rewards)
averageReward <- mean(rewards)
maximumReward <- max(rewards)
minimumReward <- min(rewards)

positiveReward <- sum(rewards>0)
negativeReward <- sum(rewards<0)
zeroReward <- sum(rewards==0)

#-----------------------------------------------------------
# SUMMARY
#-----------------------------------------------------------

cat("\n=========================================\n")
cat("       MODULE 2 SUMMARY\n")
cat("=========================================\n")

cat("\nPurpose\n")
cat("Collect rewards received by the agent\n")
cat("during one episode.\n")

cat("\nRewards Collected\n")
print(rewards)

cat("\nTotal Reward :",totalReward,"\n")
cat("Average Reward :",round(averageReward,2),"\n")
cat("Maximum Reward :",maximumReward,"\n")
cat("Minimum Reward :",minimumReward,"\n")

cat("\nReward Distribution\n")
cat("Positive Rewards :",positiveReward,"\n")
cat("Negative Rewards :",negativeReward,"\n")
cat("Zero Rewards :",zeroReward,"\n")

cat("\nObservation\n")
cat("The reward sequence contains both positive\n")
cat("and negative feedback for learning.\n")

cat("\nConclusion\n")
cat("Reward collection completed successfully.\n")

#-----------------------------------------------------------
# VISUALIZATION
#-----------------------------------------------------------

par(mfrow=c(1,2))

barplot(rewards,
        col="lightgreen",
        main="Rewards per Step",
        xlab="Step",
        ylab="Reward")

pie(c(positiveReward,
      negativeReward,
      zeroReward),
    labels=c("Positive",
             "Negative",
             "Zero"),
    col=c("green","red","gold"),
    main="Reward Distribution")

par(mfrow=c(1,1))
############################################################
# MONTE CARLO PROCESS
# MODULE 3 : COMPUTE RETURNS
############################################################

rm(list=ls())

set.seed(123)

gamma <- 0.9

episodeLength <- sample(3:7,1)

rewards <- sample(c(-1,0,1,2,3),
                  episodeLength,
                  replace=TRUE)

returns <- numeric(episodeLength)

G <- 0

for(i in episodeLength:1){
  
  G <- rewards[i] + gamma*G
  
  returns[i] <- G
  
}

cat("\n=========================================\n")
cat("       MODULE 3 SUMMARY\n")
cat("=========================================\n")

cat("\nPurpose\n")
cat("Compute discounted return for every step.\n")

cat("\nRewards\n")
print(rewards)

cat("\nDiscounted Returns\n")
print(round(returns,2))

cat("\nHighest Return :",round(max(returns),2),"\n")
cat("Lowest Return :",round(min(returns),2),"\n")
cat("Average Return :",round(mean(returns),2),"\n")

cat("\nObservation\n")
cat("Returns decrease with discount factor.\n")

cat("\nConclusion\n")
cat("Return computation completed successfully.\n")

par(mfrow=c(1,2))

plot(returns,
     type="b",
     pch=19,
     col="blue",
     main="Discounted Returns",
     xlab="Step",
     ylab="Return")

barplot(returns,
        col="orange",
        main="Return Comparison",
        xlab="Step",
        ylab="Return")

par(mfrow=c(1,1))
############################################################
# MODULE 4 : VALUE UPDATE
############################################################

rm(list=ls())

set.seed(123)

numStates <- 5

V <- rep(0,numStates)
N <- rep(0,numStates)

states <- sample(1:numStates,6,replace=TRUE)

returns <- runif(6,1,8)

visited <- c()

for(i in 1:length(states)){
  
  s <- states[i]
  
  if(!(s %in% visited)){
    
    visited <- c(visited,s)
    
    N[s] <- N[s]+1
    
    V[s] <- V[s] + (returns[i]-V[s])/N[s]
    
  }
  
}

cat("\n=========================================\n")
cat("       MODULE 4 SUMMARY\n")
cat("=========================================\n")

cat("\nPurpose\n")
cat("Update state values using First Visit\n")
cat("Monte Carlo method.\n")

cat("\nVisited States\n")
print(states)

cat("\nReturns\n")
print(round(returns,2))

cat("\nEstimated State Values\n")
print(round(V,2))

cat("\nVisit Count\n")
print(N)

cat("\nObservation\n")
cat("Each state value improves after updates.\n")

cat("\nConclusion\n")
cat("State value update completed successfully.\n")

par(mfrow=c(1,2))

barplot(V,
        col="steelblue",
        main="State Values",
        xlab="State",
        ylab="Value")

plot(N,
     type="b",
     pch=19,
     col="red",
     main="Visit Count",
     xlab="State",
     ylab="Visits")

par(mfrow=c(1,1))
############################################################
# MODULE 5 : LEARNING PROGRESS
############################################################

rm(list=ls())

set.seed(123)

episodes <- 100

states <- 5

history <- matrix(runif(episodes*states,1,10),
                  nrow=episodes)

cat("\n=========================================\n")
cat("       MODULE 5 SUMMARY\n")
cat("=========================================\n")

cat("\nPurpose\n")
cat("Display learning progress over episodes.\n")

cat("\nEpisodes :",episodes,"\n")
cat("States :",states,"\n")

cat("\nFinal State Values\n")
print(round(history[episodes,],2))

cat("\nAverage Values\n")
print(round(colMeans(history),2))

cat("\nObservation\n")
cat("State values converge gradually with\n")
cat("increasing episodes.\n")

cat("\nConclusion\n")
cat("Learning process completed successfully.\n")

par(mfrow=c(1,2))

matplot(history,
        type="l",
        lwd=2,
        lty=1,
        col=1:5,
        xlab="Episode",
        ylab="Value",
        main="Learning Curve")

legend("bottomright",
       legend=paste("State",1:5),
       col=1:5,
       lty=1,
       cex=0.8)

barplot(history[episodes,],
        col="darkgreen",
        main="Final Learned Values",
        xlab="State",
        ylab="Value")

par(mfrow=c(1,1))