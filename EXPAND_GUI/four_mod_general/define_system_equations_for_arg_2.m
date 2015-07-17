%This code defines the system of equtions for Competition
function [A_dot, a_dot, b_dot, mu_A]=define_system_equations_for_arg_2() %This is for Monod

syms A B a b D Y_A Y_B A_in k_B kmA KsA k_A;

%Monod growth functions
mu_A=(kmA*A/(KsA+A));

%Define the equations of the system
A_dot=D*(A_in-A)-mu_A*a-mu_A*b;
a_dot=-D*a+Y_A*mu_A*a-k_A*a;
b_dot=-D*b+Y_B*mu_A*b-k_B*b;


