function a = normalpha(p)

# a = getalpha(p)
# computes the value of 'a' given a normal distribution mu =0, sigma =1
# and a probability value of 'p', such that cdf(x=a, x~N(0,1)) = p, p in [0,1]


	if (p < 0) || (p > 1)
		error('Invalid value for probability p. Range: p in [0,1]');
	endif
	
	if (p == 0)
		a = -Inf;
		return;
	endif
	
	if (p == 1)
		a = Inf;
		return;
	endif
	err = 1e-10;
	Err = 10000;
	alow = -8;
	ahigh = -alow;
	
	
	# inverf = inline('0.5*(erf(x)+1)','x');
	while (abs(Err) > err)
		a = 0.5*(alow+ahigh);
		#pest = inverf(a);
		pest = normcdf(a);
		Err = p-pest;
		
		if (Err > 0)
			alow = a;			
		else
			ahigh = a;
		endif
	end
end
			
