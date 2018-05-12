function P = rayleighpdf(x,sigma)

# P = rayleighpdf(x,sigma)
# Inputs:
#	1. x is a column vector with non-negative entries
#	2. sigma is a positive scalar
# Output:
#	1. P is a column vector having the same size as x.
#		each entry of P gives the pdf of the orresponding
#		entry of x according to the Rayleigh distribution
#		characterized by sigma

sig2 = sigma*sigma;
P = (x./sig2).*exp(-(x.*x)./(2*sig2));
endfunction

