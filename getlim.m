function [low, high ] = getlim(data)

#	[low, high ] = getlim(data) fits a normal distribution
#	between the max and min values of the data given.
#	It then returns the values at 3-sigma distance away
#	from the computed mean (mu).
#	low is 3-sigma to the left of mu; high is 3-sigma to the
#	right of mu.
#	mu = (high+low)/2; sigma = (high-low)/6;

	minX = min(data);
	maxX = max(data);
	mu = (maxX+minX)*0.5;
	sigma = (mu -minX)*0.5;
	low = mu - sigma*3;
	high = mu + sigma*3;
	
endfunction
