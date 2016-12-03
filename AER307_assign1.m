pu = 0.6*10^5;
pl = 1.9*10^5;
pb = 0.4*10^5;



rhoinf = 0.75

pinf = 1.4;
gamma = 1.4;

sound = sqrt(gamma*(pinf/rhoinf));
mach =1.4;
uinf = sound*mach;
qinf = (1/2)*rhoinf*uinf^2;

c = 5;
t = 6;
p = 90-t;
a = 10;

tu = 0;
tl = 0;

h = sind(t)*c/sind(p);
hyp = sqrt(c^2 + h^2);

N = (-pu*cosd(t) - tu*sind(6))*c/cosd(t) + (pl*cosd(t) - tl*sind(t))*c/cosd(t)
A = (-pu*sind(t) + tu*cosd(t))*c/cosd(t) + (pl*sind(t) + tl*sind(t))*c/cosd(t)+h*pb

L = N*cosd(a) - A*sind(a)
D = N*sind(a) + A*cosd(a)

M_le = (pu*cosd(t) + tu*sind(t))*(((c/cosd(t))^2)/2) - (pu*sind(t)-tu*cosd(t))*(h^2/2) + ...
    ((-pl*cosd(t)+tl*sind(t))*(((c/cosd(t))^2)/2) + (pl*sind(t)+tl*cosd(t))*(h^2/2))

M_c4 = M_le + (c/4)*N

xcp = -(M_le)/N

cl = L/(qinf*c)
cd = D/(qinf*c)
cm = M_c4/(qinf*c^2)