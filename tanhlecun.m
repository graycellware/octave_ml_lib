function prob = tanhlecun(z)

prob = 1.7159*tanh(2.0*z/3.0);

## attention with critical values ==> infinite values
## must be set to 1
idx = find(!finite(prob));
prob(idx) = sign(z(idx));

end
