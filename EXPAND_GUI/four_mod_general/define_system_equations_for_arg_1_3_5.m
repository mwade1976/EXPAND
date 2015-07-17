%This code defines the system of equtions for Commensalism, Predation and Cooperation

function [A_dot, a_dot, B_dot, b_dot, mu_A, mu_B, I2]=define_system_equations_for_arg_1_3_5(arg)  %This is for Monod

syms A B a b gamma0 D Y_A Y_B A_in B_in k_B kmA kmB KsA KsB k_A KIB;

%Monod growth function
mu_A=(kmA*A/(KsA+A));
mu_B=(kmB*B/(KsB+B));

%Inhibition function
I2=1/(1+B/KIB);

if arg==1
    %A_dot
    I=1;     
    
elseif arg==3
    %A_dot
    I=I2;   
    
elseif arg==5
    %A_dot
    I=I2;   
    
end

%Define the equations of the system
A_dot=D*(A_in-A)-mu_A*a*I;
a_dot=-D*a+Y_A*mu_A*a*I-k_A*a;
B_dot=-D*B+gamma0*mu_A*a*I-mu_B*b;
b_dot=-D*b+Y_B*mu_A*b*-k_B*b;
