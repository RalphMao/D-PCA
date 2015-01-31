function cost = bbsm_loss(x,lambda,lambda_user, alpha,p_t)

coeff = x(end);
cost = zeros(size(x));
lambda_user = lambda_user / sum(lambda_user);
for i=1:length(cost)-1
    cost(i) = lambda_user(i) * bbsm_deri(x(i),lambda(i),alpha) +coeff*lambda(i);
end
cost(end) = sum(x(1:end-1).*lambda)-p_t-coeff;

return;

