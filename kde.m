function v = kde(data, lspace, optsig)
# Imlements kernel density estimation
# Generating the density (using an Gaussian kernel.) 
# Setting the parameters.
	n = length(data); # Data is univariate
	stdX = std(data);
	
	p = ones(n,1); fld = p*lspace;
	# optsig = 1.06*stdX*(n^(-0.2));
	#optsig = 0.5;
	for ii = 1:n
		fld(ii,:) = normpdf(lspace,data(ii),optsig);
	endfor
	v = sum(fld,1);
endfunction
