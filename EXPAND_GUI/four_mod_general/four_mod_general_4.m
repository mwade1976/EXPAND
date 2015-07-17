%This is what we use in the ODE solver for No Interaction
function dP=four_mod_general_4(time, output, kmA, KsA, kmC, KsC, D, Y_B, A_in, C_in, gamma0, k_A, k_B)

%Take the values at each time point

A=output(1);
a=output(2);
C=output(3);
b=output(4);

%Define Monod growth functions 
mu_A=(kmA*A/(KsA+A));
mu_C=(kmC*C/(KsC+C));

%Define the equations of the system
A_dot=D*(A_in-A)-mu_A*a;
a_dot=-D*a-k_A*a;
C_dot=D*(C_in-C)-mu_C*b;
b_dot=-D*b+Y_B*mu_C*b-k_B*b;

dP=[A_dot;a_dot;C_dot;b_dot];