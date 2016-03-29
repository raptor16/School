voltage = [130.0, 207.7, 251.91, 290.3, 29.5, 277.0];
current = [0.740, 0.738, 1.163, 1.035, 1.635, 2.153];
diameter = [4.0, 10.0, 10.7, 7.3, 8.7, 6.4];
radius = diameter/2;

mu_const = 4*pi*10^-7;
n = 130 %number of turns of the helmholtz coil
r = 0.16 %radius of the helmholtz coil in meters

% I don't know what I_o is 
%%%%%%%%%%     I_o = some array <<--needed for external B field ;

k = ((1/(2^1/2))* ((4/5)^(3/2))*mu_const*n)/r;
B_c = current*((((4/5)^(3/2))*mu_const*n)/r);
B_ext = I_o/ k;
B = B_c + B_ext;

em_ratio = voltage/((k^2)*(r^2)*(current - I_o)^2)



