%This is what we use in the ODE solver for Commensalism, Predation and Cooperation

function dP=four_mod_general_1_3_5(time, output, kmA, KsA, kmB, KsB, D, Y_A, Y_B, A_in, gamma0, k_A, k_B, KIB, arg)

%Take the values at each time point

A=output(1);
a=output(2);
B=output(3);
b=output(4);

%Define Monod growth functions 
mu_A=(kmA*A/(KsA+A));
mu_B=(kmB*B/(KsB+B));
    
%Define inhibition function
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

dP=[A_dot;a_dot;B_dot;b_dot];