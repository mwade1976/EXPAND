%NUMERICAL METHOD
%This code introduces a pertubation in Sp-SH space and checks if it remains
%at the fixed points.

%NOTE: the code that is commented needs adjusting so that the initial
%conditions cannot be less than zero

for i=1:length(fixed_numerical(:,1))
    %Options for ODE solver
    options=odeset('RelTol',10e-8,'AbsTol',10e-8,'OutputFcn',[]);
    
    %Initial is the fixed point coordinates
    initial=double([fixed_numerical(i,1) fixed_numerical(i,2) fixed_numerical(i,3) fixed_numerical(i,4)]);
    if fun_choice==1
    [~,yout2]=ode23s(@four_mod, 0:0.01:100, initial+[0.00001 0 0.00001 0], options, Spin1, D1, Yp1, kdecp1, YH1, kdecH1, kmp1, Ksp1, kmH1, KsH1, KIH1);
    %[~,yout3]=ode23s(@four_mod, 0:0.01:100, initial-[0.00001 0 0.00001 0], options, Spin1, D1, Yp1, kdecp1, YH1, kdecH1, kmp1, Ksp1, kmH1, KsH1, KIH1);
    elseif fun_choice==2 
    [~,yout2]=ode23s(@four_mod2, [0:0.01:time1], initial+[0.00001 0 0.00001 0], options, Spin1, D1, Yp1, kdecp1, YH1, kdecH1, kmp1, kmH1, Ksxp1, KsxH1, KIH1);
    %[~,yout3]=ode23s(@four_mod2, [0:0.01:time1], initial-[0.00001 0 0.00001 0], options, Spin1, D1, Yp1, kdecp1, YH1, kdecH1, kmp1, kmH1, Ksxp1, KsxH1, KIH1);
    end
    
    %Calculate the difference between the trajectories
        dif1(:,i)=yout2(end,:)-initial;
        %dif2(:,i)=yout3(end,:)-initial;
        
    if norm(dif1(:,i))<10^(-4) %&& norm(dif2(:,i))<10^(-4)
    disp('Stable Fixed Point')
    else
    disp('Unstable Fixed Point')
    end
       
    end

