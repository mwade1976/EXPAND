%This function finds the fixed points for the 4 ODE system (for Cooperation) analytically
function [Sp_fix, Xp_fix, SH_fix, XH_fix, fp_fix, fH_fix, I2_fix] = find_fixed_pointnew(arg,eq1,eq2,eq3,eq4,fp,fH,I2)    %arg will be a menu function with options corresponding to the following growth functions
%arg=menu('Choose growth
%function...','Monod','Contois','Tessier','Moser','Blackman','Modified
%Monod')

syms Sp Xp SH XH kmp Ksp Yp kdecp kmH KsH YH kdecH KIH D Spin SHin Ksxp KsxH kp kH Ks0p Ks0H N;

if arg~=2
        %Solve eqn4 for SH
        SH_fix=simplify(solve(eq4==0,SH));
        %I2 and fH depend only on SH so we can calculate their values at the fixed
        %point.
        I2_fix=simplify(subs(I2,SH,SH_fix));
        fH_fix=simplify(subs(fH,SH,SH_fix));
        %Evaluate the system at the fixed value of SH as we know that now
        eq1_1=subs(eq1,[SH I2 fH],[SH_fix I2_fix fH_fix]);
        eq2_1=subs(eq2,[SH I2 fH],[SH_fix I2_fix fH_fix]);
        eq3_1=subs(eq3,[SH I2 fH],[SH_fix I2_fix fH_fix]);
        eq4_1=subs(eq4,[SH I2 fH],[SH_fix I2_fix fH_fix]);
        
        %Solve eqn2 for Sp
        Sp_fix=simplify(solve(eq2_1==0,Sp));
        fp_fix=simplify(subs(fp,Sp,Sp_fix));
        %Substitute the value of Sp_fix as we know that now
        eq1_2=subs(eq1_1,[Sp fp],[Sp_fix fp_fix]);
        eq2_2=subs(eq2_1,[Sp fp],[Sp_fix fp_fix]);
        eq3_2=subs(eq3_1,[Sp fp],[Sp_fix fp_fix]);
        eq4_2=subs(eq4_1,[Sp fp],[Sp_fix fp_fix]);

        %Solve eqn1 for Xp
        Xp_fix=simplify(solve(eq1_2==0,Xp));
        eq1_3=subs(eq1_2,Xp,Xp_fix);
        eq2_3=subs(eq2_2,Xp,Xp_fix);
        eq3_3=subs(eq3_2,Xp,Xp_fix);
        eq4_3=subs(eq4_2,Xp,Xp_fix);
        
        %Solve eqn1 for XH
        XH_fix=simplify(solve(eq3_3==0,XH));
        
    
elseif arg==2
        %Solve eqn4 for SH as a function of XH
        SH_XH=simplify(solve(eq4==0,SH));
        %I2 and fH depend on SH so we can calculate their values at SH_XH
        I2_XH=simplify(subs(I2,SH,SH_XH));
        fH_XH=simplify(subs(fH,SH,SH_XH));
        %Evaluate the system at the function SH_XH to reduce the #variables
        eq1_1=subs(eq1,[SH I2 fH],[SH_XH I2_XH fH_XH]);     %function of Sp Xp XH
        eq2_1=subs(eq2,[SH I2 fH],[SH_XH I2_XH fH_XH]);     %function of Sp Xp XH
        eq3_1=subs(eq3,[SH I2 fH],[SH_XH I2_XH fH_XH]);     %function of Sp Xp XH
        eq4_1=subs(eq4,[SH I2 fH],[SH_XH I2_XH fH_XH]);     %function of XH
        
        %Solve eqn2 for Sp
        Sp_XH_Xp=simplify(solve(eq2_1==0,Sp));
        fp_XH_Xp=simplify(subs(fp,Sp,Sp_XH_Xp));
        %Substitute the value of Sp_fix as we know that now
        eq1_2=subs(eq1_1,[Sp fp],[Sp_XH_Xp fp_XH_Xp]);      %function of Xp XH
        eq2_2=subs(eq2_1,[Sp fp],[Sp_XH_Xp fp_XH_Xp]);      %function of Xp XH
        eq3_2=subs(eq3_1,[Sp fp],[Sp_XH_Xp fp_XH_Xp]);
        eq4_2=subs(eq4_1,[Sp fp],[Sp_XH_Xp fp_XH_Xp]);

        %Solve eqn1 for Xp
        Xp_XH=simplify(solve(eq1_2==0,Xp));
        eq1_3=subs(eq1_2,Xp,Xp_XH);
        eq2_3=subs(eq2_2,Xp,Xp_XH);
        eq3_3=subs(eq3_2,Xp,Xp_XH);
        eq4_3=subs(eq4_2,Xp,Xp_XH);
        
        %Substitute the values back into the equations for the fixed points
        XH_fix=solve(eq3_3==0,XH);
        Xp_fix=subs(Xp_XH,XH,XH_fix);
        Sp_fix1=subs(Sp_XH_Xp,XH,XH_fix);
        Sp_fix=simplify(subs(Sp_fix1,Xp,Xp_fix));
        SH_fix=subs(SH_XH,XH,XH_fix);
        fp_fix1=subs(fp,Sp,Sp_fix);
        fp_fix=subs(fp_fix1,Xp,Xp_fix);
        fH_fix1=subs(fH,SH,SH_fix);
        fH_fix=subs(fH_fix1,XH,XH_fix);
        I2_fix=subs(I2,SH,SH_fix);

end