%basin of attraction
%choice of which plane to view to basin in
plane_choice=menu('Choose which plane you would like the plot to be in...','Sp-SH','Xp-XH','Sp-Xp','SH-XH','Sp-XH','SH-Xp');

% option to veiw the basin of attraction plots that have already been generated from the default values (this is a lot faster than producing new plots)
existing_plots=menu('Pick an option...','Veiw existing plots','Create new basin plot (slow)');
if existing_plots==1
    %lets the user know that these plots are for specific values
    msgbox('WARNING: This plot is generated using the default values with a monod growth function')
    %these are generated from using the default values with a monod growth function
    %existing plots set all values that are not being varied to the value of 0.1
    %also x=linspace(0,1,50) & y=linspace(0,1,50) for existing plots
    if plane_choice==1
    openfig('basin_plot_sp_sh.fig','visible');
    elseif plane_choice==2
    openfig('basin_plot_xp_xh.fig','visible');
    elseif plane_choice==3
    openfig('basin_plot_xp_sp.fig','visible');
    elseif plane_choice==4
    openfig('basin_plot_xh_sh.fig','visible');
    elseif plane_choice==5
    openfig('basin_plot_xh_sp.fig','visible');
    elseif plane_choice==6
    openfig('basin_plot_xp_sh.fig','visible');
    end
else
   
    %get the values entered in the GUI
fun_choice=get(handles.growthmenu,'Value');
kmp1 = str2double(get(handles.kmp_in,'String'));
Yp1 = str2double(get(handles.yp_in,'String'));
kdecp1 = str2double(get(handles.kdecp_in,'String'));
kmH1 = str2double(get(handles.kmh_in,'String'));
YH1 = str2double(get(handles.yh_in,'String'));
kdecH1 = str2double(get(handles.kdech_in,'String'));
Spin1 = str2double(get(handles.spin_in,'String'));
KIH1 = str2double(get(handles.kih_in,'String'));
Ksp1 = str2double(get(handles.ksp_in,'String'));
KsH1 = str2double(get(handles.ksh_in,'String'));
Ksxp1 = str2double(get(handles.ksxp_in,'String'));
KsxH1 = str2double(get(handles.ksxh_in,'String'));
D1 = str2double(get(handles.d_in,'String'));
time1 = str2double(get(handles.time_in,'String'));
Sp_init=str2double(get(handles.sp_init,'String'));
Xp_init=str2double(get(handles.xp_init,'String'));
SH_init=str2double(get(handles.sh_init,'String'));
XH_init=str2double(get(handles.xh_init,'String'));
       
%get the values of the fixed points
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

                

% % %allow the user to select what range they would like to plot over%%%
input=inputdlg({'Enter lower limit...','Enter upper limit...'},'Graph limits',1,{'0','1'});
low_lim=str2double(input{1});
up_lim=str2double(input{2});

%vary the initial condition
x=linspace(low_lim,up_lim,50);
y=linspace(low_lim,up_lim,50);

xp_choice=str2double(get(handles.xp_init,'String'));
xh_choice=str2double(get(handles.xh_init,'String'));
sp_choice=str2double(get(handles.sp_init,'String'));
sh_choice=str2double(get(handles.sh_init,'String'));
   
figure() %opens a new figure

%label the axis
if plane_choice==1
xlabel('Sp','FontSize',18)
ylabel('SH','FontSize',18)
elseif plane_choice==2
xlabel('Xp','FontSize',18)
ylabel('XH','FontSize',18)
elseif plane_choice==3
xlabel('Sp','FontSize',18)
ylabel('Xp','FontSize',18)
elseif plane_choice==4
xlabel('SH','FontSize',18)
ylabel('XH','FontSize',18)
elseif plane_choice==5
xlabel('Sp','FontSize',18)
ylabel('XH','FontSize',18)
elseif plane_choice==6
xlabel('SH','FontSize',18)
ylabel('Xp','FontSize',18)
hold off
end

%for the progess bar
total_steps = length(x)*length(y);
no_steps=zeros(length(x),length(y));
wait_msg=msgbox('Plotting...')


for i=1:length(x)
for j=1:length(y)
    initial=zeros(length(x),length(y),2);       %sets up a matrix of zeros
    initial(i,j,1)=x(i);                        %fills in the matrix with values
    initial(i,j,2)=y(j);                        %fills in the matrix with values
    
% varies two of the four initial conditions and lets the user set the others
if plane_choice==1
    init1=[initial(i,j,1), xp_choice, initial(i,j,2), xh_choice];
elseif plane_choice==2
    init1=[sp_choice, initial(i,j,1), sh_choice, initial(i,j,2)];
elseif plane_choice==3
    init1=[initial(i,j,1), initial(i,j,2), sh_choice, xh_xhoice];
elseif plane_choice==4
    init1=[sp_choice, xp_choice, initial(i,j,1), initial(i,j,2)];
elseif plane_choice==5
    init1=[initial(i,j,1), xp_choice, sh_choice, initial(i,j,2)];
elseif plane_choice==6
    init1=[sp_choice, initial(i,j,1), initial(i,j,2), xh_choice];
end

%stops the ode solver once we have reached a steady state
%options1=odeset('Events',@eventfun);        %eventfun(tout,yout,fixed_numerical)
%Options for ODE solver
options1=odeset('RelTol',10e-8,'AbsTol',10e-8,'OutputFcn',[]);
time2=300; %this will not be necessary once the event function is working correctly

warning off
if fun_choice==1
    [tout,yout]=ode23s(@four_mod, 0:0.01:time2, init1, options1, Spin1, D1, Yp1, kdecp1, YH1, kdecH1, kmp1, Ksp1, kmH1, KsH1, KIH1);
elseif fun_choice==2 
    [tout,yout]=ode23s(@four_mod2, 0:0.01:time2, init1, options1, Spin1, D1, Yp1, kdecp1, YH1, kdecH1, kmp1, kmH1, Ksxp1, KsxH1, KIH1);
end
warning on
%choose error
error=10^(-4);
%plot the basin of attraction
hold on
axis([low_lim up_lim low_lim up_lim]);
    if norm(yout(end,:)-fixed_numerical(1,:))<error
    plot(x(i),y(j),'s','color','b','MarkerFaceColor','b')
    elseif norm(yout(end,:)-fixed_numerical(2,:))<error
    plot(x(i),y(j),'s','color','r','MarkerFaceColor','r')
    elseif norm(yout(end,:)-fixed_numerical(3,:))<error
    plot(x(i),y(j),'s','color','g','MarkerFaceColor','g')
    else
    plot(x(i),y(j),'s','color','black','MarkerFaceColor','black')
    end
hold off

    %progress
    no_steps(i,j)=1;
    percent=sum(sum(no_steps))*100/total_steps;
    %waitbar(percent)

end
end
delete(wait_msg)
end