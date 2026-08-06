install.packages("igraph")
library(igraph)
ls()
transition <- data.frame(
  CurrentState=c("S1","S1","S1","S1",
                 "S2","S2","S2","S2",
                 "S3","S3","S3","S3"),
  Action=c("A1","A2","A1","A2",
           "A1","A2","A1","A2",
           "A1","A2","A1","A2"),
  NextState=c("S2","S2","S3","S3",
              "S1","S1","S3","S3",
              "S1","S1","S2","S2"),
  Probability=c(0.6,0.4,0.2,0.8,
                0.7,0.3,0.5,0.5,
                0.9,0.1,0.4,0.6)
)
library(igraph)
g <- graph_from_data_frame(
  transition[, c("CurrentState", "NextState")],
  directed = TRUE
)
plot(
  g,
  vertex.color = "skyblue",
  vertex.size = 35,
  vertex.label.cex = 1.2,
  edge.color = "red",
  edge.arrow.size = 0.6,
  main = "Markov Decision Process"
)
ls()
library(igraph)

edges <- data.frame(
  from = transition$CurrentState,
  to = transition$NextState,
  label = transition$Action
)

g <- graph_from_data_frame(edges, directed = TRUE)

plot(
  g,
  edge.label = E(g)$label,
  edge.label.cex = 0.8,
  vertex.color = "skyblue",
  vertex.size = 35,
  edge.color = "red",
  edge.arrow.size = 0.6,
  main = "Markov Decision Process"
)
##################################################
# MARKOV DECISION PROCESS (MDP)
##################################################

#############################
# MODULE 1
#############################

states <- c("S1","S2","S3")
actions <- c("A1","A2")

cat("Number of States:",length(states),"\n")
cat("Number of Actions:",length(actions),"\n")

cat("\nStates\n")
print(states)

cat("\nActions\n")
print(actions)

transition <- data.frame(
  CurrentState=c("S1","S1","S1","S1",
                 "S2","S2","S2","S2",
                 "S3","S3","S3","S3"),
  
  Action=c("A1","A2","A1","A2",
           "A1","A2","A1","A2",
           "A1","A2","A1","A2"),
  
  NextState=c("S2","S2","S3","S3",
              "S1","S1","S3","S3",
              "S1","S1","S2","S2"),
  
  Probability=c(0.6,0.4,0.2,0.8,
                0.7,0.3,0.5,0.5,
                0.9,0.1,0.4,0.6)
)

reward <- data.frame(
  CurrentState=c("S1","S1","S1","S1",
                 "S2","S2","S2","S2",
                 "S3","S3","S3","S3"),
  
  Action=c("A1","A2","A1","A2",
           "A1","A2","A1","A2",
           "A1","A2","A1","A2"),
  
  NextState=c("S2","S2","S3","S3",
              "S1","S1","S3","S3",
              "S1","S1","S2","S2"),
  
  Reward=c(5,10,-1,-5,
           3,7,2,1,
           4,6,0,-2)
)

cat("\nTransition Probabilities\n")
print(transition)

cat("\nReward Table\n")
print(reward)

#############################
# MODULE 2
#############################

A1 <- matrix(c(
  0,0.6,0.2,
  0.7,0,0.5,
  0.9,0.4,0
),3,3,byrow=TRUE)

rownames(A1)=states
colnames(A1)=states

cat("\nTransition Matrix for A1\n")
print(A1)

A2 <- matrix(c(
  0,0.4,0.8,
  0.3,0,0.5,
  0.1,0.6,0
),3,3,byrow=TRUE)

rownames(A2)=states
colnames(A2)=states

cat("\nTransition Matrix for A2\n")
print(A2)

#############################
# MODULE 3
#############################

cat("\nReward Matrix/Table\n")
print(reward)

#############################
# MODULE 4
#############################

eir <- merge(transition,reward)

eir$ExpectedReward <- eir$Probability * eir$Reward

cat("\nExpected Reward Calculation\n")
print(eir)

summary_table <- aggregate(ExpectedReward~CurrentState+Action,
                           data=eir,
                           sum)

cat("\nExpected Immediate Reward\n")
print(summary_table)

#############################
# MODULE 5
#############################

cat("\nSummary Table\n")
print(summary_table)

overall_summary <- sum(summary_table$ExpectedReward)

cat("\nOverall Summary Value =",overall_summary,"\n")

library(igraph)

edges <- data.frame(
  from=transition$CurrentState,
  to=transition$NextState,
  label=transition$Action
)

g <- graph_from_data_frame(edges,directed=TRUE)

plot(
  g,
  vertex.color="skyblue",
  vertex.size=35,
  vertex.label.cex=1.2,
  edge.color="red",
  edge.label=E(g)$label,
  edge.label.color="blue",
  edge.label.cex=0.9,
  edge.arrow.size=0.6,
  main="Markov Decision Process"
)
#############################
# MODULE 5
#############################

cat("\nSummary Table\n")
print(summary_table)

overall_summary <- sum(summary_table$ExpectedReward)

cat("\nOverall Summary Value =", overall_summary, "\n")

library(igraph)

# Create edge labels with Action and Probability
edges <- data.frame(
  from = transition$CurrentState,
  to = transition$NextState,
  label = paste(transition$Action,
                "\nP=", transition$Probability,
                sep="")
)

g <- graph_from_data_frame(edges, directed = TRUE)

# Plot graph
plot(
  g,
  vertex.color = "skyblue",
  vertex.frame.color = "darkblue",
  vertex.size = 35,
  vertex.label.cex = 1.2,
  vertex.label.color = "black",
  edge.color = "red",
  edge.width = 2,
  edge.arrow.size = 0.6,
  edge.label = E(g)$label,
  edge.label.color = "blue",
  edge.label.cex = 0.8,
  main = "Markov Decision Process"
)

# Add legend
legend(
  "topleft",
  legend = c(
    "Blue Circle : State",
    "Red Arrow : Transition",
    "Blue Label : Action & Probability"
  ),
  col = c("skyblue", "red", "blue"),
  pch = c(19, NA, NA),
  lty = c(NA, 1, NA),
  lwd = c(NA, 2, NA),
  bty = "n",
  cex = 0.9
)
#############################################################
# MARKOV DECISION PROCESS (MDP)
#############################################################

#############################
# MODULE 1
#############################

states <- c("S1","S2","S3")
actions <- c("A1","A2")

cat("Number of States :", length(states), "\n")
cat("Number of Actions:", length(actions), "\n\n")

cat("States:\n")
print(states)

cat("\nActions:\n")
print(actions)

# Transition Probabilities
transition <- data.frame(
  CurrentState=c("S1","S1","S1","S1",
                 "S2","S2","S2","S2",
                 "S3","S3","S3","S3"),
  
  Action=c("A1","A2","A1","A2",
           "A1","A2","A1","A2",
           "A1","A2","A1","A2"),
  
  NextState=c("S2","S2","S3","S3",
              "S1","S1","S3","S3",
              "S1","S1","S2","S2"),
  
  Probability=c(0.6,0.4,0.2,0.8,
                0.7,0.3,0.5,0.5,
                0.9,0.1,0.4,0.6)
)

cat("\nTransition Probabilities\n")
print(transition)

# Rewards
reward <- data.frame(
  CurrentState=c("S1","S1","S1","S1",
                 "S2","S2","S2","S2",
                 "S3","S3","S3","S3"),
  
  Action=c("A1","A2","A1","A2",
           "A1","A2","A1","A2",
           "A1","A2","A1","A2"),
  
  NextState=c("S2","S2","S3","S3",
              "S1","S1","S3","S3",
              "S1","S1","S2","S2"),
  
  Reward=c(5,10,-1,-5,
           3,7,2,1,
           4,6,0,-2)
)

cat("\nReward Table\n")
print(reward)

#############################################################
# MODULE 2
#############################################################

A1 <- matrix(c(
  0,0.6,0.2,
  0.7,0,0.5,
  0.9,0.4,0
),3,3,byrow=TRUE)

rownames(A1) <- states
colnames(A1) <- states

cat("\nTransition Matrix for Action A1\n")
print(A1)

A2 <- matrix(c(
  0,0.4,0.8,
  0.3,0,0.5,
  0.1,0.6,0
),3,3,byrow=TRUE)

rownames(A2) <- states
colnames(A2) <- states

cat("\nTransition Matrix for Action A2\n")
print(A2)

#############################################################
# MODULE 3
#############################################################

cat("\nReward Matrix\n")
print(reward)

#############################################################
# MODULE 4
#############################################################

eir <- merge(transition,reward)

eir$ExpectedReward <- eir$Probability * eir$Reward

cat("\nExpected Reward Calculation\n")
print(eir)

summary_table <- aggregate(
  ExpectedReward ~ CurrentState + Action,
  data=eir,
  sum)

cat("\nExpected Immediate Reward\n")
print(summary_table)

#############################################################
#############################
# MODULE 5
#############################

cat("\nSummary Table\n")
print(summary_table)

overall_summary <- sum(summary_table$ExpectedReward)
cat("\nOverall Summary Value =", overall_summary, "\n")

# Best Action for each state
best_action <- do.call(rbind,
                       lapply(split(summary_table, summary_table$CurrentState),
                              function(x) x[which.max(x$ExpectedReward), ]))

cat("\nBest Action for Each State\n")
print(best_action)

library(igraph)

edges <- data.frame(
  from = transition$CurrentState,
  to = transition$NextState,
  label=paste0(
    transition$Action,
    "\nP=",
    transition$Probability
  )
)

g <- graph_from_data_frame(edges, directed = TRUE)

layout1 <- matrix(c(
  0,1,
  1,1,
  0.5,0
), ncol=2, byrow=TRUE)

plot(
  g,
  layout=layout1,
  vertex.color="skyblue",
  vertex.frame.color="darkblue",
  vertex.size=40,
  vertex.label.cex=1.3,
  vertex.label.color="black",
  edge.color="red",
  edge.width=2,
  edge.curved=0.25,
  edge.label=E(g)$label,
  edge.label.cex=1,
  edge.label.color="blue",
  edge.arrow.size=0.6,
  main="Markov Decision Process"
)

legend(
  "bottomleft",
  legend=c("State","Transition","Action"),
  pch=c(19,NA,NA),
  col=c("skyblue","red","blue"),
  lty=c(NA,1,NA),
  lwd=c(NA,2,NA),
  bty="n"
)

cat("\n=============================\n")
cat("OPTIMAL POLICY\n")
cat("=============================\n")

for(i in 1:nrow(best_action))
{
  cat(best_action$CurrentState[i],
      " --> ",
      best_action$Action[i],
      " (Expected Reward = ",
      best_action$ExpectedReward[i],")\n",sep="")
}
