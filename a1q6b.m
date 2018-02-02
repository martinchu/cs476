T = 0.5 % Time to Expiry
sigma = 0.2; % sigma
mu = 0.1 % drift term
S_init = 105; % initial stock price
N_sim = 10000; % number of simulations
N = 100 % timesteps
delt = T/N % delta
r = 0.1 % risk-free rate
B = 100; % Barrier
drift = mu*delt; % drift
sigma_sqrt_delta = sigma *sqrt(delt); % pre-calculated term
K = 102 % Strike Price
S_old = zeros(N_sim, 1) % Stock Price Matrix
cash_payout = 15 % cash payout at the expiry of the option
S_old(1:N_sim, 1) = S_init
% set the entire matrix to be
%initial stock price
for i = 1:N
	  randNum = normrnd(0,1,N_sim,1)
	  % create N_sim number of normal random variables
	  temp = S_old(:,1).*exp((r - sigma * sigma / 2 ) * delt + sigma_sqrt_delta * randNum)
	  % simulate the stock price with the provided formula
	  temp(temp < B) = 0
% if the price is lower than the barrier, then the stock price is 0 (so the simulated final price will be 0)

	  temp = max(0.0,temp)
	% making sure the stock price is non-negative
	  S_old(:,1) = temp
     % replace the S_old matrix with the temp matrix
end

% once the simulation is over, copy the simulated final price to payout matrix
payout = S_old(:,1)
% if the stock price is above K, no payout is given
payout(payout > K) = 0
% the rest of the price should be offer the cash payout
payout(payout > 0) = cash_payout
% the mean of the matrix should represent the value of the option
simulated_price = exp(T * r) * mean(payout)
