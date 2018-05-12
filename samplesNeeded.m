function m = samplesNeeded(g, delta, k)

# m = samplesNeeded(g, delta,k)
# Computes the least number of samples (m) needed to ensure that that the training error e
# is less than (100-delta) percent with a probability less than g.
# Inputs:
#	g: The confidence level (0,1) with which we need to predict.
#	delta: The accuracy of training
#	k: Number of hypothesis -- number of possible combinations of data

g = 1-g;
delta = 1-delta;
m = ceil((1/(2*g*g))*log(2*k/delta));

endfunction
