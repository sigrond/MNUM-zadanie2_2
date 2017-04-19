function [ Q, R ] = ModGSQR( A )
%ModGSQR zmodyfikowany algorytm rozk³adu QR Grama-Shmidta
%   A - macierz wejœciowa
%   Q - macierz wyjœciowa ortogonalna
%   R - macierz wyjœciowa górna trójk¹tna
[m,n]=size(A);%macierz A mo¿e nie byæ kwadratowa
Q=zeros(m,n);
R=zeros(n,n);
d=zeros(1,n);
for i=1:n %rozk³ad QR
    Q(:,i)=A(:,i);
    R(i,i)=1;
    d(i)=Q(:,i)'*Q(:,i);
    for j=i+1:n
        R(i,j)=(Q(:,i)'*A(:,j))/d(i);
        A(:,j)=A(:,j)-R(i,j)*Q(:,i);
    end
end
for i=1:n %normowanie uk³adu
    dd=norm(Q(:,i));
    Q(:,i)=Q(:,i)/dd;
    R(i,i:n)=R(i,i:n)*dd;
end
end

