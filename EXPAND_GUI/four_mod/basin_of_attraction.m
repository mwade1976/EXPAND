%This script plots the Basin of attractions
%The user gets a choice of which plane to view to basin in
plane_choice=menu('Choose which plane you would like the plot to be in...','Sp-SH','Xp-XH','Sp-Xp','SH-XH','Sp-XH','SH-Xp');

%Option to veiw the basin of attraction plots that have already been generated from the default values (this is a lot faster than producing new plots)
existing_plots=menu('Pick an option...','Veiw existing plots','Create new basin plot (slow)');
if existing_plots==1
    %This lets the user know that these plots are for specific values
    disp('WARNING: This plot is generated using the default values with a monod growth function')
    %these are generated from using the default values with a monod growth function
    %Existing plots set all values that are not being varied to the value of 0.1
    %Also x=linspace(0,1,50) & y=linspace(0,1,50) for existing plots
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
    
figure(2)   %This opens a new figure window

%This allows the user to select what range they would like to plot over
low_lim=input('Enter the lower limit for the plot:');
up_lim=input('Enter the upper limit for the plot:');

%Vary the initial conditions
x=linspace(low_lim,up_lim,50);
y=linspace(low_lim,up_lim,50);

for i=1:length(x)
for j=1:length(y)
    initial=zeros(length(x),length(y),2);       %Sets up a matrix of zeros
    initial(i,j,1)=x(i);                        %Fills in the matrix with values
    initial(i,j,2)=y(j);                        %Fills in the matrix with values
    
%This varies two of the four initial conditions and lets the user set the others
if plane_choice==1
    xp_choice=input('Choose a value for Xp(>0):');
    xh_choice=input('Choose a value for XH(>0):');
init1=[initial(i,j,1), xp_choice, initial(i,j,2), xh_choice];
elseif plane_choice==2
    sp_choice=input('Choose a value for Sp(>0):');
    sh_choice=input('Choose a value for SH(>0):');
init1=[sp_choice, initial(i,j,1), sh_choice, initial(i,j,2)];
elseif plane_choice==3
    xh_choice=input('Choose a value for XH(>0):');
    sh_choice=input('Choose a value for SH(>0):');
init1=[initial(i,j,1), initial(i,j,2), sh_choice, xh_xhoice];
elseif plane_choice==4
    sp_choice=input('Choose a value for Sp(>0):');
    xp_choice=input('Choose a value for Xp(>0):');
init1=[sp_choice, xp_choice, initial(i,j,1), initial(i,j,2)];
elseif plane_choice==5
    xp_choice=input('Choose a value for Xp(>0):');
    sh_choice=input('Choose a value for SH(>0):');
init1=[initial(i,j,1), xp_choice, sh_choice, initial(i,j,2)];
elseif plane_choice==6
    xh_choice=input('Choose a value for XH(>0):');
    sp_choice=input('Choose a value for Sp(>0):');
init1=[sp_choice, initial(i,j,1), initial(i,j,2), xh_choice];
end

%This stops the ODE solver once we have reached a steady state
options1=odeset('Events',@eventfun);        %eventfun(tout,yout,fixed_numerical)

warning off;
if fun_choice==1
    [tout,yout]=ode23s(@four_mod, 0:0.01:time1, init1, options1, Spin1, D1, Yp1, kdecp1, YH1, kdecH1, kmp1, Ksp1, kmH1, KsH1, KIH1);
elseif fun_choice==2 
    [tout,yout]=ode23s(@four_mod2, 0:0.01:time1, init1, options1, Spin1, D1, Yp1, kdecp1, YH1, kdecH1, kmp1, kmH1, Ksxp1, KsxH1, KIH1);
% elseif fun_choice==3
%     [tout,yout]=ode23s(@four_mod3, [0:0.01:time1], init1, options, Spin1, D1, Yp1, kdecp1, YH1, kdecH1, kmp1, kmH1, kp1, kH1, KIH1);
% elseif fun_choice==4 
%     [tout,yout]=ode23s(@four_mod4, [0:0.01:time1], init1, options, Spin1, D1, Yp1, kdecp1, YH1, kdecH1, kmp1, Ksp1, kmH1, KsH1, KIH1, N1);
% elseif fun_choice==5
%     [tout,yout]=ode23s(@four_mod5, [0:0.01:time1], init1, options, Spin1, D1, Yp1, kdecp1, YH1, kdecH1, kmp1, Ksp1, kmH1, KsH1, SHin1, Ks0p1, Ks0H1, KIH1);
end
warning on
%Choose error
error=10^(-4);
%This plots the basin of attraction
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
hold on
end
end
%Label the axis
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
end