# Theta is the vector of candidate values for the parameter theta.
# nThetaVals is the number of candidate theta vals
# to produce the examples in the book, set nThetaVals to 3 or 63

nThetaVals <- 3
# Now make the vactor of theta values
# from 1/4 to 3/4 by 1/4, when nThetaVals <- 3 
Theta <- seq(from = 1/(nThetaVals + 1), to = nThetaVals/(nThetaVals + 1), by =
            1/(nThetaVals + 1))

# pTheta is the vector of prior probabilities on the theta values
pTheta <- pmin(Theta, 1-Theta)  # makes triangular belief distribution
pTheta <- pTheta / sum(pTheta)  # makes sure they sum to 1

# Specify the data. To produce the examples in the book use either
Data <- c(1, 1, 1, rep(0, 9))
# or
# Data <- c(1, rep(0, 11))

nHeads <- sum(Data == 1)
nTails <- sum(Data == 0)

# Compute the likelihood of the data for each value of theta:
pDataGivenTheta <- Theta^nHeads * (1-Theta)^nTails

# Compute the posterior
pData = sum( pDataGivenTheta * pTheta)

# This is Bayes Rule!
pThetaGivenData <- pDataGivenTheta * pTheta / pData

# plot the results
windows(7, 10)  # create window of specified width, height inches.
layout(matrix(c(1, 2, 3), nrow=3, ncol=1, byrow=FALSE)  # 3x1 panels
