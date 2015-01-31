
function Cb = bbsm(p,lambda,alpha)
if p <= 0
    Cb = 0;
else
    Cb = pi * lambda * integral(@(r)prob(p,lambda,r,alpha),0.001,10);
end
return ;


function q = prob(p,lambda,r,alpha)
tau = 1.1;
coff_x = (1 + r.^(alpha/2));
q = tau * coff_x/p + 2*pi*pi*tau*lambda*coff_x ./ ...
    (alpha * sin(2*pi/alpha) * (tau*coff_x+1).^(1-2/alpha));
q = exp(-q);
return;