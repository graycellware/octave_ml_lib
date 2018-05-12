function [ Prob, Conf ] = ubayes(data, value)


numCat = 2;
N = length(data);
Prob = Conf = zeros(numCat,1);

X = (0:0.001:1); # Fine resolution

# Y is the prob distribution matrix
# Assume equally distributed
# Initialize equal probability 
Y = ones(1,length(X))./length(X);

succ = 0;
apConstant = 0.5*log(2*pi);

for expt = 1: N
	if data(expt) == value
		succ++;
	endif
	fail = expt-succ;
		
	if(expt < 800)
		normC = bincoeff(expt, succ);
		Y = normC*(X.^succ).*((1-X).^fail).*Y;
	else
		# As N goes to infinity, N!/(N-k)!.k! goes to infinty faster
		# In the expression of Y, this is scaled down by the p^(heads).(1-p)^tails terms
		# Hence computing log(normC) = log(normC)
		
		lognormC = ...
			(expt+0.5)*log(expt) -(succ+0.5)*log(succ) -(fail+0.5)*log(fail) - apConstant;
		lnY = lognormC + succ*log(X) + fail*log(1.0 -X) + log(Y);
		Y = exp(lnY);
	endif
		Y = Y./sum(Y);
endfor


[ Conf, idx ] = max(Y);
Prob = X(idx);
endfunction


