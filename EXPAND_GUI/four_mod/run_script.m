%Set up a system of all of the variables
syms Sp Xp SH XH kmp Ksp Yp kdecp kmH KsH YH kdecH KIH D Spin SHin Ksxp KsxH kp kH Ks0p Ks0H N time;

%choose which growth function to use
    %%only monod and cortois are working properly in this version of code%%
fun_choice=menu('Choose growth function...','Monod','Contois','Tessier','Moser','Modified Monod');
[eq1, eq2, eq3, eq4, fp, fH, I2]=define_system_equations(fun_choice);
if fun_choice~=1 && fun_choice~=2
    warning('Please select either Monod or Contois')
    return
else
end

%choice to see algebraic expression or not (code only computes the algebraic form when needed to be shown as the code runs faster that way) 
show=menu('Show algebraic expression for fixed points? (This could take a while)','Yes','No');
if show==1
warning off;
[Sp_fix, Xp_fix, SH_fix, XH_fix, fp_fix, fH_fix, I2_fix]=find_fixed_pointnew(fun_choice,eq1,eq2,eq3,eq4,fp,fH,I2);
warning on;
disp('Sp_fix')
disp(Sp_fix)
disp('Xp_fix') 
disp(Xp_fix)
disp('SH_fix')
disp(SH_fix)
disp('XH_fix')
disp(XH_fix)
else
end

default=menu('Use default values?','Yes','No');
%plug in the values for numeric fixed points
variables=set_variables(fun_choice);
[parameters,kmp1, Ksp1, Yp1, kdecp1, kmH1, KsH1, YH1, kdecH1, KIH1, D1, Spin1, SHin1, Ksxp1, KsxH1, kp1, kH1, Ks0p1, Ks0H1, N1, time1]=Input_numeric(default,fun_choice);
        eq1_numerical=subs(eq1,[kmp, Ksp, Yp, kdecp, kmH, KsH, YH, kdecH, KIH, D, Spin, SHin, Ksxp, KsxH, kp, kH, Ks0p, Ks0H, N],[kmp1, Ksp1, Yp1, kdecp1, kmH1, KsH1, YH1, kdecH1, KIH1, D1, Spin1, SHin1, Ksxp1, KsxH1, kp1, kH1, Ks0p1, Ks0H1, N1]);
        eq2_numerical=subs(eq2,[kmp, Ksp, Yp, kdecp, kmH, KsH, YH, kdecH, KIH, D, Spin, SHin, Ksxp, KsxH, kp, kH, Ks0p, Ks0H, N],[kmp1, Ksp1, Yp1, kdecp1, kmH1, KsH1, YH1, kdecH1, KIH1, D1, Spin1, SHin1, Ksxp1, KsxH1, kp1, kH1, Ks0p1, Ks0H1, N1]);
        eq3_numerical=subs(eq3,[kmp, Ksp, Yp, kdecp, kmH, KsH, YH, kdecH, KIH, D, Spin, SHin, Ksxp, KsxH, kp, kH, Ks0p, Ks0H, N],[kmp1, Ksp1, Yp1, kdecp1, kmH1, KsH1, YH1, kdecH1, KIH1, D1, Spin1, SHin1, Ksxp1, KsxH1, kp1, kH1, Ks0p1, Ks0H1, N1]);
        eq4_numerical=subs(eq4,[kmp, Ksp, Yp, kdecp, kmH, KsH, YH, kdecH, KIH, D, Spin, SHin, Ksxp, KsxH, kp, kH, Ks0p, Ks0H, N],[kmp1, Ksp1, Yp1, kdecp1, kmH1, KsH1, YH1, kdecH1, KIH1, D1, Spin1, SHin1, Ksxp1, KsxH1, kp1, kH1, Ks0p1, Ks0H1, N1]);
[SH_fix_num,Sp_fix_num,XH_fix_num,Xp_fix_num]=solve([eq1_numerical==0 eq2_numerical==0 eq3_numerical==0 eq4_numerical==0]);
fixed_numerical=[Sp_fix_num,Xp_fix_num,SH_fix_num,XH_fix_num];
%need to get rid of unrealistic fixed points (i.e. those with negative values)
for i=1:length(fixed_numerical(1,:))
fixed_numerical(fixed_numerical(:,i)<0,:) = [];
end

show_num=menu('Show numeric fixed points?','Yes','No');
if show_num==1
disp('numerical fixed points')
disp(double(fixed_numerical))
else
end

%calculate the components of the jacobian
J_11=diff(eq1,Sp); J_12=diff(eq1,Xp); J_13=diff(eq1,SH); J_14=diff(eq1,XH);
J_21=diff(eq2,Sp); J_22=diff(eq2,Xp); J_23=diff(eq2,SH); J_24=diff(eq2,XH);
J_31=diff(eq3,Sp); J_32=diff(eq3,Xp); J_33=diff(eq3,SH); J_34=diff(eq3,XH);
J_41=diff(eq4,Sp); J_42=diff(eq4,Xp); J_43=diff(eq4,SH); J_44=diff(eq4,XH);

%calculate the analytic Jacobian
J_analytic=[J_11 J_12 J_13 J_14; J_21 J_22 J_23 J_24; J_31 J_32 J_33 J_34; J_41 J_42 J_43 J_44];

%%%THIS CODE ONLY WORKS WHEN THE SYMBOLIC FIXED POINTS HAVE BEEN
%%%CALCULATED!!!
%                     % %calculate Jacobian at the fixed points (symbolic)
%                     % J_analytic_fix=simplify(subs(J_analytic,[Sp Xp SH XH fp fH I2],[Sp_fix Xp_fix SH_fix XH_fix fp_fix fH_fix I2_fix]));
% 
%                     % Takes forever to compute analytic jacobian at fixed points and eigenvalues so put numerics in here.
%                                     % numeric_fix=subs([Sp_fix, Xp_fix, SH_fix, XH_fix],variables,parameters);
%                                     % J_num0=subs(J_analytic,variables,parameters);
%                                     % J_num=double(subs(J_num0,[Sp Xp SH XH],numeric_fix));
                
%find the stability of each of the fixed points
% disp('Stability of the fixed points:')
J_numeric=subs(J_analytic,variables,parameters);
J_num_fix=zeros(length(fixed_numerical(1,:)),length(fixed_numerical(1,:)),length(fixed_numerical(:,1)));
for i=1:length(fixed_numerical(:,1))
J_num_fix(:,:,i)=subs(J_numeric,[Sp Xp SH XH],[Sp_fix_num(i,1), Xp_fix_num(i,1), SH_fix_num(i,1), XH_fix_num(i,1)]);
evalues(:,i)=eig(J_num_fix(:,:,i));
end

show_eig=menu('Show stability?','Yes','No');
if show_eig==1
disp('Stability for each fixed point:')
stability_analysis
% % %mathematically correct but we only want to allow for perturbations in the
% % %substrate so stability shown in this code is not what we want.
% % for i=1:length(evalues(1,:))
% % disp(stab(evalues(:,i)))
% % end
else
end

%%plot the solution numerically
%Define initial conditions (Sp(0),Xp(0), SH(0), XH(0))
default1=menu('Use default initial conditions?', 'Yes', 'No') ;
init=input_initial(default1);

%Options for ODE solver
options=odeset('RelTol',10e-8,'AbsTol',10e-8,'OutputFcn',[]);

%Run solver
if fun_choice==1
    [tout,yout]=ode23s(@four_mod, [0:0.01:time1], init, options, Spin1, D1, Yp1, kdecp1, YH1, kdecH1, kmp1, Ksp1, kmH1, KsH1, KIH1);
elseif fun_choice==2 
    [tout,yout]=ode23s(@four_mod2, [0:0.01:time1], init, options, Spin1, D1, Yp1, kdecp1, YH1, kdecH1, kmp1, kmH1, Ksxp1, KsxH1, KIH1);
% elseif fun_choice==3
%     [tout,yout]=ode23s(@four_mod3, [0:0.01:time1], init, options, Spin1, D1, Yp1, kdecp1, YH1, kdecH1, kmp1, kmH1, kp1, kH1, KIH1);
% elseif fun_choice==4 
%     [tout,yout]=ode23s(@four_mod4, [0:0.01:time1], init, options, Spin1, D1, Yp1, kdecp1, YH1, kdecH1, kmp1, Ksp1, kmH1, KsH1, KIH1, N1);
% elseif fun_choice==5
%     [tout,yout]=ode23s(@four_mod5, [0:0.01:time1], init, options, Spin1, D1, Yp1, kdecp1, YH1, kdecH1, kmp1, Ksp1, kmH1, KsH1, SHin1, Ks0p1, Ks0H1, KIH1);
end

%Plot results
figure(1)
plot(tout,yout,'linewidth',2)
xlabel('Time (days)','FontSize',18)
ylabel('Concentration (kgCOD m^{-3})','FontSize',18)
set(gca,'FontSize',18); 
hold on
legend('S_p', 'X_p', 'S_H', 'X_H')
hold off

%asks the user if they would like to see the basin of attraction plot
calc_basin=menu('Basin of attraction?','Yes','No');
if calc_basin==1
    %calls in the script with the code for the basin of attraction
    basin_of_attraction
else
end

% ask user if they want to see the trajectories for
show_traj=menu('Show numeric fixed points?','Yes','No');
if show_traj==1
%trajectories plotted on the Xp-XH plane
%define what Xp and XH are
Xp_value=yout(:,2);
XH_value=yout(:,4);

figure(3)
hold on
%plot the fixed points
for i=1:length(fixed_numerical(:,1))
plot(fixed_numerical(i,2),fixed_numerical(i,4),'s','color','b','MarkerFaceColor','b')
end
%plot the trajectory
plot(Xp_value,XH_value)
xlabel('Xp','FontSize',18)
ylabel('XH','FontSize',18)

%plot the start point (green dot)
plot(yout(1,2),yout(1,4),'o','color','g','MarkerFaceColor','g')
%plot the end point (red dot)
plot(yout(end,2),yout(end,4),'o','color','r','MarkerFaceColor','r')
hold off
else
end
