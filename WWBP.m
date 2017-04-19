function [ ww, iter, status ] = WWBP( A )
%WWBP obliczanie warto�ci w�asnych metod� rozk�adu QR bez przesuni��
%   A - macierz wej�ciowa symetryczna
%   ww - warto�ci w�asne
%   iter - liczba wykonanych iteracji
%   status - spos�b zako�czenia
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

