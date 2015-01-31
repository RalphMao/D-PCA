function Cb_d = bbsm_deri(p,lambda,alpha)

Cb_d = pi * lambda / (p*p)* integral(@(r)prob_deri(p,lambda,r,alpha),0.001,5) ;
return;

function q = prob_deri(p,lambda,r,alpha)
tau = 1.1;
coff_x = (1 + r.^(alpha/2));
q = tau * coff_x/p + 2*pi*pi*tau*lambda*coff_x ./ ...
    (alpha * sin(2*pi/alpha) * (tau*coff_x+1).^(1-2/alpha));
q = exp(-q) * tau .* coff_x;
return;