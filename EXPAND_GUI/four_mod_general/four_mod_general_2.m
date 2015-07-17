%This is what we use in the ODE solver for Competition
function dP=four_mod_general_2(time, output, kmA, KsA, D, Y_A, Y_B, A_in, k_A, k_B)

%Take the values at each time point

A=output(1);
a=output(2);
b=output(3);

%Define Monod growth function
mu_A=(kmA*A/(KsA+A));

%Define the equations of the system
A_dot=D*(A_in-A)-mu_A*a-mu_A*b;
a_dot=-D*a+Y_A*mu_A*a-k_A*a;
b_dot=-D*b+Y_B*mu_A*b-k_B*b;

dP=[A_dot;a_dot;b_dot];