function [ output_args ] = Zadanie1( input_args )
%Zadanie1 rozwi¹zanie zadania 1
%   Detailed explanation goes here
MINoSh5=0;
FNoSh5=0;
MIShSym5=0;
FShSym5=0;
MIShNoSym5=0;
FShNoSym5=0;
MINoSh10=0;
FNoSh10=0;
MIShSym10=0;
FShSym10=0;
MIShNoSym10=0;
FShNoSym10=0;
MINoSh20=0;
FNoSh20=0;
MIShSym20=0;
FShSym20=0;
MIShNoSym20=0;
FShNoSym20=0;
for i=1:30
    A=rand(5);
    B=A+A';
    [ww, iter, status]=WWBP(B);
    MINoSh5=MINoSh5+iter;
    if ~status
        FNoSh5=FNoSh5+1;
    end
    [ww, iter, status]=WWZP(B);
    MIShSym5=MIShSym5+iter;
    if ~status
        FShSym5=FShSym5+1;
    end
    [ww, iter, status]=WWZP(A);
    MIShNoSym5=MIShNoSym5+iter;
    if ~status
        FShNoSym5=FShNoSym5+1;
    end
    
    A=rand(10);
    B=A+A';
    [ww, iter, status]=WWBP(B);
    MINoSh10=MINoSh10+iter;
    if ~status
        FNoSh10=FNoSh10+1;
    end
    [ww, iter, status]=WWZP(B);
    MIShSym10=MIShSym10+iter;
    if ~status
        FShSym10=FShSym10+1;
    end
    [ww, iter, status]=WWZP(A);
    MIShNoSym10=MIShNoSym10+iter;
    if ~status
        FShNoSym10=FShNoSym10+1;
    end
    
    A=rand(20);
    B=A+A';
    [ww, iter, status]=WWBP(B);
    MINoSh20=MINoSh20+iter;
    if ~status
        FNoSh20=FNoSh20+1;
    end
    [ww, iter, status]=WWZP(B);
    MIShSym20=MIShSym20+iter;
    if ~status
        FShSym20=FShSym20+1;
    end
    [ww, iter, status]=WWZP(A);
    MIShNoSym20=MIShNoSym20+iter;
    if ~status
        FShNoSym20=FShNoSym20+1;
    end
end

MINoSh5=MINoSh5/30
FNoSh5
MIShSym5=MIShSym5/30
FShSym5
MIShNoSym5=MIShNoSym5/30
FShNoSym5
MINoSh10=MINoSh10/30
FNoSh10
MIShSym10=MIShSym10/30
FShSym10
MIShNoSym10=MIShNoSym10/30
FShNoSym10
MINoSh20=MINoSh20/30
FNoSh20
MIShSym20=MIShSym20/30
FShSym20
MIShNoSym20=MIShNoSym20/30
FShNoSym20

%% b
A=rand(5)
B=A+A'
[ww, iter, status]=WWBP(B)
ww=sort(ww)
wwg=eig(B)
eWWBP=norm(ww-wwg)
[ww, iter, status]=WWZP(B)
ww=sort(ww)
eWWZP=norm(ww-wwg)
wwg=eig(A)
wwg=sort(wwg)
[ww, iter, status]=WWZP(A)
ww=sort(ww)
eWWZP=norm(ww-wwg)

end

