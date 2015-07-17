% This script calculates the Jacobian and the numeric Jacobian and then
% works out the eigenvalues and determines the stability for each fixed
% point (The above are different for different motifs)
if arg==1 || arg==3 || arg==5
%Calculate the components of the jacobian
J_11=diff(A_dot,A); J_12=diff(A_dot,a); J_13=diff(A_dot,B); J_14=diff(A_dot,b); 
J_21=diff(a_dot,A); J_22=diff(a_dot,a); J_23=diff(a_dot,B); J_24=diff(a_dot,b); 
J_31=diff(B_dot,A); J_32=diff(B_dot,a); J_33=diff(B_dot,B); J_34=diff(B_dot,b); 
J_41=diff(b_dot,A); J_42=diff(b_dot,a); J_43=diff(b_dot,B); J_44=diff(b_dot,b); 
%Calculate the analytic Jacobian
J_analytic=simplify([J_11 J_12 J_13 J_14; J_21 J_22 J_23 J_24; J_31 J_32 J_33 J_34; J_41 J_42 J_43 J_44]);

%This substitutes the parameters in for the variables. This gives us a
%numeric Jacobain. Then we calculate the eigenvalues of the Jacobian
J_numeric=subs(J_analytic,variables,parameters);
for i=1:length(fixed_numerical(:,1))
J_num_fix(:,:,i)=subs(J_numeric,[A a B b],[A_fix_num(i,1), a_fix_num(i,1), B_fix_num(i,1), b_fix_num(i,1)]);
evalues(:,i)=eig(J_num_fix(:,:,i));
end

%This gives the user the option to see the eigenvalues
show_eig=menu('Show eigenvalues?','Yes','No');
if show_eig==1
%This displays the stability of each fixed point
disp('Stability for each fixed point:')
for i=1:length(evalues(1,:))
disp(stab(evalues(:,i)))
end
else
end
end

elseif arg==2
%Calculate the components of the jacobian
J_11=diff(A_dot,A); J_12=diff(A_dot,a); J_13=diff(A_dot,b);
J_21=diff(a_dot,A); J_22=diff(a_dot,a); J_23=diff(a_dot,b); 
J_31=diff(b_dot,A); J_32=diff(b_dot,a); J_33=diff(b_dot,b); 
%Calculate the analytic Jacobian
J_analytic=simplify([J_11 J_12 J_13 ; J_21 J_22 J_23 ; J_31 J_32 J_33]);

%This substitutes the parameters in for the variables. This gives us a
%numeric Jacobain. Then we calculate the eigenvalues of the Jacobian
J_numeric=subs(J_analytic,variables,parameters);
for i=1:length(fixed_numerical(:,1))
J_num_fix(:,:,i)=subs(J_numeric,[A a b],[A_fix_num(i,1), a_fix_num(i,1), b_fix_num(i,1)]);
evalues(:,i)=eig(J_num_fix(:,:,i));
end

%This gives the user the option to see the eigenvalues
show_eig=menu('Show eigenvalues?','Yes','No');
if show_eig==1
disp('Stability for each fixed point:')
for i=1:length(evalues(1,:))
%This displays the stability of each fixed point
disp(stab(evalues(:,i)))
end
else
end
end

elseif arg==4
%Calculate the components of the jacobian
J_11=diff(A_dot,A); J_12=diff(A_dot,a); J_13=diff(A_dot,C); J_14=diff(A_dot,b); 
J_21=diff(a_dot,A); J_22=diff(a_dot,a); J_23=diff(a_dot,C); J_24=diff(a_dot,b); 
J_31=diff(C_dot,A); J_32=diff(C_dot,a); J_33=diff(C_dot,C); J_34=diff(C_dot,b); 
J_41=diff(b_dot,A); J_42=diff(b_dot,a); J_43=diff(b_dot,C); J_44=diff(b_dot,b); 
%calculate the analytic Jacobian
J_analytic=simplify([J_11 J_12 J_13 J_14; J_21 J_22 J_23 J_24; J_31 J_32 J_33 J_34; J_41 J_42 J_43 J_44]);

%This substitutes the parameters in for the variables. This gives us a
%numeric Jacobain. Then we calculate the eigenvalues of the Jacobian
J_numeric=subs(J_analytic,variables,parameters);
for i=1:length(fixed_numerical(:,1))
J_num_fix(:,:,i)=subs(J_numeric,[A a C b],[A_fix_num(i,1), a_fix_num(i,1), C_fix_num(i,1), b_fix_num(i,1)]);
evalues(:,i)=eig(J_num_fix(:,:,i));
end

%This gives the user the option to see the eigenvalues
show_eig=menu('Show eigenvalues?','Yes','No');
if show_eig==1
%This displays the stability of each fixed point
disp('Stability for each fixed point:')
for i=1:length(evalues(1,:))
disp(stab(evalues(:,i)))
end
else
end
end

elseif arg==6
%Calculate the components of the jacobian
J_11=diff(A_dot,A); J_12=diff(A_dot,a); J_13=diff(A_dot,B); J_14=diff(A_dot,b); J_15=diff(A_dot,C);
J_21=diff(a_dot,A); J_22=diff(a_dot,a); J_23=diff(a_dot,B); J_24=diff(a_dot,b); J_25=diff(a_dot,C);
J_31=diff(B_dot,A); J_32=diff(B_dot,a); J_33=diff(B_dot,B); J_34=diff(B_dot,b); J_35=diff(B_dot,C);
J_41=diff(b_dot,A); J_42=diff(b_dot,a); J_43=diff(b_dot,B); J_44=diff(b_dot,b); J_45=diff(b_dot,C);
J_51=diff(C_dot,A); J_52=diff(C_dot,a); J_53=diff(C_dot,B); J_54=diff(C_dot,b); J_55=diff(C_dot,C);
%Calculate the analytic Jacobian
J_analytic=simplify([J_11 J_12 J_13 J_14 J_15; J_21 J_22 J_23 J_24 J_25; J_31 J_32 J_33 J_34 J_35; J_41 J_42 J_43 J_44 J_45; J_55]);

%This substitutes the parameters in for the variables. This gives us a
%numeric Jacobain. Then we calculate the eigenvalues of the Jacobian
J_numeric=subs(J_analytic,variables,parameters);
for i=1:length(fixed_numerical(:,1))
J_num_fix(:,:,i)=subs(J_numeric,[A a B b C],[A_fix_num(i,1), a_fix_num(i,1), B_fix_num(i,1), b_fix_num(i,1), C_fix_num(i,1)]);
evalues(:,i)=eig(J_num_fix(:,:,i));
end

%This gives the user the option to see the eigenvalues
show_eig=menu('Show eigenvalues?','Yes','No');
if show_eig==1
%This displays the stability of each fixed point
disp('Stability for each fixed point:')
for i=1:length(evalues(1,:))
disp(stab(evalues(:,i)))
end
else
end
end