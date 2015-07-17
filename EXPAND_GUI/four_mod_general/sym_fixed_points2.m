%This system defines the equations, solves for the equilibria points,
%finds the stability of the equilibria points 
%(to find the stability the code calculates the Jacobian matrix. 
%It then calculates the eigenvalues of the Jacobian matrix to find out
%if the fixed points are stable or unstable.
%If all of the eigenvalues are negative then the fixed point is stable,
%if one or more eigenvalues are positive then the fixed point is unstable) 
%and plots both the numerical solution for the whole system and the 
%trajectories in the microbial strain space. 
%Also in this system the user has a choice of whether to input their own 
%values for the parameters and initial conditions (when necessary), 
%or whether to use our default values.

syms D kmA kmB kmC KsA KsB KsC mu_C A B C KIB KIC A_in C_in a b gamma0 Y_A Y_B k_A k_B time

%Choose which motif to use
arg=menu('Select the motif you wish to use','Commensalism','Competition','Predation','No Interaction','Cooperation','Amensalism');

%Depending on which motif the user chooses there will be different
%equations and parameters and variables involved. So we have differnt
%functions for those motifs.
if arg==1 || arg==3 || arg==5
    [A_dot, a_dot, B_dot, b_dot, mu_A, mu_B, I2]=define_system_equations_for_arg_1_3_5(arg);
elseif arg==2
    [A_dot, a_dot, b_dot, mu_A]=define_system_equations_for_arg_2();
elseif arg==4
    [A_dot, a_dot, b_dot, C_dot, mu_B, mu_C]=define_system_equations_for_arg_4();
elseif arg==6
    [A_dot, a_dot, B_dot, b_dot, C_dot, mu_A, mu_C, I2, Ic]=define_system_equations_for_arg_6();
end

%The user can choose to use our default values or to input their own
default=menu('Use default values?','Yes','No');
%Now to substitute in the values for numeric fixed points (Which may be
%different depending on which motif you choose
variables=set_variables_general(arg);
[parameters, D1, kmA1, kmB1, kmC1, KsA1, KsB1, KsC1, KIB1, KIC1, A_in1, C_in1, gamma01, Y_A1, Y_B1, k_A1, k_B1, k_C1, time1]=Input_numeric_general(default,arg);
if arg==1 || arg==3 || arg==5
        A_dot_numerical=subs(A_dot, variables, parameters);
        a_dot_numerical=subs(a_dot, variables, parameters);
        B_dot_numerical=subs(B_dot, variables, parameters);
        b_dot_numerical=subs(b_dot, variables, parameters);
elseif arg==2
        A_dot_numerical=subs(A_dot, variables, parameters);
        a_dot_numerical=subs(a_dot, variables, parameters);
        b_dot_numerical=subs(b_dot, variables, parameters);
elseif arg==4
        A_dot_numerical=subs(A_dot, variables, parameters);
        a_dot_numerical=subs(a_dot, variables, parameters);
        C_dot_numerical=subs(C_dot, variables, parameters);
        b_dot_numerical=subs(b_dot, variables, parameters);
elseif arg==6
        A_dot_numerical=subs(A_dot, variables, parameters);
        a_dot_numerical=subs(a_dot, variables, parameters);
        B_dot_numerical=subs(B_dot, variables, parameters);
        b_dot_numerical=subs(b_dot, variables, parameters);
        C_dot_numerical=subs(C_dot, variables, parameters);
end
%This calculates the numeric fixed points for the different motifs
if arg==1 || arg==3 || arg==5
[A_fix_num, B_fix_num, a_fix_num, b_fix_num]=solve([A_dot_numerical==0 a_dot_numerical==0 B_dot_numerical==0 b_dot_numerical==0]);
fixed_numerical=[A_fix_num, a_fix_num, B_fix_num, b_fix_num]; 
elseif arg==2
[A_fix_num, a_fix_num, b_fix_num]=solve([A_dot_numerical==0 a_dot_numerical==0 b_dot_numerical==0]);
fixed_numerical=[A_fix_num, a_fix_num, b_fix_num]; 
elseif arg==4
[A_fix_num, C_fix_num, a_fix_num, b_fix_num]=solve([A_dot_numerical==0 a_dot_numerical==0 C_dot_numerical==0 b_dot_numerical==0]);
fixed_numerical=[A_fix_num, a_fix_num, C_fix_num, b_fix_num]; 
elseif arg==6
[A_fix_num, B_fix_num, C_fix_num, a_fix_num, b_fix_num]=solve([A_dot_numerical==0 a_dot_numerical==0 B_dot_numerical==0 b_dot_numerical==0 C_dot_numerical==0]);
fixed_numerical=[A_fix_num, a_fix_num, B_fix_num, b_fix_num C_fix_num]; 
end

%For the three ODE system (Competition) for our default parameters no fixed
%points are found. The code works but you will need to use realistic
%values
if isempty(fixed_numerical)
    disp('No fixed points have been found for this set of parameters')
else
%This gets rid of meaningless fixed points (i.e. those with negative values)
for i=1:length(fixed_numerical(1,:))
fixed_numerical(fixed_numerical(:,i)<0,:) = [];
end

%An option to see the numeric fixed points    
show_num=menu('Show numeric fixed points?','Yes','No');
if show_num==1
disp('numerical fixed points')
disp(double(fixed_numerical))
else
end
end

%Plot the solution numerically
%Define initial conditions 
default1=menu('Use default initial conditions?', 'Yes', 'No') ;
if arg==1 || arg==3 || arg==5
    init=input_initial_general_for_arg_1_3_5(default1);
elseif arg==2
    init=input_initial_general_for_arg_2(default1);
elseif arg==4
    init=input_initial_general_for_arg_4(default1);
elseif arg==6
    init=input_initial_general_for_arg_6(default1);
end

%Options for ODE solver
options=odeset('RelTol',10e-8,'AbsTol',10e-8,'OutputFcn',[]);
 
%Run solver
if arg==1 || arg==3 || arg==5
    [tout,yout]=ode23s(@four_mod_general_1_3_5, [0:0.01:time1], init, options, kmA1, KsA1, kmB1, KsB1, D1, Y_A1, Y_B1, A_in1, gamma01, k_A1, k_B1, KIB1, arg);
elseif arg==2
    [tout,yout]=ode23s(@four_mod_general_2, [0:0.01:time1], init, options,  kmA1, KsA1, D1, Y_A1, Y_B1, A_in1, k_A1, k_B1);
elseif arg==4
    [tout,yout]=ode23s(@four_mod_general_4, [0:0.01:time1], init, options, kmA1, KsA1, kmC1, KsC1, D1, Y_B1, A_in1, C_in1, gamma01, k_A1, k_B1);
elseif arg==6
    [tout,yout]=ode23s(@four_mod_general_6, [0:0.01:time1], init, options, kmA1, KsA1, kmC1, KsC1, D1, Y_A1, Y_B1, A_in1, C_in1, gamma01, k_A1, k_C1, KIB1, KIC1);
end
    
%Plot results
figure(1)
plot(tout,yout,'linewidth',2)
xlabel('Time (days)','FontSize',18)
ylabel('Concentration (kgCOD m^{-3})','FontSize',18)
set(gca,'FontSize',18); 
hold on
if arg==1 || arg==3 || arg==5
legend('A', 'a', 'B', 'b')
elseif arg==2
legend('A', 'a', 'b')
elseif arg==4
legend('A', 'a', 'C', 'b')
elseif arg==6
legend('A', 'a', 'B', 'b', 'C')
end
hold off
