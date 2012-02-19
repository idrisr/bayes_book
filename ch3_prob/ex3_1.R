setwd('/home/id/learning/bayes_book/ch3_prob')

# Goal: Toss a coin N times and compute the running proportion of heads.
N = 500	# Specify the total number of flips, denoted N.

# Generate a random sample of N flips for a fair coin (heads=1, tails=0);
# the function "sample" is part of R:
#set.seed(47405) # Uncomment to set the "seed" for the random number generator.
flipsequence = sample( x=c(0,1) , prob=c(.2,.8) , size=N , replace=TRUE )

# Just for fun plotting the normal curve 'by hand'
mu <- 0.8
var <- 0.2 * (0 - 0.8)^2 + 0.8 * (1 - 0.8)^2
sd <- sqrt(var)
x <- seq(-3*sd + mu, 3*sd + mu , by = sd/100)
px <- 1/sqrt((var*2*pi)) * exp(-((x-mu)/var)^2 / 2)
plot(x, px)

# Compute the running proportion of heads:
r = cumsum( flipsequence ) # The function "cumsum" is built in to R.
n = 1:N                    # n is a vector.
runprop = r / n            # component by component division.

# Graph the running proportion:
# To learn about the parameters of the plot function,
# type help('par') at the R command prompt.
# Note that "c" is a function in R.
plot( n , runprop , type="o" , log="x" ,
	  xlim=c(1,N) , ylim=c(0.0,1.0) , cex.axis=1.5 ,
	  xlab="Flip Number" , ylab="Proportion Heads" , cex.lab=1.5 ,
	  main="Running Proportion of Heads" , cex.main=1.5 )

# Plot a dotted horizontal line at y=.5, just as a reference line:
lines( c(1,N) , c(.8,.8) , lty=3 )

# Display the beginning of the flip sequence. 

# changing from numbers to letters is a bit mysterious, but I think I get
# it for the most part
flipletters = paste( c("T","H")[ flipsequence[ 1:10 ] + 1 ] , collapse="" )
displaystring = paste( "Flip Sequence = " , flipletters , "..." , sep="" )
text( 5 , .9 , displaystring , adj=c(0,1) , cex=1.3 )

# Display the relative frequency at the end of the sequence.
text( N , .3 , paste("End Proportion =",runprop[N]) , adj=c(1,0) , cex=1.3 )

# Save the plot to an EPS file.
dev.copy2eps( file = "ex3_1.eps" )
