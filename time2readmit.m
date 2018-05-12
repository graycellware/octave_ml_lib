function lambda = time2readmit(prob,duration)

# lambda = time2readmit(prob,duration) computes the parameter for the exponential distribution
# relating time to readmit with the probability of readmission
# Given the probability of readmission (prob) for a duration (duration), time2readmit computes
# the parameter (lambda) of the probability distribution.
# Both 'prob' and 'duration' should have identical sizes
# lambda has the same size as 'prob' (or 'duration')



if ~isequal(size(prob),size(duration))
	error('Input parameters should have identical size');
endif

if any(any(prob < 0)) || any(any(prob > 1)) || iscomplex(prob)
	error('0 <= prob < 1');
endif

if any(any(duration < 0)) || iscomplex(duration)
	error('Duration should be greater than 0');
endif

lambda = -log(1-prob)./duration;
endfunction

