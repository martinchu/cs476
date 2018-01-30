SO = 100;
K = 100;
T = 1.0;
r = .02;
sigma = .3;
opttype = 1;
Nsteps = 10000

delt = T/Nsteps;

u = exp(sigma * sqrt(delt));
d = 1./u;
a = exp(r*delt)
p = (a -d )/(u-d);

W = zeros(Nsteps + 1, 1)

for j=0:Nsteps
  W(j+1, 1) = SO*u^(j)*d^(Nsteps - j)
end
