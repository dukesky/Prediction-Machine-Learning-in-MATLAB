function G = mysigmoid(U,V)
% Sigmoid kernel function with slope gamma and intercept c
gamma = 0.4;
c =5;
G = tanh(gamma*U*V' + c);
end