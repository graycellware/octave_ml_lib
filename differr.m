function [ offset, sigmaLevel, minError ] = differr(x,y)

# 	Given two column vectors x, y, where length(x) > length(y), 
# 	[ offset, sigmaLevel, minError ] = differr(x,y) returns the offset from 1 at which
#	y has minimum least squared error w.r.t x, and sigmaLevel returns the
# 	distance in terms of sigma that the error is at offest below the mean square error.
# 	Starting from offset to offset+length(y)+1, x() has minimum error.

ly = length(y);
lx = length(x);
if (lx < ly)
	error(' Length of vector x is required to be longer than length of vector y');
endif


diffLength = lx+1 -ly;
mseVector = zeros(diffLength,1);


for offset = 1:diffLength
	mseVector(offset) = mean((x(offset:(offset+ly-1))-y).^2); # mean square error
endfor
[ minError, offset ] = min(mseVector);
meanErr = mean(mseVector);
stdErr = std(mseVector);
sigmaLevel = (meanErr - minError)/stdErr;

#---------------------------------------------------
# Remove multi-line comments to plot
#---------------------------------------------------
#{
X = (1:length(mseVector));
plot(X,mseVector,'-r', 'linewidth', 3);
xlabel('Offset');
ylabel('Mean Square Error');
print('differr.png');
#}
#---------------------------------------------------
end

