function [ mu, sigma ] = normfit( v1, v2, p1, p2 )

#	normFit fits a normal curve with parameters mu and sigma 
#	over the interval (v1, v2) such that v1 is at the cdf p1
#	and v2 at p2. v1 < v2, p1 < p2

	if (v2 < v1) || (p2 < p1)
		error('Invalid parameters: Necessary p1 < p2, v1 < v2');
	endif
	
	if (p1 > 1) || (p2 > 1) || (p1 < 0) || (p2 < 0)
		error('0 < p1,p2 < 1');
	endif
	
	a1 = norminv(p1);
	a2 = norminv(p2);
	
	M = [ a1 1; a2 1 ];
	V = [ v1 v2 ]';
	A = pinv(M)*V;
	mu = A(2);
	sigma = A(1);
end


		
		
		
		
		
		
		
	
	
