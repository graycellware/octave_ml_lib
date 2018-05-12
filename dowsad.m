function [ Lambda, Theta ] = dowsad(data, c)

# [ Lambda, Theta ] = dowsad(data) estimates the lambda's for the rowperiods
#	and the Theta to account for changes across days of the week.
#-----------------------------------------------------------------------------
#	
#	data is a column vector
# 	c is the number of days (multiple of 7) in a row-period. That is days in
#	which lambda is assumed not to change significantly. Usually 14.
#----------------------------------------------------------------------------
if (nargin == 1)
	if (isscalar(data))
		error('Usage: dowsad(col vector, [7|14|21|28] ');
	endif
    c = 14;
endif

if (!iscolumn(data))
	data = data(:);
endif

#----------------------------------------------------------------------------
#	RECONSTRUCT	DATA
# 	Use DOW-SAD to reconstruct theta and Lambda
#	given the data. 
#-----------------------------------------------------------------------------		

# Prune data from the beginning
l = length(data);
drop = mod(l,c);
data = data((drop+1):end,1);
r = floor(l/c);
data = reshape(data,r,c);	
# [ r, c] = size(data);
rowsum = sum(data,2); 	# r x 1
colsum = sum(data,1); 	# 1 x c
			
#---------------------------------
# Initialize Theta and Lambda
#---------------------------------
Theta = ones(1,c); 		# sum(theta) = n
LambdaDS = ones(r,1);
iters = 0;
rowperiod = c/7; # = 2
	
while (iters < 3)
	thetaTemplate = zeros(1,7);
	LambdaDS = rowsum./sum(Theta);	# LambdaDS is lambda created by DOWSAD
	Theta = colsum./sum(LambdaDS);
	
	# Now, the thetas should repeat
	# Replace them with their respective Arithmetic means
		
	for ii = 1:rowperiod
		rowidx = 1+(ii-1)*7;
		thetaTemplate +=Theta(rowidx:(rowidx+6));
	endfor
		
	thetaTemplate ./= rowperiod;
	Theta = repmat(thetaTemplate,1,rowperiod);
	nConstant = c/sum(theta);	 # Normalizing constant
	Theta .*= nConstant;		 # Adjusting for computational errors
	iters++;
end
			
# Apply Linear Regression with Normal Equation for Smoothing
LSNE = polysmoothNE(LambdaDS');
ene = getesterror(LS,Lambda);

# Apply Linear Regression with Gradient Descent for Smoothing
LSGD = polysmoothGD(LambdaDS');
egd = getesterror(LS,Lambda);

# Find out which has better error -- using RMS error.
if(ene < egd)
	LS=LSNE;
else
	LS=LSGD;
endif

endfunction			
