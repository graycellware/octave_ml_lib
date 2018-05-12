function grbf = gausskernelg(x1, x2, Gamma)

#	gausskernelg implements the gaussian radial basis function
#	it is a measure of the distance between x1 and x2, for a
#	given gamma factor
#	As exp(-t^2) moves very quickly to zero, small distnces can make a huge difference
#	gamma moderates that.

# Ensure that x1 and x2 are column vectors
x1 = x1(:); x2 = x2(:);

# x1 and x2 should have the same size
if(length(x1) != length(x2))
	error('parameters x1 and x2 of differenet lengths');
endif


# Theoretical implementation
# grbf = exp(-sum((x1 - x2).^2)*gamma);

# This is faster.
delta = x1-x2; 	# difference (vector)
delta .*= delta;	# perform the squaring (vector)
distsq = sum(delta); # delta is a column vector, so column sum gives distsq, a scalar
grbf = exp(-distsq*Gamma);
    
end
