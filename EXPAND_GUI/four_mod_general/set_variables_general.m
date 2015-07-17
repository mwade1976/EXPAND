%This function sets the variables for different motifs
function var=set_variables_general(arg)

syms D kmA kmB kmC KsA KsB KsC A B C KIB KIC A_in C_in a b gamma0 Y_A Y_B k_A k_B k_C time

if arg==1
        var=[kmA KsA kmB KsB D Y_A Y_B A_in gamma0 k_A k_B time KIB];
elseif arg==2
        var=[kmA KsA D Y_A Y_B A_in k_A k_B time];
elseif arg==3
        var=[kmA KsA kmB KsB D Y_A Y_B A_in gamma0 k_A k_B time KIB];
elseif arg==4
        var=[kmA KsA kmC KsC D Y_B A_in C_in gamma0 k_A k_B time];
elseif arg==5
        var=[kmA KsA kmB KsB D Y_A Y_B A_in gamma0 k_A k_B time KIB];
elseif arg==6
        var=[kmA KsA kmC KsC D Y_A Y_B A_in C_in gamma0 k_A k_C time KIB KIC];
end

