%This function defines the parameters used for the numerical input for
%different motifs
function [p, D1 kmA1 kmB1 kmC1 KsA1 KsB1 KsC1 KIB1 KIC1 A_in1 C_in1 gamma01 Y_A1 Y_B1 k_A1 k_B1 k_C1 time1]=Input_numeric_general(default,arg)

if default==1
%A vector of default values of parameters
D1=0.001; gamma01=0.5; Y_A1=0.04; Y_B1=0.06; A_in1=5; B_in1=3; C_in1=2; k_B1=0.0005; kmA1=13; kmB1=35; kmC1=12; KsA1=0.3; KsB1=0.000025; KsC1=0.00001; k_A1=0.004; KIB1=0.0000035; KIC1=0.000005; time1=1000; k_C1=0.004;
            if arg==1 || arg==3 || arg==5
                      p=[kmA1 KsA1 kmB1 KsB1 D1 Y_A1 Y_B1 A_in1 gamma01 k_A1 k_B1 time1 KIB1];
            elseif arg==2
                      p=[kmA1 KsA1 D1 Y_A1 Y_B1 A_in1 k_A1 k_B1 time1];
            elseif arg==4
                      p=[kmA1 KsA1 kmC1 KsC1 D1 Y_B1 A_in1 C_in1 gamma01 k_A1 k_B1 time1];
            elseif arg==6
                      p=[kmA1 KsA1 kmC1 KsC1 D1 Y_A1 Y_B1 A_in1 C_in1 gamma01 k_A1 k_C1 time1 KIB1 KIC1];
            end
else
%Enter parameter values (with certain criteria that need to be met
%otherwise a default value will be selected)
D1=0.001; gamma01=0.5; Y_A1=0.04; Y_B1=0.06; A_in1=5; C_in1=2; k_B1=0.0005; kmA1=13; kmB1=35; kmC1=12; KsA1=0.3; KsB1=0.000025; KsC1=0.00001; k_A1=0.004; KIB1=0.0000035; KIC1=0.000005; time1=1000; k_C1=0.004;

Y_B_in=input('Select YB (YB>0):');
    if Y_B_in>=0
        Y_B=Y_B_in;
    else
        Y_B=Y_B1;
        msgbox('The value entered for Y_B was not valid so default value was selected','Error','error')
    end
k_A_in=input('Select propionate decay constant/maintenance value (0<k_A<1):');
    if k_A_in>=0 && k_A_in<=1
        k_A=k_A_in;
    else
        k_A=k_A1;
        msgbox('The value entered for k_A was not valid so default value was selected','Error','error')
    end
D_in=input('Enter value for Dilution:');
    if D_in>=0
        D=D_in;
    else
        D=D1;
        msgbox('The value entered for Dilution was not valid so default value was selected','Error','error')
    end
time_in=input('Number of days:');
    if time_in>=0
        time=time_in;
    else
        time=time1;
        msgbox('The value entered for time was not valid so default value was selected','Error','error')
    end
A_in_in=input('Concentration of substrate A to add to the system:');
    if A_in_in>=0
        A_in=A_in_in;
    else
        A_in=A_in1;
        msgbox('The value entered for A_in was not valid so default value was selected','Error','error')
    end

if arg==1 || arg==3 || arg==5
    kmA_in=input('Select maximum specific propionate growth rate (kmA>0):');
    if kmA_in>=0
        kmA=kmA_in;
    else
        kmA=kmA1;
        msgbox('The value entered for kmA was not valid so default value was selected','Error','error')
    end
Y_A_in=input('Select propionate substrate yield value (Y_A>0):');
    if Y_A_in>=0
        Y_A=Y_A_in;
    else
        Y_A=Y_A1;
        msgbox('The value entered for Y_A was not valid so default value was selected','Error','error')
    end
kmB_in=input('Select maximum specific hydrogen growth rate (kmB>0):');
    if kmB_in>=0
        kmB=kmB_in;
    else
        kmB=kmB1;
        msgbox('The value entered for kmB was not valid so default value was selected','Error','error')
    end
KIB_in=input('Select hydrogen inhibition value (KIB>0)');
    if KIB_in>=0
        KIB=KIB_in;
    else
        KIB=KIB1;
        msgbox('The value entered for KIB was not valid so default value was selected','Error','error')
    end
KsA_in=input('Select propionate half saturation constant (KsA>0):');
    if KsA_in>=0
        KsA=KsA_in;
    else
        KsA=KsA1;
        msgbox('The value entered for KsA was not valid so default value was selected','Error','error')
    end
KsB_in=input('Select substrate B half saturation constant (KsB>0):');
    if KsB_in>=0
        KsB=KsB_in;
    else
        KsB=KsB1;
        msgbox('The value entered for KsB was not valid so default value was selected','Error','error')
    end
gamma0_in=input('Select gamma0 (gamma0>0):');
    if gamma0_in>=0
        gamma0=gamma0_in;
    else
        gamma0=gamma01;
        msgbox('The value entered for gamma0 was not valid so default value was selected','Error','error')
    end 
k_B_in=input('Select k_B value (0<k_B<1):');
if k_B_in>=0 && k_A_in<=1
    k_B=k_B_in;
else
    k_B=k_B1;
    msgbox('The value entered for k_B was not valid so default value was selected','Error','error')
end
          p=[kmA KsA kmB KsB D Y_A Y_B A_in gamma0 k_A k_B time KIB];          
elseif arg==2
kmA_in=input('Select maximum specific propionate growth rate (kmA>0):');
    if kmA_in>=0
        kmA=kmA_in;
    else
        kmA=kmA1;
        msgbox('The value entered for kmA was not valid so default value was selected','Error','error')
    end
Y_A_in=input('Select propionate substrate yield value (Y_A>0):');
    if Y_A_in>=0
        Y_A=Y_A_in;
    else
        Y_A=Y_A1;
        msgbox('The value entered for Y_A was not valid so default value was selected','Error','error')
    end
KsA_in=input('Select propionate half saturation constant (KsA>0):');
    if KsA_in>=0
        KsA=KsA_in;
    else
        KsA=KsA1;
        msgbox('The value entered for KsA was not valid so default value was selected','Error','error')
    end
k_B_in=input('Select k_B value (0<k_B<1):');
if k_B_in>=0 && k_A_in<=1
    k_B=k_B_in;
else
    k_B=k_B1;
    msgbox('The value entered for k_B was not valid so default value was selected','Error','error')
end    
          p=[kmA KsA D Y_A Y_B A_in k_A k_B time];
elseif arg==4
kmA_in=input('Select maximum specific hydrogen growth rate (kmA>0):');
    if kmA_in>=0
        kmA=kmA_in;
    else
        kmA=kmA1;
        msgbox('The value entered for kmA was not valid so default value was selected','Error','error')
    end
C_in_in=input('Concentration of substrate C to add to the system:');
    if C_in_in>=0
        C_in=C_in_in;
    else
        C_in=C_in1;
        msgbox('The value entered for C_in was not valid so default value was selected','Error','error')
    end    
KsA_in=input('Select substrate A half saturation constant (KsA>0):');
    if KsA_in>=0
        KsA=KsA_in;
    else
        KsA=KsA1;
        msgbox('The value entered for KsA was not valid so default value was selected','Error','error')
    end    
gamma0_in=input('Select gamma0 (gamma0>0):');
    if gamma0_in>=0
        gamma0=gamma0_in;
    else
        gamma0=gamma01;
        msgbox('The value entered for gamma0 was not valid so default value was selected','Error','error')
    end   
kmC_in=input('Select maximum specific propionate growth rate (kmC>0):');
    if kmC_in>=0
        kmC=kmC_in;
    else
        kmC=kmC1;
        msgbox('The value entered for kmC was not valid so default value was selected','Error','error')
    end
KsC_in=input('Select maximum specific propionate growth rate (KsC>0):');
    if KsC_in>=0
        KsC=KsC_in;
    else
        KsC=KsC1;
        msgbox('The value entered for KsC was not valid so default value was selected','Error','error')
    end 
k_B_in=input('Select k_B value (0<k_B<1):');
if k_B_in>=0 && k_A_in<=1
    k_B=k_B_in;
else
    k_B=k_B1;
    msgbox('The value entered for k_B was not valid so default value was selected','Error','error')
end
          p=[kmB KsB kmC KsC D Y_B A_in C_in gamma0 k_A k_B time];
elseif arg==6
kmA_in=input('Select maximum specific propionate growth rate (kmA>0):');
    if kmA_in>=0
        kmA=kmA_in;
    else
        kmA=kmA1;
        msgbox('The value entered for kmA was not valid so default value was selected','Error','error')
    end
Y_A_in=input('Select propionate substrate yield value (Y_A>0):');
    if Y_A_in>=0
        Y_A=Y_A_in;
    else
        Y_A=Y_A1;
        msgbox('The value entered for Y_A was not valid so default value was selected','Error','error')
    end
KIB_in=input('Select hydrogen inhibition value (KIB>0)');
    if KIB_in>=0
        KIB=KIB_in;
    else
        KIB=KIB1;
        msgbox('The value entered for KIB was not valid so default value was selected','Error','error')
    end
C_in_in=input('Concentration of substrate C to add to the system:');
    if C_in_in>=0
        C_in=C_in_in;
    else
        C_in=C_in1;
        msgbox('The value entered for C_in was not valid so default value was selected','Error','error')
    end    
KsA_in=input('Select propionate half saturation constant (KsA>0):');
    if KsA_in>=0
        KsA=KsA_in;
    else
        KsA=KsA1;
        msgbox('The value entered for KsA was not valid so default value was selected','Error','error')
    end
gamma0_in=input('Select gamma0 (gamma0>0):');
    if gamma0_in>=0
        gamma0=gamma0_in;
    else
        gamma0=gamma01;
        msgbox('The value entered for gamma0 was not valid so default value was selected','Error','error')
    end   
kmC_in=input('Select maximum specific propionate growth rate (kmC>0):');
    if kmC_in>=0
        kmC=kmC_in;
    else
        kmC=kmC1;
        msgbox('The value entered for kmC was not valid so default value was selected','Error','error')
    end
KsC_in=input('Select maximum specific propionate growth rate (KsC>0):');
    if KsC_in>=0
        KsC=KsC_in;
    else
        KsC=KsC1;
        msgbox('The value entered for KsC was not valid so default value was selected','Error','error')
    end     
KIC_in=input('Select hydrogen inhibition value (KIC>0)');
    if KIC_in>=0
        KIC=KIC_in;
    else
        KIC=KIC1;
        msgbox('The value entered for KIC was not valid so default value was selected','Error','error')
    end 
k_C_in=input('Select k_C (k_C>0):');
    if k_C_in>=0
        k_C=k_C_in;
    else
        k_C=k_C1;
        msgbox('The value entered for k_C was not valid so default value was selected','Error','error')
    end
          p=[kmA KsA kmC KsC D Y_A Y_B A_in C_in gamma0 k_A k_C time KIB KIC];
end
end
