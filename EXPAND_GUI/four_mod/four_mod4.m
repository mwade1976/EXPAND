%4 ODE model (for cooperation). This is for Moser
function dP=four_mod4(time, output, Spin, D, Yp, kdecp, YH, kdecH, kmp, Ksp, kmH, KsH, KIH,N)
%This function defines the growth model for the system with 4 ODEs and the ordinary
%differential equations (ODEs) that derive the values of  propionate
%substrate (eq1:Spro), propionate biomass concentration(eq2:Xpro) and
%(eq3:SH2) and (eq4:XH2) are those for hydrogen

%Take the substrate and biomass values at each time point

Sp=output(1);
Xp=output(2);
SH=output(3);
XH=output(4);

%Define growth functions and inhibition function
fp=(kmp*Sp^N/(Ksp+Sp^N));
fH=(kmH*SH^N/(KsH+SH^N));
I2=1/(1+SH/KIH);

%Calculate propionate substrate, propionate biomass concentration, hydrogen
%substrate and hydrogen biomass concentration

eq1=D*(Spin-Sp)-fp*Xp*I2;
eq2=-D*Xp+Yp*fp*Xp*I2-kdecp*Xp;
eq3=-D*SH+0.43*(1-Yp)*fp*Xp*I2-fH*XH;
eq4=-D*XH+YH*fH*XH-kdecH*XH;

dP=[eq1;eq2;eq3;eq4];