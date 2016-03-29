import numpy as np

c=0
Tprime = [0,0,0,0,0,0]
T = [0,0,0,0,0,0]

for i in range (0,6):
    Tprime[i] = input ("What is your experimental T value?")
    T[i] = Tprime[i]/8
    c = c + T[i]

T_avg =  c/6

l = 1.02  # cm

g = (((4* (np.pi)**2)*l)/T_avg**2) # gravity



print g
