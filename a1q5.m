 S0 = 105;
 % 
 K = 100;
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
 Nsteps = 160;
 % N Steps
 priori = 0

 delt = T/Nsteps;

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
	 W = exp(-r*delt)*(p*W(2:i+1) + (1-p)*W(1:i));
 end
 
 value = W(1);

 disp(sprintf('Tree Value: %.9g \n',value));

