function A = hamdist(X)
 [m,n] = size(X); # features are in columns
 A = zeros(m,m);
 for k = 1:m
 	for l = 1:m
 		A(k,l) = n - sum(X(k,:) == X(l,:));
 	endfor
 endfor
endfunction
