sigma = 0.2
r = 0.1
T = 0.5
K = 102
x = 15
B = 100
S = 100:2:120
sigmaTimesSqrtT = sigma * sqrt(T)
z1 = log(S/K)/sigmaTimesSqrtT + sigmaTimesSqrtT/2
z2 = log(S/B)/sigmaTimesSqrtT + sigmaTimesSqrtT/2
y1 = log(B^2./(S*K))/sigmaTimesSqrtT + sigmaTimesSqrtT/2
y2 = log(B./S)/sigmaTimesSqrtT + sigmaTimesSqrtT/2

VS0 = x*exp(-1*r*T)*(normcdf(-1*z1 + sigmaTimesSqrtT) - normcdf(-1*z2 + sigmaTimesSqrtT) + (S/B).*normcdf(y1 - sigmaTimesSqrtT)+ (S/B) .* normcdf(y2 - sigmaTimesSqrtT))
plot(S,VS0)
