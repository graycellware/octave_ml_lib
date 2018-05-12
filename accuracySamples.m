function [gtrain gtest] = accuracySamples(m, delta, k)

# m = samplesNeeded(g, delta)
# Computes the least number of samples (m) needed to ensure that that the training error e
# is less than (100-delta) percent with a probability less than g.
# Inputs:
#	g: The confidence level (0,1) with which we need to predict.
#	delta: The accuracy of training
#	k: Number of hypothesis -- number of possible combinations of data

delta = 1-delta;
gtrain = sqrt((1/(2*m))*log(2*k/delta));
gtrain = 1-gtrain;
gtest = sqrt((1/(2*0.75*m))*log(2*k/delta));
gtest = 1- gtest;

endfunction
