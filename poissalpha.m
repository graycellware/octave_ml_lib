function a = poissalpha(p,lambda)

# a = poissalpha(p,lambda)
# computes the value of 'a' given a Poisson distribution with parameter lambda
# and a probability value of 'p', such that cdf(x=a, x~Poiss(lambda)) = p, 0 \le p \le 1
# that is, p in [0,1]

	
	if (p < 0) || (p > 1)
		error('Invalid value for probability p. Range: p in [0,1]');
	endif
	
	if (p == 0)
		a = NaN;
		return;
	endif
	
	if (p == 1)
		a = Inf;
		return;
	endif
	
	err = 1e-10;
	LOW_A = 0;
	HIGH_A = Err = 2.5*lambda;
	aprev = 0;
	a = 0.5*(LOW_A + HIGH_A);
	
	while (abs(Err) > err) && (aprev != a)
		pest = poisscdf(a,lambda);
		Err = p-pest;
		
		if (Err < 0)
			HIGH_A = a;			
		else
			LOW_A = a;
		endif
		aprev = a;
		a = 0.5*(LOW_A + HIGH_A);
	end
end
			
