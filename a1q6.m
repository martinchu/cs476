sigma = 0.2
r = 0.1
T = 0.5
S0 = 105
K = 102
x = 15
B = 100
sigmaTimesSqrtT = sigma * sqrt(T)
z1 = log(S0/K)/sigmaTimesSqrtT + sigmaTimesSqrtT/2
z2 = log(S0/B)/sigmaTimesSqrtT + sigmaTimesSqrtT/2
y1 = log(B^2/(S0*K))/sigmaTimesSqrtT + sigmaTimesSqrtT/2
y2 = log(B/S0)/sigmaTimesSqrtT + sigmaTimesSqrtT/2

VS0 = x*exp(-1*r*T)*normcdf(-1*z1 + sigmaTimesSqrtT)
