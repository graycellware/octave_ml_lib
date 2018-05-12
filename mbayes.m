function [ Prob, Conf, Cat ] = mbayes(data)

# [ Prob, Conf, Cat ] = mbayes(data) implements MULTINOMIAL Bayesian 
# Input: A column vector
# Output: For each category in data, compute the probability of occurrence and confidence level
#	If the number of unique categories in data is n, then
#	Cat is a 1 x n vector listing the unique categories
#	Prob is a 1 x n vector such that Prob(i) is the probability of occurrence of Cat(i)
#	Conf is a 1 x n vector such that Conf(i) is the confidence level in assigning 
#	probability of occurrence of Cat(i) as Prob(i)

Cat = unique(data);
numCat = length(Cat);
N = length(data);
Prob = Conf = zeros(numCat,1);

X = (0:0.001:1); # Fine resolution

# Y is the prob distribution matrix
# Assume equally distributed
# Initialize equal probability 
Y = ones(numCat,length(X))./length(X);

eventCount = zeros(1,numCat);
event = 0;
apConstant = 0.5*log(2*pi);

for expt = 1: N
	idx = find(Cat == data(expt));
	eventCount(idx)++;
	
	for jj = 1:numCat
		succ = eventCount(jj);
		fail = expt-succ;
		
		if(expt < 800)
			normC = bincoeff(expt, succ);
			Y(jj,:) = normC*(X.^succ).*((1-X).^fail).*Y(jj,:);
		else
			
			# As N goes to infinity, N!/(N-k)!.k! goes to infinty faster
			# In the expression of Y, this is scaled down by the p^(heads).(1-p)^tails terms
			# Hence computing log(normC) = log(normC)
		
			lognormC = ...
				(expt+0.5)*log(expt) -(succ+0.5)*log(succ) -(fail+0.5)*log(fail) - apConstant;
			lnY = lognormC + succ*log(X) + fail*log(1.0 -X) + log(Y(jj,:));
			Y(jj,:) = exp(lnY);
		endif
		Y(jj,:) = Y(jj,:)./sum(Y(jj,:));
	endfor
end

for ii = 1:numCat
	[Conf(ii), idx ] = max(Y(ii,:));
	Prob(ii) = X(idx);
endfor


