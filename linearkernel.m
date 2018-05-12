function lbf = linearkernel(x1, x2)

#   lbf = linearkernel(x1, x2) returns the sum of the elementwise
#   dot products lbf = sum_{i=1 to m} x1i.x2i	

# Ensure that x1 and x2 are column vectors
x1 = x1(:); x2 = x2(:);

# x1 and x2 should have the same size
if(length(x1) != length(x2))
	error('parameters x1 and x2 of differenet lengths');
endif

# Theoretical implementation -- slow
# lbf = x1' * x2;  

# faster computation
lbf = sum(x1.*x2);

end
