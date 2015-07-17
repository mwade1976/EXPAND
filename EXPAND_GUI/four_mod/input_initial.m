%This function allows the user to input the initial conditions for the
%numerical solver

function init=input_initial(default)


%Define initial conditions (Sp(0),Xp(0), SH(0), XH(0))

if default==1

init=[0.1, 0.1, 0.1, 0.1];

else
    
Sp_init_in=input('Enter initial value of Sp(>0):');
    if Sp_init_in>=0
        Sp_init=Sp_init_in;
    else
        Sp_init=0.1; %Default value
        msgbox('The value entered for the initial value of Sp was not valid so default value was selected','Error','error')
    end
Xp_init_in=input('Enter initial value of Xp(>0):');
    if Xp_init_in>=0
        Xp_init=Xp_init_in;
    else
        Xp_init=0.1; %Default value
        msgbox('The value entered for the initial value of Xp was not valid so default value was selected','Error','error')
    end
SH_init_in=input('Enter initial value of SH(>0):');
    if SH_init_in>=0
        SH_init=SH_init_in;
    else
        SH_init=0.1; %Default value
        msgbox('The value entered for the initial value of SH was not valid so default value was selected','Error','error')
    end
XH_init_in=input('Enter initial value of XH(>0):');
    if XH_init_in>=0
        XH_init=XH_init_in;
    else
        XH_init=0.1; %Default value
        msgbox('The value entered for the initial value of XH was not valid so default value was selected','Error','error')
    end
    
init=[Sp_init, Xp_init, SH_init, XH_init];
end