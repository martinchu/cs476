randn('state',100);
T = 0.5
sigma = 0.2;
mu = 0.1
S_init = 105;
N_sim = 10000;
N = 100
delt = T/N
r = 0.1
B = 100;
drift = mu*delt;
sigma_sqrt_delta = sigma *sqrt(delt);
K = 102
S_old = zeros(N_sim, 1)
S_new = zeros(N_sim, 1)
cash_payout = 15
S_old(1:N_sim, 1) = S_init
counter = 0
for i = 1:N
%	  disp(counter)
	  randNum = normrnd(0,1,N_sim,1)
	  temp = S_old(:,1).*exp((r - sigma * sigma / 2 ) * delt + sigma_sqrt_delta * randNum)
	  temp(temp < B) = 0
	  temp = max(0.0,temp)
	  S_old(:,1) = temp
	  %counter = counter + 1
end

payout = S_old(:,1)
payout(payout > 0) = payout
simulated_price = mean(payout)
