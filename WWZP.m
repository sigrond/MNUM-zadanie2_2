function [ ww, iter, status ] = WWZP( A )
%WWZP obliczanie wartoœci w³asnych metod¹ QR z przesuniêciami
%   A - macierz wejœciowa
%   ww - wartoœci w³asne
maxIter=1e5;
iter=0;
status=1;
n=size(A,1);
ww=diag(zeros(n));
AO=A;%oryginalna macierz wejœciowa
for k=n:-1:2
    AK=AO;
    i=0;
    while i<=maxIter && max(abs(AK(k,1:k-1)))>1e-6
        AA=AK(k-1:k,k-1:k);%prawy dolny róg 2x2
        [ww1,ww2]=QPNR(1,-(AA(1,1)+AA(2,2)),AA(2,2)*AA(1,1)-AA(2,1)*AA(1,2));
        if abs(ww1-AA(2,2))<abs(ww2-AA(2,2))
            shift=ww1;
        else
            shift=ww2;
        end
        AK=AK-eye(k)*shift;%macierz przesuniêta
        [q, r]=ModGSQR(AK);
        AK=r*q+eye(k)*shift;%macierz przekszta³cona
        i=i+1;
        iter=iter+1;
    end
    if i>maxIter
        disp('maxIter')
        status=0;
    end
    ww(k)=AK(k,k);
    if k>2
        AO=AK(1:k-1,1:k-1);%deflacja macierzy
    else
        ww(1)=AK(1,1);
    end
end

