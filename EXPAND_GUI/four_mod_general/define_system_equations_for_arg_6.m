%This code defines the system of equations for Amensalism
function [A_dot, a_dot, B_dot, b_dot, C_dot, mu_A, mu_C, I2, Ic]=define_system_equations_for_arg_6()  %This is for Monod

syms A B C a b gamma0 D Y_A Y_B A_in C_in k_B k_C kmA kmB kmC KsA KsB KsC k_A KIB KIC;

%Monod growth function
mu_A=(kmA*A/(KsA+A));
mu_C=(kmC*C/(KsC+C));
    
%Inhibition function
I2=1/(1+B/KIB);
Ic=1/(1+C/KIC);

%Define the equations of the system
A_dot=D*(A_in-A)-mu_A*a;
a_dot=-D*a+Y_A*mu_A*a-k_A*a;
B_dot=-D*B+gamma0*mu_A*a;
b_dot=-D*b+Y_B*mu_C*b*Ic-k_C*b;
C_dot=D*(C_in-C)-mu_C*b*Ic;
