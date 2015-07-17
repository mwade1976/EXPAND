%set up a system of all of the variables
syms Sp Xp SH XH kmp Ksp Yp kdecp kmH KsH YH kdecH KIH Spin D time;

%choose which growth function to use
    %%only monod and cortois are working properly in this version of code%%
[eq1, eq2, eq3, eq4, fp, fH, I2]=define_system_equations(fun_choice);
if fun_choice~=1 && fun_choice~=2
    warning('Please select either Monod or Contois')
    return
else
end

%plug in the values for numeric fixed points
variables=set_variables(fun_choice);
if fun_choice==1
        parameters=[kmp1 Yp1 kdecp1 kmH1 YH1 kdecH1 KIH1 D1 Spin1 time1 Ksp1 KsH1];
elseif fun_choice==2
        parameters=[kmp1 Yp1 kdecp1 kmH1 YH1 kdecH1 KIH1 D1 Spin1 time1 Ksxp1 KsxH1];
end
        eq1_numerical=subs(eq1,variables,parameters);
        eq2_numerical=subs(eq2,variables,parameters);
        eq3_numerical=subs(eq3,variables,parameters);
        eq4_numerical=subs(eq4,variables,parameters);
[SH_fix_num,Sp_fix_num,XH_fix_num,Xp_fix_num]=solve([eq1_numerical==0 eq2_numerical==0 eq3_numerical==0 eq4_numerical==0]);
fixed_numerical=[Sp_fix_num,Xp_fix_num,SH_fix_num,XH_fix_num];
%need to get rid of unrealistic fixed points (i.e. those with negative values)
for i=1:length(fixed_numerical(1,:))
fixed_numerical(fixed_numerical(:,i)<0,:) = [];
end

fixed_numerical1=round(fixed_numerical*10^3)/10^3;

%sends the fixed points over to the gui
set(handles.fixed_points_sp,'String',double(fixed_numerical1(:,1)));
set(handles.fixed_points_xp,'String',double(fixed_numerical1(:,2)));
set(handles.fixed_points_sh,'String',double(fixed_numerical1(:,3)));
set(handles.fixed_points_xh,'String',double(fixed_numerical1(:,4)));

%shows the stability of the fixed points on the gui
stability_analysis_gui
set(handles.fixed_points_stability,'String',s');


%Options for ODE solver
options=odeset('RelTol',10e-8,'AbsTol',10e-8,'OutputFcn',[]);

%Run solver
if fun_choice==1
    [tout,yout]=ode23s(@four_mod, [0:0.01:time1], [Sp_init, Xp_init, SH_init, XH_init], options, Spin1, D1, Yp1, kdecp1, YH1, kdecH1, kmp1, Ksp1, kmH1, KsH1, KIH1);
elseif fun_choice==2 
    [tout,yout]=ode23s(@four_mod2, [0:0.01:time1], [Sp_init, Xp_init, SH_init, XH_init], options, Spin1, D1, Yp1, kdecp1, YH1, kdecH1, kmp1, kmH1, Ksxp1, KsxH1, KIH1);
end

%Plot results
axes(handles.solutionplot);
%reset the plot
cla reset

%lets the user select which lines to be plotted on the graph
if sp_check==1
hold on
plot(handles.solutionplot,tout,yout(:,1),'linewidth',2,'color','b')
hold off
else
end
if xp_check==1
    hold on
plot(handles.solutionplot,tout,yout(:,2),'linewidth',2,'color','r')
hold off
else
end
if sh_check==1
    hold on
plot(handles.solutionplot,tout,yout(:,3),'linewidth',2,'color','g')
hold off
else
end
if xh_check==1
    hold on
plot(handles.solutionplot,tout,yout(:,4),'linewidth',2,'color','cyan')
hold off
else
end
hold on
%adds axis labels
xlabel(handles.solutionplot,'Time (days)')
ylabel(handles.solutionplot,'Concentration (kgCOD m^{-3})')
hold off


axes(handles.trajectoryplot);
%if user wants to overlay multiple trajectories onto the plot of
%trajectories
multi=get(handles.overlay,'Value');
if multi==0
cla reset
else
end
%trajectories plotted on the Xp-XH plane
%define what Xp and XH are
Xp_value=yout(:,2);
XH_value=yout(:,4);
hold on
%plot the fixed points
for i=1:length(fixed_numerical(:,1))
plot(handles.trajectoryplot,fixed_numerical(i,2),fixed_numerical(i,4),'s','color','b','MarkerFaceColor','b')
end
%plot the trajectory
plot(handles.trajectoryplot,Xp_value,XH_value)
xlabel(handles.trajectoryplot,'X_p')
ylabel(handles.trajectoryplot,'X_H')
%plot the start point (green dot)
plot(handles.trajectoryplot,yout(1,2),yout(1,4),'o','color','g','MarkerFaceColor','g')
%plot the end point (red dot)
plot(handles.trajectoryplot,yout(end,2),yout(end,4),'o','color','r','MarkerFaceColor','r')
hold off

