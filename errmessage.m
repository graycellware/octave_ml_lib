function errmessage
	
	fprintf('Need stratification data as .mat file');
	fprintf('... and should contain a matrix called data');
	fprintf('last column of data should contain outcomes');
	fprintf('the other columns contain the feature vectors');
	fprintf('Data records are row-wise');
endfunction
