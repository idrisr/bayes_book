# Consider a spinner with a [0,1] scale on its circumfrence. Suppose that the
# spinner is biased, such that its prob density function is p(x) = 6x(1-x) over
# the interval [0,1]



# Graph of above probability density function, with comb of intervals.
xlow  = 0 # Specify low end of x-axis.
xhigh = 1 # Specify high end of x-axis.
dx = 0.02                 # Specify interval width on x-axis

# Specify comb points along the x axis:
x = seq( from = xlow , to = xhigh , by = dx )

# Compute y values, i.e., probability density at each value of x:
y = (6 * x) * (1 - x)

# Plot the function. "plot" draws the intervals. "lines" draws the bell curve.
plot( x , y , type="h" , lwd=1 , cex.axis=1.5
	, xlab="x" , ylab="p(x)" , cex.lab=1.5
	, main="Spinner Density Curve" , cex.main=1.5 )
lines( x , y )

# Approximate the integral as the sum of width * height for each interval.
# Exact integral of 6x(1-x) = 6(x - x^2)-> integral= 6(x^2/2 -x^3/3), from 1 to 0
# = 6[(1/2 - 1/3) - (0)] = 6(1/6)=1
area = sum( dx * y )

# Display info in graph


# Save the plot to an EPS file.
# dev.copy2eps( file = "IntegralOfDensity.eps" )
