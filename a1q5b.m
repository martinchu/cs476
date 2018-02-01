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
 D = 0;
 % Dividend
 opttype = 0;
 % Option Type
 Nsteps = 50;
 % N Steps
 rho = 0

 td1 = 0.2
 td2 = 0.3

 delt = T/Nsteps;

 u = exp(sigma * sqrt(delt));
 d = 1./u;
 a = exp(r*delt);
 p = (a - d)/(u - d);

 W = S0*u.^([Nsteps:-1:0]').*d.^([0:Nsteps]');

 if(opttype == 0)
 	 W = max(W-K, 0)
  else
  	 W = max(K-W, 0)
  end
for i=Nsteps:-1:1
	if(i == td1/delt || i == td2/delt)
		S = S0*u.^([i:-1:0]').*d.^([0:i]');
		if(i==td1/delt)
			W = proporDividend(W, S, rho)
		else
			W = fixedDividend(W, S, D)
		end 
	 else
		 W = exp(-r*delt)*(p*W(2:i+1) + (1-p)*W(1:i));
	 end
end
 value = W(1);
 disp(sprintf('Tree Value: %.9g \n',value));
function W_out = fixedDividend(W, S, D)
	S_min = min(S);
	S_ex = S - D;
	S_ex = max(S_ex, S_min);
	W_out = interp1(S, W, S_ex);
 end
function W_out = proporDividend(W, S, rho)
	S_min = min(S);
	S_ex = S - S .* rho;
	S_ex = max(S_ex, S_min);
	W_out = interp1(S, W, S_ex);
end



