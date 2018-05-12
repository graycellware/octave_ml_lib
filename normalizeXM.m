function X = normalizeXM(X, metaData)

#	normalizeXM(X) takes as input a matrix X
#	returns the normalized version in X (-1 < X < 1)
#	X is an m x n matrix, metaData is a 2 x n matrix
#	The max and min values for each column of X is given in metaData
#	metaData(1,:) gives the cluster id for each column of X
#	metaData(2,:) gives the MIN value for each column of X
#	metaData(3,:) gives the MAX value for each column of X

RCOL = 0;

[ m, n ] = size(X);

MIN = metaData(2,:);
MAX = metaData(3,:);
DIFF = MAX - MIN;

if any(find(DIFF(:,2:end) == 0)) # We allow all 1's in first column for logistic regression
	error('MetaData: Min and Max values cannot be the same');
endif

x0 = X(:,1); # First column of X
Q = x0 ==1;

if (sum(Q) == length(Q)) # implies first column has all 1's.
	X = X(:,2:end);
	DIFF = DIFF(:,2:end);
	MIN = MIN(:,2:end);
	RCOL =1;
endif

MIN = repmat(MIN,m,1);
DIFF = repmat(DIFF,m,1);
X = (X - MIN)./DIFF; # 0 < X < 1
X = X+X - 1; # -1 < X < 1

if RCOL
	X = [ x0, X ];
endif

endfunction
