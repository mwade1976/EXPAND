%This function defines the parameters used for the numerical input
function [p,kmp, Ksp, Yp, kdecp, kmH, KsH, YH, kdecH, KIH, D, Spin, SHin, Ksxp, KsxH, kp, kH, Ks0p, Ks0H, N, time]=Input_numeric(default,arg)

if default==1
%A vector of default values of parameters
kmp=13; Yp=0.04; kdecp=0.02; kmH=35; YH=0.06; kdecH=0.02; KIH=0.0000035; D=0.1; time=1000; Spin=5; SHin=3; Ksp=0.3; KsH=0.000025; kp=0.004; kH=0.0005; Ksxp=3; KsxH=2; N=1; Ks0p=0.06; Ks0H=0.007;
if arg==1
        p=[kmp Yp kdecp kmH YH kdecH KIH D Spin time Ksp KsH];
elseif arg==2
        p=[kmp Yp kdecp kmH YH kdecH KIH D Spin time Ksxp KsxH];
elseif arg==3
        p=[kmp Yp kdecp kmH YH kdecH KIH D Spin time kp kH];
elseif arg==4
        p=[kmp Yp kdecp kmH YH kdecH KIH D Spin time Ksp KsH N];
elseif arg==5
        p=[kmp Yp kdecp kmH YH kdecH KIH D Spin time Ksp KsH Ks0p Ks0H SHin];
end

else
%Enter parameter values (with certain criteria that need to be met
%otherwise a default value will be selected)
kmp=13; Yp=0.04; kdecp=0.02; kmH=35; YH=0.06; kdecH=0.02; KIH=0.0000035; D=0.1; time=1000; Spin=5; SHin=3; Ksp=0.3; KsH=0.000025; kp=0.004; kH=0.0005; Ksxp=3; KsxH=2; N=1; Ks0p=0.06; Ks0H=0.007;
%default_value=[kmp Yp kdecp kmH YH kdecH KIH D time Spin SHin Ksp KsH kp kH Ksxp KsxH N Ks0p Ks0H];
default_value=[13 0.04 0.02 35 0.06 0.02 0.0000035 0.1 1000 5 3 0.3 0.000025 0.004 0.0005 3 2 1 0.06 0.007];

kmp_in=input('Select maximum specific propionate growth rate (kmp>0):');
    if kmp_in>=0
        kmp=kmp_in;
    else
        kmp=default_value(1);
        msgbox('The value entered for kmp was not valid so default value was selected','Error','error')
    end
Yp_in=input('Select propionate substrate yield value (Yp>0):');
    if Yp_in>=0
        Yp=Yp_in;
    else
        Yp=default_value(2);
        msgbox('The value entered for Yp was not valid so default value was selected','Error','error')
    end
kdecp_in=input('Select propionate decay constant/maintenance value (0<kdecp<1):');
    if kdecp_in>=0 && kdecp_in<=1
        kdecp=kdecp_in;
    else
        kdecp=default_value(3);
        msgbox('The value entered for kdecp was not valid so default value was selected','Error','error')
    end
kmH_in=input('Select maximum specific hydrogen growth rate (kmH>0):');
    if kmH_in>=0
        kmH=kmH_in;
    else
        kmH=default_value(4);
        msgbox('The value entered for kmH was not valid so default value was selected','Error','error')
    end
YH_in=input('Select hydrogen substrate yield value (YH>0):');
    if YH_in>=0
        YH=YH_in;
    else
        YH=default_value(5);
        msgbox('The value entered for YH was not valid so default value was selected','Error','error')
    end
kdecH_in=input('Select hydrogen decay constant/maintenance value (0<kdecH<1):');
    if kdecH_in>=0 && kdecp_in<=1
        kdecH=kdecH_in;
    else
        kdecH=default_value(6);
        msgbox('The value entered for kdecH was not valid so default value was selected','Error','error')
    end
KIH_in=input('Select hydrogen inhibition value (KIH>0)');
    if KIH_in>=0
        KIH=KIH_in;
    else
        KIH=default_value(7);
        msgbox('The value entered for KIH was not valid so default value was selected','Error','error')
    end
D_in=input('Enter value for Dilution:');
    if D_in>=0
        D=D_in;
    else
        D=default_value(8);
        msgbox('The value entered for Dilution was not valid so default value was selected','Error','error')
    end
Spin_in=input('Concentration of substrate to add to the system:');
    if Spin_in>=0
        Spin=Spin_in;
    else
        Spin=default_value(9);
        msgbox('The value entered for Spin was not valid so default value was selected','Error','error')
    end
time_in=input('Number of days:');
    if time_in>=0
        time=time_in;
    else
        time=default_value(10);
        msgbox('The value entered for time was not valid so default value was selected','Error','error')
    end
    
if arg==1  
Ksp_in=input('Select propionate half saturation constant (Ksp>0):');
    if Ksp_in>=0
        Ksp=Ksp_in;
    else
        Ksp=default_value(12);
        msgbox('The value entered for Ksp was not valid so default value was selected','Error','error')
    end

KsH_in=input('Select hydrogen half saturation constant (KsH>0):');
    if KsH_in>=0
        KsH=KsH_in;
    else
        KsH=default_value(13);
        msgbox('The value entered for KsH was not valid so default value was selected','Error','error')
    end
    
    p=[kmp Yp kdecp kmH YH kdecH KIH D Spin time Ksp KsH];
    
elseif arg==2
    Ksxp_in=input('Select Ksxp constant (Ksxp>0):');
    if Ksxp_in>=0
        Ksxp=Ksxp_in;
    else
        Ksxp=default_value(16);
        msgbox('The value entered for Ksxp was not valid so default value was selected','Error','error')
    end

    KsxH_in=input('Select KsxH constant (KsxH>0):');
    if KsxH_in>=0
        KsxH=KsxH_in;
    else
        KsxH=default_value(17);
        msgbox('The value entered for KsxH was not valid so default value was selected','Error','error')
    end
    
    p=[kmp Yp kdecp kmH YH kdecH KIH D Spin time Ksxp KsxH];
    
elseif arg==3
    kp_in=input('Select kp constant (kp>0):');
    if kp_in>=0
        kp=kp_in;
    else
        kp=default_value(14);
        msgbox('The value entered for kp was not valid so default value was selected','Error','error')
    end

    kH_in=input('Select kH constant (kH>0):');
    if kH_in>=0
        kH=kH_in;
    else
        kH=default_value(15);
        msgbox('The value entered for kH was not valid so default value was selected','Error','error')
    end

    p=[kmp Yp kdecp kmH YH kdecH KIH D Spin time kp kH];
    
elseif arg==4 
    Ksp_in=input('Select propionate half saturation constant (Ksp>0):');
    if Ksp_in>=0
        Ksp=Ksp_in;
    else
        Ksp=default_value(12);
        msgbox('The value entered for Ksp was not valid so default value was selected','Error','error')
    end

    KsH_in=input('Select hydrogen half saturation constant (KsH>0):');
    if KsH_in>=0
        KsH=KsH_in;
    else
        KsH=default_value(13);
        msgbox('The value entered for KsH was not valid so default value was selected','Error','error')
    end
    
       N_in=input('Select N (N>0):');
    if N_in>=0
        N=N_in;
    else
        N=default_value(18);
        msgbox('The value entered for N was not valid so default value was selected','Error','error')
    end
    
    p=[kmp Yp kdecp kmH YH kdecH KIH D Spin time Ksp KsH N];
    
elseif arg==5  

Ksp_in=input('Select propionate half saturation constant (Ksp>0):');
    if Ksp_in>=0
        Ksp=Ksp_in;
    else
        Ksp=default_value(12);
        msgbox('The value entered for Ksp was not valid so default value was selected','Error','error')
    end

KsH_in=input('Select hydrogen half saturation constant (KsH>0):');
    if KsH_in>=0
        KsH=KsH_in;
    else
        KsH=default_value(13);
        msgbox('The value entered for KsH was not valid so default value was selected','Error','error')
    end
    
    Ks0p_in=input('Select Ks0p (Ks0p>0):');
    if Ks0p_in>=0
        Ks0p=Ks0p_in;
    else
        Ks0p=default_value(19);
        msgbox('The value entered for Ks0p was not valid so default value was selected','Error','error')
    end

Ks0H_in=input('Select Ks0H (Ks0H>0):');
    if Ks0H_in>=0
        Ks0H=Ks0H_in;
    else
        Ks0H=default_value(20);
        msgbox('The value entered for Ks0H was not valid so default value was selected','Error','error')
    end
    
    SHin_in=input('Concentration of substrate H to add to the system:');
    if SHin_in>=0
        SHin=SHin_in;
    else
        SHin=default_value(11);
        msgbox('The value entered for SHin was not valid so default value was selected','Error','error')
    end
    
    p=[kmp Yp kdecp kmH YH kdecH KIH D Spin time Ksp KsH Ks0p Ks0H SHin];
    
end 
end
end