%This is what we use in the ODE solver for Amensalism
function dP=four_mod_general_6(time, output, kmA, KsA, kmC, KsC, D, Y_A, Y_B, A_in, C_in, gamma0, k_A, k_C, KIB, KIC)

%Take the values at each time point
A=output(1);
a=output(2);
B=output(3);
b=output(4);
C=output(5);

%Define Monod growth functions
mu_A=(kmA*A/(KsA+A));
mu_C=(kmC*C/(KsC+C));

%Define inhibition functions
I2=1/(1+B/KIB);
Ic=1/(1+C/KIC);

%Define the equations of the system
A_dot=D*(A_in-A)-mu_A*a;
a_dot=-D*a+Y_A*mu_A*a-k_A*a;
B_dot=-D*B+gamma0*mu_A*a;
b_dot=-D*b+Y_B*mu_C*b*Ic-k_C*b;
C_dot=D*(C_in-C)-mu_C*b*Ic;

dP=[A_dot;a_dot;B_dot;b_dot;C_dot];