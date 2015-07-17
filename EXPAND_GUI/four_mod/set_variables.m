%This function sets the variables for the 4 ODE system (No Cooperation)
function var=set_variables(arg)

syms Sp Xp SH XH kmp Ksp Yp kdecp kmH KsH YH kdecH KIH D Spin SHin Ksxp KsxH kp kH Ks0p Ks0H N time;

if arg==1
        var=[kmp Yp kdecp kmH YH kdecH KIH D Spin time Ksp KsH];
elseif arg==2
        var=[kmp Yp kdecp kmH YH kdecH KIH D Spin time Ksxp KsxH];
elseif arg==3
        var=[kmp Yp kdecp kmH YH kdecH KIH D Spin time kp kH];
elseif arg==4
        var=[kmp Yp kdecp kmH YH kdecH KIH D Spin time Ksp KsH N];
elseif arg==5
        var=[kmp Yp kdecp kmH YH kdecH KIH D Spin time Ksp KsH Ks0p Ks0H SHin];
end