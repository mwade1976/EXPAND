function [eq1, eq2, eq3, eq4, fp, fH, I2]=define_system_equations(arg)    %arg will be a menu function with options corresponding to the following growth functions
%arg=menu('Choose growth function...','Monod','Contois','Tessier','Moser','Blackman','Modified Monod')

syms Sp Xp SH XH kmp Ksp Yp kdecp kmH KsH YH kdecH KIH D Spin SHin Ksxp KsxH kp kH Ks0p Ks0H N;


if arg==1           %Monod growth function
    fp=(kmp*Sp/(Ksp+Sp));
    fH=(kmH*SH/(KsH+SH));
    
elseif arg==2       %Contois
    fp=(kmp*Sp/(Ksxp*Xp+Sp));
    fH=(kmH*SH/(KsxH*XH+SH));
end

I2=1/(1+SH/KIH);

%define the equations of the system
eq1=D*(Spin-Sp)-fp*Xp*I2;
eq2=-D*Xp+Yp*fp*Xp*I2-kdecp*Xp;
eq3=-D*SH+0.43*(1-Yp)*fp*Xp*I2-fH*XH;
eq4=-D*XH+YH*fH*XH-kdecH*XH;
