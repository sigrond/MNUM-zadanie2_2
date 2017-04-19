function [ ww, iter, status ] = WWBP( A )
%WWBP obliczanie wartoœci w³asnych metod¹ rozk³adu QR bez przesuniêæ
%   A - macierz wejœciowa symetryczna
%   ww - wartoœci w³asne
%   iter - liczba wykonanych iteracji
%   status - sposób zakoñczenia
maxIter=1e5;
status=1;
for i=1:maxIter
    b=A-diag(diag(A));
    if max(max(abs(b)))<1e-6
        break;
    end
    [q, r]=ModGSQR(A);
    %[q, r]=qr(A);
    A=r*q;
    ww=diag(A);
    if i==maxIter
        disp('maxIter')
        status=0;
    end
    iter=i;
end

