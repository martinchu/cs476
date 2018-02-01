 S0 = 105;
 % 
 K = 105;
 % Strike Price
 T = 0.5;
 % Time to expiry
 r = .1;
 % risk-free interest rate
 sigma = .2;
 % sigma
 D = 0.5;
 % Fixed Dividend
 opttype = 0;
 % Option Type
 Nsteps = 50;
 % N Steps
 rho = 0.1;
 % proportional dividend
 delt = T/Nsteps;
 % delta (the duration of each time step)
 td1 = 0.2;
 % when the 
 td2 = 0.3;
 u = exp(sigma * sqrt(delt));
 d = 1./u;
 a = exp(r*delt);
 p = (a - d)/(u - d);

 W = S0*d.^([Nsteps:-1:0]').*u.^([0:Nsteps]');
if(opttype == 0)
	 W = max(W-K, 0)
 else
	 W = max(K-W, 0)
 end

 for i=Nsteps:-1:1
	 if (i == td1/delt)
		 S_td1 = S0*d.^([i:-1:0]').*u.^([0:i]');
		 W = propDiv(W, S_td1, rho)
	 elseif (i == td2/delt)
		 S_td2 = S0*d.^([i:-1:0]').*u.^([0:i]');
		 W = fixedDiv(W, S_td2, D)
	 end
	 W = exp(-r*delt)*(p*W(2:i+1) + (1-p)*W(1:i)); 
 end
 
 value = W(1);

 disp(sprintf('Tree Value: %.9g \n',value));


function W_out = propDiv(W, S, rho)
	 S_min = min(S)
	 D = S * rho
	 S_ex = S - D
	 S_ex = max(S_ex, S_min)
	 W_out = interp1(S, W, S_ex)
 end

function W_out = fixedDiv(W, S, D)
 	S_min = min(S)
	S_ex = S - D
	S_ex = max(S_ex, S_min)
	W_out = interp1(S, W, S_ex)
end


