function y = relabelClass(x)

# 	SVM requires classes to be labeled -1 instead of 0 for binary classification.
#	relabelClass(x) takes as input a class vector x (containing 0's and 1's) and replaces the 
#	0's with -1, returning it as y.

y = ones(size(x));
y = x + x - y;

end;




