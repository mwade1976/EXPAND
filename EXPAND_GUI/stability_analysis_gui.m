%NUMERICAL METHOD
%this code introduces a pertubation in Sp-SH space and sees if it remains
%at the fixed points.

%NOTE: the commented code introduces a perturbation in the opposite
%direction however this uses more memory and slows down the calculation

for i=1:length(fixed_numerical(:,1))
    %Options for ODE solver
    options=odeset('RelTol',10e-8,'AbsTol',10e-8,'OutputFcn',[]);
    
    %initial is the fixed point coordinates
    initial=double([fixed_numerical(i,1) fixed_numerical(i,2) fixed_numerical(i,3) fixed_numerical(i,4)]);
    if fun_choice==1
    [~,yout2]=ode23s(@four_mod, 0:0.01:100, initial+[0.00001 0 0.00001 0], options, Spin1, D1, Yp1, kdecp1, YH1, kdecH1, kmp1, Ksp1, kmH1, KsH1, KIH1);
    %[~,yout3]=ode23s(@four_mod, 0:0.01:100, abs(initial-[0.00001 0 0.00001 0]), options, Spin1, D1, Yp1, kdecp1, YH1, kdecH1, kmp1, Ksp1, kmH1, KsH1, KIH1);
    elseif fun_choice==2 
    [~,yout2]=ode23s(@four_mod2, [0:0.01:time1], initial+[0.00001 0 0.00001 0], options, Spin1, D1, Yp1, kdecp1, YH1, kdecH1, kmp1, kmH1, Ksxp1, KsxH1, KIH1);
    %[~,yout3]=ode23s(@four_mod2, [0:0.01:time1], abs(initial-[0.00001 0 0.00001 0]), options, Spin1, D1, Yp1, kdecp1, YH1, kdecH1, kmp1, kmH1, Ksxp1, KsxH1, KIH1);
    end
    
    %calculate the difference between the trajectories
        dif1(:,i)=yout2(end,:)-initial;
        %dif2(:,i)=yout3(end,:)-initial;
        
    if norm(dif1(:,i))<10^(-4)  %&& norm(dif2(:,i))<10^(-4)
    s(:,i)='Stable Fixed Point';
    else
    s(:,i)='Unstable Fixed Point';
    end
       
    end

