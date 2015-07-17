%This function detrmines the stability of the fixed points
function stability=stab(evalues)
%Sets up some vectors (a1, a2, a3) for the calculation of the stability 
for i=1:length(evalues)
    if real(evalues(i))<0 
        a1(i)=1;  
    else
        a1(i)=0;  
    end
    if real(evalues(i))< 10^(-5) && real(evalues(i))>0
        a2(i)=1;
    else
        a2(i)=0;
    end
    if real(evalues(i))>10^(-5)
        a3(i)=1;
    else
        a3(i)=0;
    end
end
    
%Shows stability of the fixed point
    if sum(a1)==length(evalues)
        stability='Stable fixed point';
    elseif sum(a1)<length(evalues) && sum(a2)<length(evalues) && sum(a3)==0
        stability='Marginally stable';
    elseif sum(a3)>0
        stability='Unstable fixed point';
    end