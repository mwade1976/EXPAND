%This function that allows the user to input the initial conditions for the
%numerical solver (this is for Commensalism, Predation and Cooperation)

function init=input_initial_general_for_arg_1_3_5(default)

%Define initial conditions (A(0),a(0), B(0), b(0))

if default==1

init=[0.1, 0.1, 0.1, 0.1];

else
    
A_init_in=input('Enter initial value of A(>0):');
    if A_init_in>=0
        A_init=A_init_in;
    else
        A_init=0.1; %default value
        msgbox('The value entered for the initial value of A was not valid so default value was selected','Error','error')
    end
a_init_in=input('Enter initial value of a(>0):');
    if a_init_in>=0
        a_init=a_init_in;
    else
        a_init=0.1; %default value
        msgbox('The value entered for the initial value of a was not valid so default value was selected','Error','error')
    end
B_init_in=input('Enter initial value of B(>0):');
    if B_init_in>=0
        B_init=B_init_in;
    else
        B_init=0.1; %default value
        msgbox('The value entered for the initial value of B was not valid so default value was selected','Error','error')
    end
b_init_in=input('Enter initial value of b(>0):');
    if b_init_in>=0
        b_init=b_init_in;
    else
        b_init=0.1; %default value
        msgbox('The value entered for the initial value of b was not valid so default value was selected','Error','error')
    end
init=[A_init, a_init, B_init, b_init];
end