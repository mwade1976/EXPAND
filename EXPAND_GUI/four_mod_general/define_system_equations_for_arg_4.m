%This code defines the system of equtions for No Interaction
function [A_dot, a_dot, b_dot, C_dot, mu_A, mu_C]=define_system_equations_for_arg_4()  %This is for Monod

syms A C a b gamma0 D Y_A Y_B A_in C_in k_B kmA kmC KsA KsC k_A;

%Monod growth functions
mu_A=(kmA*A/(KsA+A));
mu_C=(kmC*C/(KsC+C));

%Define the equations of the system
A_dot=D*(A_in-A)-mu_A*a;
a_dot=-D*a-k_A*a;
C_dot=D*(C_in-C)-mu_C*b;
b_dot=-D*b+Y_B*mu_C*b-k_B*b;
